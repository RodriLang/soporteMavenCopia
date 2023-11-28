package persistencia.DAO;

import persistencia.DAO.IDao;
import entidades.Servicio;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class ServicioDAO implements IDao<Servicio, Integer> {

    private EntityManagerFactory emF;

    public ServicioDAO() {
        this.emF = Persistence.createEntityManagerFactory("JPA_PU");
    }

    @Override
    public void crear(Servicio servicio) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            em.persist(servicio);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public Servicio buscar(Integer idServicio) {
        EntityManager em = null;
        Servicio servicio;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            servicio = em.find(Servicio.class, idServicio);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return servicio;
    }

    @Override
    public void actualizar(Servicio servicio) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            em.merge(servicio);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public void borrar(Servicio servicio) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            em.remove(servicio);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public List<Servicio> leerTodos() {
        EntityManager em = emF.createEntityManager();
        TypedQuery<Servicio> query = em.createQuery("SELECT s FROM Servicio s", Servicio.class);
        return query.getResultList();
    }
}
