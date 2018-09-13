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
@Table(name = "Sysuser")
@Component("Sysuser")
public class Sysuser implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String usertype;

    private String username;

    private String userpwd;

    private String realname;

    private String sex;

    private String tel;

    private String email;

    private String img;

    private String delstatus;

    private String savetime;
}
