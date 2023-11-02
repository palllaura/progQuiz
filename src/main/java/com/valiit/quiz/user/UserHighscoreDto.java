package com.valiit.quiz.user;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class UserHighscoreDto {

    private Integer id;
    private Integer highscore;
    private Date highscore_date;
}
