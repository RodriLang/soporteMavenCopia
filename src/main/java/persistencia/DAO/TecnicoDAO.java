package persistencia.DAO;

import persistencia.DAO.IDao;
import entidades.Cliente;
import entidades.Tecnico;
import enumerados.TipoEspecialidad;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import java.time.LocalDate;
import java.util.List;
import org.hibernate.Hibernate;

public class TecnicoDAO implements IDao<Tecnico, Integer> {

    private EntityManagerFactory emF;

    public TecnicoDAO() {
        this.emF = Persistence.createEntityManagerFactory("JPA_PU");
    }

    @Override
    public void crear(Tecnico tecnico) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            Hibernate.initialize(tecnico.getEspecialidades());
            Hibernate.initialize(tecnico.getIncidentesAsignados());
            em.persist(tecnico);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public Tecnico buscar(Integer idTecnico) {
        EntityManager em = null;
        Tecnico tecnico;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            tecnico = em.find(Tecnico.class, idTecnico);
            Hibernate.initialize(tecnico.getEspecialidades());
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return tecnico;
    }

    @Override
    public void actualizar(Tecnico tecnico) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            em.merge(tecnico);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public void borrar(Tecnico tecnico) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            em.remove(tecnico);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public List<Tecnico> leerTodos() {
        EntityManager em = emF.createEntityManager();
        TypedQuery<Tecnico> query = em.createQuery("SELECT t FROM Tecnico t", Tecnico.class);
        return query.getResultList();
    }

    public Tecnico masResolucionesPorEspecialidad(int dias, TipoEspecialidad especialidad) {
        EntityManager em = emF.createEntityManager();
        TypedQuery<Tecnico> query = em.createQuery("SELECT t FROM Tecnico t JOIN t.incidentes i "
                + "WHERE i.resuelto = true AND i.fechaResolucion >= :fechaLimite AND :especialidad "
                + "MEMBER OF t.especialidades GROUP BY t ORDER BY COUNT(i) DESC"
,
                Tecnico.class);

        query.setParameter("fechaLimite", LocalDate.now().minusDays(dias));
        query.setParameter("especialidad", especialidad);

        query.setMaxResults(1); // Obtener solo el primer resultado (el técnico con más incidentes resueltos)

        Tecnico tecnicoConMasResueltos = query.getSingleResult();

// Aquí puedes trabajar con el técnico encontrado
        return tecnicoConMasResueltos;
    }

}
