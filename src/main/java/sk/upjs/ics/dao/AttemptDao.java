package sk.upjs.ics.dao;

import sk.upjs.ics.entity.AlgorithmType;
import sk.upjs.ics.entity.Attempt;

import java.util.List;
import java.util.Set;

public interface AttemptDao {
    Attempt start(Long userId, Long challengeId);
    void markSolved(Long attemptId, int seconds);
    void markUnfinished(Long attemptId, int seconds);
    List<Attempt> findByUserId(Long userId);
    Set<Long> findSolvedChallengeIds(Long userId);
    Set<Long> findUnfinishedChallengesIds(Long userId);
    int countSolvedChallenges(Long userId);
    int countSolvedChallengesByType(Long userId, AlgorithmType type);
    boolean existsSolvedWithinSeconds(Long userId, int maxSeconds);
    boolean existsSolvedWithDifficultyAtLeast(Long userId, int minDifficulty);
    Attempt findById(Long id);
    List<Attempt> findAll();
}
