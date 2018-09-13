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
@Table(name = "Jubao")
@Component("Jubao")
public class Jubao implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String memberid;

    private String goodsid;

    private String saleid;

    private String content;

    private String filename;

    private String hfmember;

    private String hfsale;

    private String hfmsavetime;

    private String hfssavetime;

    private String url;
}
