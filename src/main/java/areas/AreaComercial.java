package areas;

import entidades.Cliente;
import persistencia.Repository.ClienteRepository;

public class AreaComercial {


    private ClienteRepository repository;

    public AreaComercial( ClienteRepository repository) {
        this.repository = repository;
    }

    public void agregarCliente(Cliente cliente) {

    }
    public void agregarServicioACliente(){
        
    }
}
