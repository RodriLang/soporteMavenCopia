package persistencia.DAO;

import entidades.Especialidad;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import java.util.List;
import persistencia.DAO.IDao;

public class EspecialidadDAO implements IDao< Especialidad, Integer> {

    private EntityManagerFactory emF;

    public EspecialidadDAO() {

        this.emF = Persistence.createEntityManagerFactory("JPA_PU");
    }

    @Override
    public void crear(Especialidad especialidad) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            em.persist(especialidad);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public Especialidad buscar(Integer idEspecialidad) {
        EntityManager em = null;
        Especialidad especialidad;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            especialidad = em.find(Especialidad.class, idEspecialidad);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return especialidad;
    }

    @Override
    public void actualizar(Especialidad especialidad) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            em.merge(especialidad);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public void borrar(Especialidad especialidad) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            em.remove(especialidad);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public List<Especialidad> leerTodos() {
        EntityManager em = emF.createEntityManager();
        TypedQuery< Especialidad> query = em.createQuery("SELECT c FROM  Especialidad c", Especialidad.class);
        return query.getResultList();
    }

}
