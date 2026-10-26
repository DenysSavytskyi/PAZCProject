package sk.upjs.ics.algorithms;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.With;

@With
public record Algorithm(
        @NotNull
        Long id,
        @NotNull
        @NotEmpty
        @Size(max = 30)
        String name,
        @NotNull
        AlgorithmType type
) {
    public Algorithm(Long id, String name, AlgorithmType type) {
        this.id = id;
        this.name = name;
        this.type = type;
    }
}
