package entidades;

import enumerados.TipoEspecialidad;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
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
@ToString(of = {"servicioContratado"})
@Entity
public @Data
class Servicio {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @NonNull
    @Enumerated(EnumType.STRING)
    private TipoEspecialidad servicioContratado;
    @ManyToMany(mappedBy = "serviciosContratados")
    private List<Cliente> clientesContratantes;

    public Servicio(TipoEspecialidad servicioContratado) {
        this.servicioContratado = servicioContratado;
    }

}
