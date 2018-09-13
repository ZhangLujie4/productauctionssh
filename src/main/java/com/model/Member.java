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
@Table(name = "Member")
@Component("Member")
public class Member implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String uname;

    private String upass;

    private String realname;

    private String sex;

    private String age;

    private String tel;

    private String email;

    private String addr;

    private String img;

    private String savetime;

    private String delstatus;

    private String yue;
}
