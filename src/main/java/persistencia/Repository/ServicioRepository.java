package persistencia.Repository;

import entidades.Servicio;
import java.util.List;
import persistencia.DAO.ServicioDAO;


public class ServicioRepository {

    private ServicioDAO servicioDAO;

    public ServicioRepository(ServicioDAO servicioDAO) {
        this.servicioDAO = servicioDAO;
    }

    public void add(Servicio servicio) {
        System.err.println("crear servicio en servicioRepository");
        servicioDAO.crear(servicio);
    }

    public Servicio buscar(int idServicio) {
        return servicioDAO.buscar(idServicio);
    }

    public void actualizar(Servicio servicio) {
        servicioDAO.actualizar(servicio);
    }

    public void delete(Servicio servicio) {
        servicioDAO.borrar(servicio);
    }

    public List<Servicio> listarTodos() {
        return servicioDAO.leerTodos();
    }
}