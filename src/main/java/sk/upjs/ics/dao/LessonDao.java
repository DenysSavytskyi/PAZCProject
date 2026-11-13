package sk.upjs.ics.dao;

import sk.upjs.ics.entity.Lesson;

import java.util.List;

public interface LessonDao {
    Lesson create(Lesson lesson);
    Lesson findById(Long id);
    List<Lesson> findAll();
    Lesson update(Lesson lesson);
    Lesson delete(Lesson lesson);
}
