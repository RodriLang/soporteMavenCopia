package main;

import areas.AreaMesaDeAyuda;
import areas.AreaRRHH;
import persistencia.DAO.EspecialidadDAO;
import persistencia.Repository.EspecialidadRepository;
import entidades.Cliente;
import entidades.Especialidad;
import entidades.Incidente;
import entidades.Tecnico;
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

        ClienteDAO clienteDao = new ClienteDAO();
        ClienteRepository repoCliente = new ClienteRepository(clienteDao);
        TecnicoDAO tecnicoDAO = new TecnicoDAO();
        TecnicoRepository repoTecnico = new TecnicoRepository(tecnicoDAO);
        IncidenteDAO incidenteDAO = new IncidenteDAO();
        IncidenteRepository incidenteRepo = new IncidenteRepository(incidenteDAO);
        ServicioDAO servicioDAO = new ServicioDAO();
        ServicioRepository servicioRepo = new ServicioRepository(servicioDAO);
        EspecialidadDAO especialidadDAO = new EspecialidadDAO();
        EspecialidadRepository especialidadRepo = new EspecialidadRepository(especialidadDAO);
        AreaRRHH rrhh = new AreaRRHH(repoTecnico, incidenteRepo);
        AreaMesaDeAyuda mesaDeAyuda = new AreaMesaDeAyuda(repoTecnico, incidenteRepo, repoCliente, servicioRepo);
        System.out.println("\n\n\n");
//        rrhh.emitirReportePorTecnico(repoTecnico.buscar(252));
//
//        rrhh.emitirReporteDiario();
//
        mesaDeAyuda.atenderIncidente();
//
//        System.out.println("Tecnico con mas resoluciones: " + rrhh.tecnicoConMasResoluciones());
//
//        TipoEspecialidad tipo = TipoEspecialidad.CAPACITACION_USUARIOS;
//        System.out.println("Tecnico con mas resoluciones en la especialidad " + tipo + ": \n"
//                + rrhh.tecnicoMasResolucionesPorEspecialidadEnNDias(5, tipo));

    }
}
