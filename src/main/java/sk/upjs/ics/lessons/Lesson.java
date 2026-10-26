package sk.upjs.ics.lessons;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.With;

@With
public record Lesson (
        @NotNull
        Long id,
        Long algorithmId,
        @NotNull
        @Size(max = 100)
        String title,
        String text
){
    public Lesson(Long id, Long algorithmId, String title, String text) {
        this.id = id;
        this.algorithmId = algorithmId;
        this.title = title;
        this.text = text;
    }
}
