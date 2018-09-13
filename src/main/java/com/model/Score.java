package com.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author DMZ
 * @description
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Score")
@Component("Score")
public class Score implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer score;

    private String content;

    private String gid;

    private String saleid;

    private String memberid;
}
