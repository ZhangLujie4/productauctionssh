package com.common;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author DMZ
 * @description 一些常量
 */

@Component
@Data
public class CommonParam {

    @Value("${dmz.projectUrl}")
    public String projectUrl;
}
