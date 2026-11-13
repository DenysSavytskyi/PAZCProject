package sk.upjs.ics.dao;

import sk.upjs.ics.entity.Hint;

import java.util.List;

public interface HintDao {
    Hint create(Hint hint);
    Hint findById(Long id);
    List<Hint> findAll();
    Hint update(Hint hint);
    Hint delete(Hint hint);
}
