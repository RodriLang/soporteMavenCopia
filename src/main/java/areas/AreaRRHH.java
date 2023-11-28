package areas;

import entidades.Incidente;
import entidades.Tecnico;
import enumerados.TipoEspecialidad;
import java.util.Comparator;
import java.util.List;
import persistencia.Repository.IncidenteRepository;
import persistencia.Repository.TecnicoRepository;

public class AreaRRHH {

    private TecnicoRepository tecnicoRepo;
    private IncidenteRepository incidenteRepo;

    public AreaRRHH(TecnicoRepository tecnicoRepo, IncidenteRepository incidenteRepo) {
        this.tecnicoRepo = tecnicoRepo;
        this.incidenteRepo = incidenteRepo;
    }

    public void emitirReportePorTecnico(Tecnico tecnico) {
        System.out.println("\nReporte de incidentes del técnico " + tecnico.getNombre() + ":");

        incidenteRepo.buscarPorTecnico(tecnico).stream().forEach(incidente -> {
            String estado = incidente.isResuelto() ? "Resuelto" : "Sin resolver";
            System.out.println("\nid: " + incidente.getId() + "\nDescripcion: "
                    + incidente.getDescripcion() + "\nEstado: " + estado);
        });
    }

    public void emitirReporteDiario() {
        tecnicoRepo.listarTodos().stream()
                .forEach(tecnico -> {
                    if (incidenteRepo.buscarPorTecnico(tecnico).isEmpty()) {
                        System.out.println("El técnico " + tecnico.getNombre() + " no posee incidentes asignados.\n");
                    } else {
                        emitirReportePorTecnico(tecnico);
                    }
                });
    }

    public Tecnico tecnicoConMasResoluciones() {
        Tecnico tecnicoConMasIncidentesResueltos = tecnicoRepo.listarTodos().stream()
                .max(Comparator.comparingInt(tecnico -> incidenteRepo.obtenerResueltosPorTecnico(tecnico).size()))
                .orElse(null);
        return tecnicoConMasIncidentesResueltos;
    }
    
    public Tecnico TecnicoMasResolucionesPorEspecialidad(int dias, TipoEspecialidad especialidad){
        return tecnicoRepo.masResolucionesPorEspecialidad(dias, especialidad);
    }

}
