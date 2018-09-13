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
@Table(name = "Pingjia")
@Component("Pingjia")
public class Pingjia implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String memberid;

    private String goodsid;

    private String content;

    private String savetime;
}
