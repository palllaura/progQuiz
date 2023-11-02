package com.valiit.quiz.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Collection;
import java.util.Date;

@Getter
@Setter
@Entity

public class UserAccount {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_account_id")
    @SequenceGenerator(name="user_account_id", sequenceName = "user_account_id_seq", allocationSize=1)
    private Integer id;
    private String name;
    private String password;
    private String email;
    private Integer highscore;

    @Temporal(TemporalType.TIMESTAMP) // Use this annotation to specify the date and time type
    private Date highscore_date;

    @Getter
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
    @JsonIgnore
    private Collection<UserAnswer> userAnswer;

}
