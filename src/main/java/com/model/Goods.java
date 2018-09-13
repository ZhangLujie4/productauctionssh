package com.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.*;

/**
 * @author DMZ
 * @description
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Goods")
@Component("Goods")
public class Goods {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String goodsname;

    private Integer price;

    private Integer jiajia;

    private Integer shuishou;

    private String type;

    private String img;

    private String status;

    private String content;

    private String delstatus;

    private String stime;

    private String etime;

    private Integer maxprice;

    private String memberid;

    private Integer cs;

    private String shstatus;

    private String chengdu;

    private String buytime;
}
