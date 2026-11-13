package sk.upjs.ics.dao;

import sk.upjs.ics.entity.Achievement;

import java.util.List;

public interface AchievementDao {
    Achievement create(Achievement achievement);
    Achievement findById(Long id);
    List<Achievement> findByUserId(Long userId);
    List<Achievement> findAll();
    Achievement update(Achievement achievement);
    Achievement delete(Achievement achievement);
}
