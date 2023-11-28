package areas;

import entidades.Incidente;
import entidades.Tecnico;
import enumerados.TipoEspecialidad;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
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
                    + incidente.getDescripcion() + "\nEstado: " + estado + "\nTécnico: " + tecnico.getNombre() + " - " + tecnico.getCuil());
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

    public Tecnico tecnicoMasResolucionesPorEspecialidadEnNDias(int dias, TipoEspecialidad especialidad) {
        Tecnico tecnicoConMasResoluciones = null;
        int cantidadResoluciones = -1;
        System.out.println(especialidad.getProblemasAsociados());
        List<Incidente> incidentesResueltos = incidenteRepo.incidentesResueltosPorEspecialidadEnNDias(dias, especialidad)
                .stream()
                .filter(incidente -> incidente.getProblemas().stream().anyMatch(problema -> especialidad.contains(problema)))
                .toList();
        System.out.println(incidentesResueltos);

//        List<Incidente> incidentesResueltos = incidenteRepo.incidentesResueltosPorEspecialidadEnNDias(dias,especialidad)
//                .stream().filter(incidente -> especialidad.getProblemasAsociados().contains(incidente.getProblemas())).toList();
//        List<Incidente> incidentesResueltos = incidenteRepo.incidentesResueltosPorEspecialidadEnNDias(dias, especialidad)
//                .stream()
//                .filter(incidente -> incidente.getProblemas().stream().anyMatch(especialidad.getProblemasAsociados()::contains))
//                .toList();
        for (Tecnico tecnico : tecnicoRepo.listarTodos()) {
            int resolucionesDelTecnico = 0;
            for (Incidente incidente : incidentesResueltos) {
                if (incidente.getTecnico().equals(tecnico)) {
                    System.out.println("se encontro el tecnico" + tecnico.getNombre());
                    resolucionesDelTecnico++;
                    if (resolucionesDelTecnico > cantidadResoluciones) {
                        tecnicoConMasResoluciones = tecnico;
                    }

                }
            }
        }
        return tecnicoConMasResoluciones;
    }
//    public Tecnico tecnicoMasResolucionesPorEspecialidadEnNDias(int dias, TipoEspecialidad especialidad) {
//    List<Incidente> incidentesResueltos = incidenteRepo.incidentesResueltosPorEspecialidadEnNDias(dias, especialidad);
//
//    Tecnico tecnicoConMasResoluciones = tecnicoRepo.listarTodos().stream()
//            .max(Comparator.comparingInt(tecnico ->
//                    (int) incidentesResueltos.stream().filter(incidente -> incidente.getTecnico().equals(tecnico)).count()))
//            .orElse(null);
//
//    return tecnicoConMasResoluciones;

}
