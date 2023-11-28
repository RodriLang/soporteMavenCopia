package entidades;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString(of = {"razonSocial", "cuit"})
@Entity
public class Cliente {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;
    @Column
    @NonNull
    private String razonSocial;
    @Column
    @NonNull
    private String cuit;
    @ManyToMany()
    @JoinTable(
            name = "cliente_servicio",
            joinColumns = @JoinColumn(name = "cliente_id"),
            inverseJoinColumns = @JoinColumn(name = "servicio_id")
    )
    private List<Servicio> serviciosContratados;

    @OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Incidente> incidentes;

    public Cliente(String razonSocial, String cuit) {
        this.razonSocial = razonSocial;
        this.cuit = cuit;
    }

    public void agregarServicio(Servicio servicio) {
        if (serviciosContratados == null) {
            serviciosContratados = new ArrayList<>();
        }
        serviciosContratados.add(servicio);
    }

    public void agregarIncidente(Incidente incidente) {
        if (incidentes == null) {
            incidentes = new ArrayList<>();
        }
        incidentes.add(incidente);
    }
}
