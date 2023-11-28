package entidades;

import enumerados.TipoProblema;
import jakarta.persistence.Entity;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.checkerframework.common.value.qual.BoolVal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(of = {"id", "descripcion", "resuelto"})
@Entity
public @Data
class Incidente {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;

    @ManyToOne
    @JoinColumn(name = "cliente_id")
    private Cliente cliente;

    @ManyToOne
    @JoinColumn(name = "tecnico_id", referencedColumnName = "id")
    private Tecnico tecnico;

    @Enumerated
    private List<TipoProblema> problemas;
    @Temporal(TemporalType.DATE)
    private LocalDate fechaReporte;
    @Temporal(TemporalType.DATE)
    private LocalDate fechaResolucion;
    @BoolVal(false)
    private boolean resuelto;
    private String descripcion;

    private String consideraciones;

    public Incidente(Cliente cliente, LocalDate fechareporte) {
        this.cliente = cliente;
        this.fechaReporte = fechareporte;
        this.problemas = new ArrayList<>();
    }

    public void agregarProblema(TipoProblema problema) {
        if(problemas == null){
            problemas = new ArrayList<>();
        }
        problemas.add(problema);
        calcularDias();
    }

    public boolean asignarTecnico(Tecnico tecnico) {
        this.tecnico = tecnico;
        return tecnico.asignarIncidente(this);
    }

    private void calcularDias() {
        if (fechaResolucion == null) {
            fechaResolucion = fechaReporte;
        }
        problemas.stream().forEach(problema -> fechaResolucion = fechaResolucion.plusDays(problema.getDiasEstimados()));
    }

}
