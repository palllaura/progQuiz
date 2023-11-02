package com.valiit.quiz.user;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserAnswerRepository extends CrudRepository<UserAnswer, Integer> {

}
