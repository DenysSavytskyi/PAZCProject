package sk.upjs.ics.dao;

import sk.upjs.ics.entity.Challenge;

import java.util.List;

public interface ChallengeDao {
    Challenge create(Challenge challenge);
    Challenge findById(Long id);
    List<Challenge> findAll();
    Challenge update(Challenge challenge);
    Challenge delete(Challenge challenge);
}
