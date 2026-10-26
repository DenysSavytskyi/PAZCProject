package sk.upjs.ics.users;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.With;
import sk.upjs.ics.achievements.Achievement;
import sk.upjs.ics.attempts.Attempt;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Map;

@With
public record User(
        @NotNull
        Long id,
        Map<Achievement, OffsetDateTime> achievements,
        List<Attempt> attempts,
        @NotNull
        @NotEmpty
        @Size(max = 30)
        String username,
        @NotNull
        @NotEmpty
        @Size(min = 64, max = 64)
        String passwordHash,
        @NotNull
        @Min(0)
        Integer totalScore,
        @NotNull
        OffsetDateTime createdAt
) {
    public User(Long id, Map<Achievement, OffsetDateTime> achievements, List<Attempt> attempts, String username, String passwordHash, Integer totalScore, OffsetDateTime createdAt) {
        this.id = id;
        this.achievements = achievements;
        this.attempts = attempts;
        this.username = username;
        this.passwordHash = passwordHash;
        this.totalScore = totalScore;
        this.createdAt = createdAt;
    }
}
