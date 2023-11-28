package persistencia.Repository;

import entidades.Incidente;
import entidades.Tecnico;
import enumerados.TipoEspecialidad;
import java.util.List;
import persistencia.DAO.IncidenteDAO;

public class IncidenteRepository {

    private IncidenteDAO incidenteDAO;

    public IncidenteRepository(IncidenteDAO incidenteDAO) {
        this.incidenteDAO = incidenteDAO;
    }

    public void add(Incidente incidente) {
        incidenteDAO.crear(incidente);
    }

    public Incidente buscar(int idIncidente) {
        return incidenteDAO.buscar(idIncidente);
    }

    public void actualizar(Incidente incidente) {
        incidenteDAO.actualizar(incidente);
    }

    public void delete(Incidente incidente) {
        incidenteDAO.borrar(incidente);
    }

    public List<Incidente> listarTodos() {
        return incidenteDAO.leerTodos();
    }

    public List<Incidente> buscarPorTecnico(Tecnico tecnico) {
        return incidenteDAO.buscarPorTecnico(tecnico);
    }

    public List<Incidente> obtenerResueltosPorTecnico(Tecnico tecnico) {
        return incidenteDAO.obtenerResueltosPorTecnico(tecnico);
    }
    public List<Incidente> incidentesResueltosPorEspecialidadEnNDias(int n, TipoEspecialidad tipoEspecialidad) {
        //return incidenteDAO.incidentesResueltosPorEspecialidadEnNDias(n, tipoEspecialidad);
        return incidenteDAO.incidentesResueltosEnNDias(n);
    }
}
