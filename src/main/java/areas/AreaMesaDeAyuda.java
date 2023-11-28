package areas;

import entidades.Cliente;
import entidades.Incidente;
import entidades.Servicio;
import entidades.Tecnico;
import enumerados.TipoEspecialidad;
import enumerados.TipoProblema;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;
import javax.swing.JOptionPane;
import persistencia.Repository.ClienteRepository;
import persistencia.Repository.IncidenteRepository;
import persistencia.Repository.ServicioRepository;
import persistencia.Repository.TecnicoRepository;

public class AreaMesaDeAyuda {

    private TecnicoRepository tecnicoRepo;
    private IncidenteRepository incidenteRepo;
    private ClienteRepository clienteRepo;
    private ServicioRepository servicioRepo;

    public AreaMesaDeAyuda(TecnicoRepository tecnicoRepo, IncidenteRepository incidenteRepo, ClienteRepository clienteRepo, ServicioRepository problemaRepo) {
        this.tecnicoRepo = tecnicoRepo;
        this.incidenteRepo = incidenteRepo;
        this.clienteRepo = clienteRepo;
        this.servicioRepo = problemaRepo;
    }

    public void atenderIncidente() {
        boolean tieneServiciosContratados = false;
        Scanner entrada = new Scanner(System.in);
        Incidente incidente = null;
        System.out.println("Ingrese el cuit del cliente:");
        String cuit = entrada.nextLine();
        Cliente cliente = clienteRepo.buscarPorCuit(cuit);
        if (cliente != null) {
            incidente = new Incidente(cliente, LocalDate.now());
            cliente.agregarIncidente(incidente);
            incidenteRepo.add(incidente);
            //clienteRepo.actualizar(cliente);
            System.out.println("Servicios contratados por el cliente:");
            List<Servicio> serviciosContratados = cliente.getServiciosContratados();
            if (serviciosContratados.isEmpty()) {
                System.out.println("El cliente no tiene servicios contratados");
            } else {
                serviciosContratados.stream().forEach(servicio -> System.out.println(servicio.getId() + " - " + servicio.getServicioContratado()));
                tieneServiciosContratados = true;
            }
            if (tieneServiciosContratados) {
                System.out.println("\nSeleccione el Servicio por el cuál se hará el reporte\nIntroduzca el ID:");
                int idServicio = entrada.nextInt();
                List<TipoProblema> problemasAsistidos = servicioRepo.buscar(idServicio).getServicioContratado().getProblemasAsociados();
                for (TipoProblema value : problemasAsistidos) {
                    System.out.println(problemasAsistidos.indexOf(value) + " - " + value.name());
                }
                System.out.println("Seleccione el tipo de problema\nIntroduzca el ID:");
                int eleccion = entrada.nextInt();
                incidente.agregarProblema(problemasAsistidos.get(eleccion));
                System.out.println("Ingrese la descripción del problema:");
                entrada.nextLine();//consume el caracter de escape \n
                String descripcion = entrada.nextLine();
                incidente.setDescripcion(descripcion);
                System.out.println("La fecha probable de reparación es: " + incidente.getFechaResolucion().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));
                System.out.println("¿Desea modificar esta fecha? S/N");
                if (entrada.nextLine().equalsIgnoreCase("S")) {
                    System.out.println("Ingrese fecha: (dd/mm/aaaa)");
                    LocalDate fechaResolucion = LocalDate.parse(entrada.nextLine(), DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    incidente.setFechaResolucion(fechaResolucion);
                }
                final Incidente incidenteFinal = incidente;
                System.out.println("\n\nSeleccione un técnico de la lista\nIngrese el número de índice");
                List<Tecnico> tecnicosFiltrados = tecnicoRepo.listarTodos().stream()
                        .filter(tecnico -> tecnico.getEspecialidades().stream()
                        .anyMatch(especialidad -> especialidad.getEspecialidad().getProblemasAsociados().containsAll(incidenteFinal.getProblemas())))
                        .collect(Collectors.toList());
                tecnicosFiltrados.stream().forEach(tecnico -> System.out.println(tecnicosFiltrados.indexOf(tecnico) + " - " + tecnico));
                String respuesta = entrada.nextLine();
                eleccion = Integer.parseInt(respuesta);
                Tecnico tecnicoSeleccionado = tecnicosFiltrados.get(eleccion);
                incidente.setTecnico(tecnicoSeleccionado);
                tecnicoRepo.actualizar(tecnicoSeleccionado);
                incidenteRepo.actualizar(incidente);
                System.out.println("Esperando respuesta del técnico...");
                if (incidente.asignarTecnico(tecnicoSeleccionado)) {
                    incidenteRepo.actualizar(incidente);
                    tecnicoRepo.actualizar(tecnicoSeleccionado);
                    System.out.println("El Incidente ha sido resuelto");
                }
            } else {
                System.out.println("No se encontró ningún cliente con ese CUIT.");
            }
        }
    }

}
