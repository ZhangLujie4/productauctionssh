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
@Table(name = "Imgv")
@Component("Imgv")
public class Imgv implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String img;
}
