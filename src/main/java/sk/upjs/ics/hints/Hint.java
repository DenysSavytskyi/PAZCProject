package sk.upjs.ics.hints;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.With;

@With
public record Hint(
        @NotNull
        Long id,
        @NotNull
        Long challengeId,
        @NotNull
        @NotEmpty
        String hintText,
        @NotNull
        @Positive
        Integer costPoints
) {
    public Hint(Long id, Long challengeId, String hintText, Integer costPoints) {
        this.id = id;
        this.challengeId = challengeId;
        this.hintText = hintText;
        this.costPoints = costPoints;
    }
}
