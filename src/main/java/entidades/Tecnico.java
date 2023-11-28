package entidades;

import enumerados.TipoEspecialidad;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;
import org.checkerframework.common.aliasing.qual.Unique;
import org.checkerframework.common.value.qual.BoolVal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(of = {"nombre", "cuil"})
@Entity
public class Tecnico {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @NonNull
    private String nombre;
    @Unique
    @NonNull
    private String cuil;
    @BoolVal(true)
    private boolean disponible;
    @ManyToMany
    private List<Especialidad> especialidades;
    @OneToMany
    private List<Incidente> incidentesAsignados;

    public Tecnico(String nombre, String cuil) {
        this.nombre = nombre;
        this.cuil = cuil;
        this.disponible = true;
        especialidades = new ArrayList<>();
    }

    public void agregarEspecialidad(Especialidad especialidad) {
        if(especialidades==null){
            especialidades = new ArrayList<>();
        }
        especialidades.add(especialidad);
    }

    public boolean asignarIncidente(Incidente incidente) {
        incidentesAsignados.add(incidente);

        String nuevoIncidente = incidente.getDescripcion();


        int option = JOptionPane.showOptionDialog(
                null,
                nuevoIncidente,
                "Tiene un nuevo incidente asignado",
                JOptionPane.OK_CANCEL_OPTION,
                JOptionPane.INFORMATION_MESSAGE,
                null,
                new Object[]{"Resolver", "Cancelar"},
                "Resolver");

        // Verificar la opción seleccionada
        if (option == JOptionPane.OK_OPTION) {
            // Si se selecciona "Resolver", mostrar input para las consideraciones
            String consideraciones = JOptionPane.showInputDialog(null, "Ingrese las consideraciones:");

            if (consideraciones != null) {
                // Ingresar días transcurridos
                String diasTranscurridosStr = JOptionPane.showInputDialog(null, "Ingrese los días transcurridos:");
                if (diasTranscurridosStr != null) {
                    try {
                        // Convertir a tipo long
                        long diasTranscurridos = Long.parseLong(diasTranscurridosStr);

                        // Hacer algo con las consideraciones y los días transcurridos
                        incidente.setConsideraciones(consideraciones);
                        incidente.setFechaResolucion(incidente.getFechaResolucion().plusDays(diasTranscurridos));
                        incidente.setResuelto(true);
                        System.out.println("Consideraciones ingresadas: " + consideraciones);
                        System.out.println("Días transcurridos ingresados: " + diasTranscurridos);
                        
                    } catch (NumberFormatException e) {
                        // Manejar error si la entrada no es un número válido
                        JOptionPane.showMessageDialog(null, "Ingrese un número válido para los días transcurridos", "Error", JOptionPane.ERROR_MESSAGE);
                    }
                }
            }
        }
        return incidente.isResuelto();
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Tecnico){
            Tecnico t = (Tecnico)obj;
            if(t.getId() == id){
                return true;
            }
        }
        return false;
    }


}
