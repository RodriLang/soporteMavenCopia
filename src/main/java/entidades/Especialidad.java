
package entidades;

import enumerados.TipoEspecialidad;
import enumerados.TipoProblema;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@ToString(of = {"nombre"})
@Entity
public @Data class Especialidad {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @NonNull
    @Enumerated(EnumType.STRING)
    private TipoEspecialidad especialidad;
    @ElementCollection(targetClass = TipoProblema.class)
    @Enumerated(EnumType.STRING)
    private List<TipoProblema> problemas;
}
