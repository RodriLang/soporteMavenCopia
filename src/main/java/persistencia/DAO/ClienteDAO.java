package persistencia.DAO;

import persistencia.DAO.IDao;
import entidades.Cliente;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.Hibernate;
import org.hibernate.QueryParameterException;

public class ClienteDAO implements IDao<Cliente, Integer> {

    private EntityManagerFactory emF;

    public ClienteDAO() {

        this.emF = Persistence.createEntityManagerFactory("JPA_PU");
    }

    @Override
    public void crear(Cliente cliente) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            Hibernate.initialize(cliente.getServiciosContratados());
            Hibernate.initialize(cliente.getIncidentes());
            em.persist(cliente);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public Cliente buscar(Integer idCliente) {
        EntityManager em = null;
        Cliente cliente;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            cliente = em.find(Cliente.class, idCliente);
            Hibernate.initialize(cliente.getServiciosContratados());
            Hibernate.initialize(cliente.getIncidentes());
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return cliente;
    }

    @Override
    public void actualizar(Cliente cliente) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            em.merge(cliente);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public void borrar(Cliente cliente) {
        EntityManager em = null;
        try {
            em = emF.createEntityManager();
            em.getTransaction().begin();
            Cliente clienteGestionado = em.find(Cliente.class, cliente.getId());
            em.remove(clienteGestionado);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public List<Cliente> leerTodos() {
        EntityManager em = emF.createEntityManager();
        TypedQuery<Cliente> query = em.createQuery("SELECT c FROM Cliente c", Cliente.class);
        return query.getResultList();
    }

    public Cliente buscarPorCuit(String cuit) {
        EntityManager em = emF.createEntityManager();
        Cliente cliente = null;
        TypedQuery<Cliente> query = em.createQuery("SELECT c FROM Cliente c WHERE c.cuit = :cuit", Cliente.class);
        query.setParameter("cuit", cuit);
        try {
            cliente = query.getSingleResult();
            Hibernate.initialize(cliente.getServiciosContratados());
            Hibernate.initialize(cliente.getIncidentes());
        } catch (NoResultException e) {
            JOptionPane.showMessageDialog(null, "No se encontró ningún cliente con ese cuit");
            return null;
        } catch (RuntimeException e) {
            JOptionPane.showMessageDialog(null, "Error en la consulta JPQL: " + e.getMessage());
            return null;
        } finally {
            em.close();
        }
        return cliente;
    }

}
