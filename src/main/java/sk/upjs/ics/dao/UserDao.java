package sk.upjs.ics.dao;
import sk.upjs.ics.entity.User;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Map;

public interface UserDao {
    User create(User user);
    User findById(Long userId);
    User findByUsername(String username);
    List<User> findAll();
    void addScore(Long userId, int delta);
    boolean unlockAchievement(Long userId, Long achievementId);
    Map<Long, OffsetDateTime> findUnlockedAchievementIds(Long userId);
}
