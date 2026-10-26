package sk.upjs.ics.achievements;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.With;

@With
public record Achievement(
        @NotNull
        Long id,
        @NotNull
        @NotEmpty
        @Size(max = 100)
        String name,
        String text,
        @NotNull
        @NotEmpty
        String criteria
) {
    public Achievement(Long id, String name, String text, String criteria) {
        this.id = id;
        this.name = name;
        this.text = text;
        this.criteria = criteria;
    }
}
