package persistencia.DAO;

import persistencia.DAO.IDao;
import entidades.Incidente;
import entidades.Tecnico;
import enumerados.TipoEspecialidad;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import java.time.LocalDate;
import java.util.List;
import org.hibernate.Hibernate;

public class IncidenteDAO implements IDao<Incidente, Integer> {

    private EntityManagerFactory emF;

    public IncidenteDAO() {
        this.emF = Persistence.createEntityManagerFactory("JPA_PU");
    }

    @Override
    public void crear(Incidente incidente) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            em.persist(incidente);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public Incidente buscar(Integer idIncidente) {
        EntityManager em = null;
        Incidente incidente;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            incidente = em.find(Incidente.class, idIncidente);
            Hibernate.initialize(incidente.getProblemas());
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return incidente;
    }

    @Override
    public void actualizar(Incidente incidente) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            em.merge(incidente);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public void borrar(Incidente incidente) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            em.remove(incidente);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public List<Incidente> leerTodos() {
        EntityManager em = emF.createEntityManager();
        TypedQuery<Incidente> query = em.createQuery("SELECT i FROM Incidente i", Incidente.class);
        return query.getResultList();
    }

    public List<Incidente> buscarPorTecnico(Tecnico tecnico) {
        EntityManager em = emF.createEntityManager();
        TypedQuery<Incidente> query = em.createQuery("SELECT i FROM Incidente i WHERE tecnico = :tecnico", Incidente.class);
        query.setParameter("tecnico", tecnico);
        return query.getResultList();
    }

    public List<Incidente> obtenerResueltosPorTecnico(Tecnico tecnico) {
        EntityManager em = emF.createEntityManager();
        TypedQuery<Incidente> query = em.createQuery(
                "SELECT i FROM Incidente i WHERE i.tecnico = :tecnico AND i.resuelto = true",
                Incidente.class);

        query.setParameter("tecnico", tecnico);

        List<Incidente> incidentesResueltos = query.getResultList();
        return incidentesResueltos;
    }

    public List<Incidente> incidentesResueltosEnNDias(int n) {
        EntityManager em = emF.createEntityManager();
        TypedQuery<Incidente> query = em.createQuery(
                "SELECT i FROM Incidente i "
                + "WHERE i.resuelto = true AND i.fechaResolucion >= :fechaLimite",
                Incidente.class);

        query.setParameter("fechaLimite", LocalDate.now().minusDays(n));

        List<Incidente> incidentesFiltrados = query.getResultList();

        // Aquí puedes trabajar con la lista de incidentes filtrados
        return incidentesFiltrados;
    }

    public List<Incidente> incidentesResueltosPorEspecialidadEnNDias(int n, TipoEspecialidad tipoEspecialidad) {
        EntityManager em = emF.createEntityManager();
        TypedQuery<Incidente> query = em.createQuery(
                "SELECT DISTINCT i FROM Incidente i "
                + "JOIN i.problemas tp "
                + "JOIN tp.especialidades e "
                + "WHERE i.resuelto = true AND i.fechaResolucion >= :fechaLimite AND e.tipo = :tipoEspecialidad",
                Incidente.class);

        query.setParameter("fechaLimite", LocalDate.now().minusDays(n));
        query.setParameter("tipoEspecialidad", tipoEspecialidad);

        List<Incidente> incidentesFiltrados = query.getResultList();

        // Aquí puedes trabajar con la lista de incidentes filtrados
        return incidentesFiltrados;
    }
}
