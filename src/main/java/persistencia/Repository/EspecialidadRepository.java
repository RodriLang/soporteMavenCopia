package persistencia.Repository;

import entidades.Especialidad;
import java.util.List;
import persistencia.DAO.EspecialidadDAO;

public class EspecialidadRepository {

    private EspecialidadDAO especialidadDAO;

    public EspecialidadRepository(EspecialidadDAO especialidadDAO) {
        this.especialidadDAO = especialidadDAO;
    }

    public void add(Especialidad especialidad) {
        System.err.println("crear especialidad en especialidadRepository");
        especialidadDAO.crear(especialidad);
    }

    public Especialidad buscar(int idEspecialidad) {
        return especialidadDAO.buscar(idEspecialidad);
    }

    public void actualizar(Especialidad especialidad) {
        especialidadDAO.actualizar(especialidad);
    }

    public void delete(Especialidad especialidad) {
        especialidadDAO.borrar(especialidad);
    }

    public List<Especialidad> listarTodos() {
        return especialidadDAO.leerTodos();
    }
}
