package com.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author DMZ
 * @description
 */

@RequestMapping("/test")
@RestController
public class testController {

    @GetMapping("/666")
    public String test() {
        return "666";
    }
}
