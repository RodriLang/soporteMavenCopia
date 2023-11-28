package persistencia.Repository;

import persistencia.DAO.ClienteDAO;
import entidades.Cliente;
import java.util.List;

public class ClienteRepository {

    private ClienteDAO usuarioDAO;

    public ClienteRepository(ClienteDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    public void add(Cliente cliente) {
        System.err.println("crear cliente en clienteRepository");
        usuarioDAO.crear(cliente);
    }

    public Cliente buscar(int idCliente) {
        return usuarioDAO.buscar(idCliente);
    }

    public void actualizar(Cliente cliente) {
        usuarioDAO.actualizar(cliente);
    }

    public void delete(Cliente cliente) {
        usuarioDAO.borrar(cliente);
    }

    public List<Cliente> listarTodos() {
        return usuarioDAO.leerTodos();
    }

    public Cliente buscarPorCuit(String cuit) {
        return usuarioDAO.buscarPorCuit(cuit);
    }
}
