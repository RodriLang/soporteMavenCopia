package main;

import areas.AreaMesaDeAyuda;
import areas.AreaRRHH;
import entidades.Cliente;
import entidades.Incidente;
import enumerados.TipoEspecialidad;
import enumerados.TipoProblema;
import java.util.Arrays;
import java.util.List;
import persistencia.Repository.ClienteRepository;
import persistencia.DAO.ClienteDAO;
import persistencia.DAO.TecnicoDAO;
import persistencia.DAO.IncidenteDAO;
import persistencia.DAO.ServicioDAO;
import persistencia.Repository.IncidenteRepository;
import persistencia.Repository.ServicioRepository;
import persistencia.Repository.TecnicoRepository;

public class Main {

    public static void main(String[] args) {
        System.out.println("");
        System.out.println("");
        System.out.println("");
        System.out.println("");
        ClienteDAO clienteDao = new ClienteDAO();
        ClienteRepository repoCLiente = new ClienteRepository(clienteDao);
        TecnicoDAO tecnicoDAO = new TecnicoDAO();
        TecnicoRepository repoTecnico = new TecnicoRepository(tecnicoDAO);
        IncidenteDAO incidenteDAO = new IncidenteDAO();
        IncidenteRepository incidenteRepo = new IncidenteRepository(incidenteDAO);
        ServicioDAO servicioDAO = new ServicioDAO();
        ServicioRepository servicioRepo = new ServicioRepository(servicioDAO);
        /*
        //Fabrica de Servicios
        
            for (TipoEspecialidad value1 : TipoEspecialidad.values()) {
                servicioRepo.add(new Servicio(value, value1));
            }
        
         */

 
//Cargar servicios a un cliente
//Incidente i = incidenteRepo.buscar(1);
//i.agregarProblema(TipoProblema.ERRORES_DURANTE_LA_INSTALACION);
//incidenteRepo.actualizar(i);
//Incidente i2 = incidenteRepo.buscar(3);
//i2.agregarProblema(TipoProblema.ERRORES_POST_ACTUALIZACION);
//Incidente i3 = incidenteRepo.buscar(4);
//i3.agregarProblema(TipoProblema.CONFLICTOS_DE_SOFTWARE);
//Incidente i4 = incidenteRepo.buscar(5);
//i4.agregarProblema(TipoProblema.PROBLEMAS_DE_CUMPLIMIENTO_LEGAL);
//Incidente i5 = incidenteRepo.buscar(6);
//i5.agregarProblema(TipoProblema.DIFICULTADES_EN_LA_ADOPCION_DE_NUEVAS_TECNOLOGIAS);
//Incidente i6 =incidenteRepo.buscar(7);
//i6.agregarProblema(TipoProblema.PROBLEMAS_DE_CONECTIVIDAD);
//Incidente i7 =incidenteRepo.buscar(8);
//i7.agregarProblema(TipoProblema.PROBLEMAS_DE_COMPATIBILIDAD);
//Incidente i8 =incidenteRepo.buscar(9);
//i8.agregarProblema(TipoProblema.PROBLEMAS_DE_CONECTIVIDAD);
//Incidente i9 =incidenteRepo.buscar(10);
//i9.agregarProblema(TipoProblema.ASISTENCIA_EN_LA_RESOLUCION_DE_PROBLEMAS);
//Incidente i10 =incidenteRepo.buscar(11);
//i10.agregarProblema(TipoProblema.CONFLICTOS_DE_SOFTWARE);
//Incidente i11 =incidenteRepo.buscar(12);
//i11.agregarProblema(TipoProblema.ERRORES_EN_LA_INTEGRACION);
//Incidente i12 =incidenteRepo.buscar(13);
//i12.agregarProblema(TipoProblema.ASISTENCIA_EN_LA_RESOLUCION_DE_PROBLEMAS);
//Incidente i13 =incidenteRepo.buscar(14);
//i13.agregarProblema(TipoProblema.ERRORES_DURANTE_LA_INSTALACION);
//incidenteRepo.actualizar(i2);
//incidenteRepo.actualizar(i3);
//incidenteRepo.actualizar(i4);
//incidenteRepo.actualizar(i5);
//incidenteRepo.actualizar(i6);
//incidenteRepo.actualizar(i7);
//incidenteRepo.actualizar(i8);
//incidenteRepo.actualizar(i9);
//incidenteRepo.actualizar(i10);
//incidenteRepo.actualizar(i11);
//incidenteRepo.actualizar(i12);
//incidenteRepo.actualizar(i13);
//       Cliente cliente = repoCLiente.buscar(352);
//        for (int i = 6; i <= 9; i++) {
//            System.out.println("se agrega servicio al cliente id " + cliente.getId());
//            cliente.agregarServicio(servicioRepo.buscar(i));
//   
//
//            System.out.println(servicioRepo.buscar(i).getId());
//        }
//         repoCLiente.actualizar(cliente);
 /*
//        cliente.agregarServicio(servicioRepo.buscar(11));
//        cliente.agregarServicio(servicioRepo.buscar(12));
//        cliente.agregarServicio(servicioRepo.buscar(23));
        repoCLiente.actualizar(cliente);
         
 
//Tecnico tec = new Tecnico("Catalina Flores", "20404351044");
//        for (TipoEspecialidad value : TipoEspecialidad.values()) {
//            tec.agregarEspecialidad(value);
//        }
//
//
//repoTecnico.add(tec);
//System.out.println(repoTecnico.buscar(152).getEspecialidades());
        Cliente clienteEncontrado = repoCLiente.buscar(352);
        System.out.println(clienteEncontrado);
        Incidente inci = new Incidente(clienteEncontrado, LocalDate.of(2023, Month.NOVEMBER, 23));
        System.out.println("Servicios contratados por el cliente:\n");
        //Muestra los sericios contratados por el cliente
        inci.getCliente().getServiciosContratados().stream().forEach(servicio -> System.out.println(servicio + " "));
        //Se selecciona el indice 0 de la lista mostrada y se crea una lista de los problemas asociasos a ese servicio
        List<TipoProblema> problemasCliente = cliente.getServiciosContratados()
                .get(0).getServicioContratado().getProblemasAsociados();
        inci.agregarProblema(problemasCliente.get(1));
        inci.agregarProblema(problemasCliente.get(2));
        inci.setDescripcion("Problemas para instalar el programa: Revise la compatibilidad del sistema");
        //se muestran los problemas que el cliente reclama 
        inci.getProblemas().stream().forEach(problema -> System.out.println(problema + " "));
        System.out.println("Descripcion del problema");
        System.out.println(inci.getDescripcion());
        System.out.println();
        System.out.println("Fecha probable de resolucion");
        System.out.println(inci.getFechaResolucion());
        incidenteRepo.add(inci);
        System.out.println("Lista de tecnicos disponibles");
//Incidente incidenteEncontrado = incidenteRepo.buscar(0)
         */
        //se busca una lista de tecnicos capacitados para esos problemas
//        Cliente clienteEncontrado = repoCLiente.buscar(352);
//        Incidente inci = new Incidente(clienteEncontrado, LocalDate.of(2023, Month.NOVEMBER, 23));
//        List<Tecnico> tecnicosFiltrados = repoTecnico.listarTodos().stream()
//                .filter(tecnico -> tecnico.getEspecialidades().stream()
//                .anyMatch(especialidad -> especialidad.getProblemasAsociados().contains(inci.getProblemas().get(0)) && especialidad.getProblemasAsociados().contains(inci.getProblemas().get(1)))).collect(Collectors.toList());
//        tecnicosFiltrados.stream().forEach(tecnico -> System.out.println(tecnico + " "));
//        Tecnico tecnicoSeleccionado = tecnicosFiltrados.get(0);
//        if (inci.asignarTecnico(tecnicoSeleccionado)) {
//            incidenteRepo.actualizar(inci);
//        }
//        System.out.println();
//        System.out.println("Codigos de incidentes asignados al tecnico");
//        tecnicoSeleccionado.getIncidentesAsignados().stream().forEach(incidente -> System.out.println(incidente));
        // inci.agregarProblema(cliente.getServiciosContratados().get(4).getServicioContratado().);
//incidenteDAO.crear(inci);
        AreaRRHH rrhh = new AreaRRHH(repoTecnico, incidenteRepo);
//        //rrhh.emitirReportePorTecnico(repoTecnico.buscar(252));
//        //rrhh.emitirReporteDiario();
//
//        AreaMesaDeAyuda mesaDeAyuda = new AreaMesaDeAyuda(repoTecnico, incidenteRepo, repoCLiente, servicioRepo);
//        mesaDeAyuda.atenderIncidente();

           System.out.println("Tecnico con mas resoluciones: "+rrhh.tecnicoConMasResoluciones());
           System.out.println("Tecnico con mas resoluciones en la especialidad "+TipoEspecialidad.INSTALACION_Y_CONFIGURACION+": \n"
                   +rrhh.TecnicoMasResolucionesPorEspecialidad(5, TipoEspecialidad.INSTALACION_Y_CONFIGURACION));

    }
}
