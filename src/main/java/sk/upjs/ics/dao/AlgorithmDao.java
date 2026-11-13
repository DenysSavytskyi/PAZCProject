package sk.upjs.ics.dao;

import sk.upjs.ics.entity.Algorithm;

import java.util.List;

public interface AlgorithmDao {
    Algorithm create(Algorithm algorithm);
    Algorithm findById(Long algorithmId);
    List<Algorithm> findAll();
    Algorithm update(Algorithm algorithm);
    Algorithm delete(Algorithm algorithm);

}
