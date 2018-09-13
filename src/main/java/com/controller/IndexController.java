package com.controller;

import com.common.CommonParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author DMZ
 * @description 页面跳转
 */

@Slf4j
@Controller
public class IndexController {

    @Autowired
    private CommonParam commonParam;

    @GetMapping("/home")
    public ModelAndView index()
    {
        return new ModelAndView("redirect:" + commonParam.projectUrl + "/e/index.jsp");
    }
}
