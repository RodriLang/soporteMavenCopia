package persistencia.DAO;


import java.util.List;



public interface IDao<T, V> {


    public void crear(T model);


    public T buscar(V idModel);


    public void actualizar(T model);


    public void borrar(T model);

  
    public List<T> leerTodos();
}
