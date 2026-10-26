package sk.upjs.ics.attempts;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.With;

import java.time.OffsetDateTime;

@With
public record Attempt(
        @NotNull
        Long id,
        @NotNull
        Long challengeId,
        Boolean isSuccessful,
        @PositiveOrZero
        Integer timeTakenSeconds,
        @NotNull
        OffsetDateTime attemptDate
) {
    public Attempt(Long id, Long challengeId, Boolean isSuccessful, Integer timeTakenSeconds, OffsetDateTime attemptDate){
        this.id = id;
        this.challengeId = challengeId;
        this.isSuccessful = isSuccessful;
        this.timeTakenSeconds = timeTakenSeconds;
        this.attemptDate = attemptDate;
    }
}
