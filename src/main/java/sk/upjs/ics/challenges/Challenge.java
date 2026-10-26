package sk.upjs.ics.challenges;

import jakarta.validation.constraints.*;
import lombok.With;

@With
public record Challenge (
        @NotNull
        Long id,
        @NotNull
        Long algorithmId,
        @NotNull
        @NotEmpty
        String cipherText,
        @NotNull
        @NotEmpty
        String plainText,
        @NotNull
        @Min(1)
        @Max(5)
        Integer difficultyLevel,
        @NotNull
        @Positive
        Integer rewardPoints
) {
    public Challenge(Long id, Long algorithmId, String cipherText, String plainText, Integer difficultyLevel, Integer rewardPoints) {
        this.id = id;
        this.algorithmId = algorithmId;
        this.cipherText = cipherText;
        this.plainText = plainText;
        this.difficultyLevel = difficultyLevel;
        this.rewardPoints = rewardPoints;
    }
}
