package persistencia.Repository;

import entidades.Tecnico;
import enumerados.TipoEspecialidad;
import java.util.List;
import persistencia.DAO.TecnicoDAO;

public class TecnicoRepository {

    private TecnicoDAO tecnicoDAO;

    public TecnicoRepository(TecnicoDAO tecnicoDAO) {
        this.tecnicoDAO = tecnicoDAO;
    }

    public void add(Tecnico tecnico) {
        System.err.println("crear técnico en técnicoRepository");
        tecnicoDAO.crear(tecnico);
    }

    public Tecnico buscar(int idTecnico) {
        return tecnicoDAO.buscar(idTecnico);
    }

    public void actualizar(Tecnico tecnico) {
        tecnicoDAO.actualizar(tecnico);
    }

    public void delete(Tecnico tecnico) {
        tecnicoDAO.borrar(tecnico);
    }

    public List<Tecnico> listarTodos() {
        return tecnicoDAO.leerTodos();
    }
    public List<Tecnico>conIncidentesResueltosCantDias(int dias){
       List<Tecnico> tecnicos = tecnicoDAO.leerTodos();
       //tecnicos.stream().filter(tecnico -> tecnico.getEspecialidades())
        return tecnicoDAO.resolucionesPorDias(dias);
    }
}


