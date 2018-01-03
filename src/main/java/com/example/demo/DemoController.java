package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DemoController {

    private String name = "World";

    @RequestMapping("/")
    public @ResponseBody
    String hello(@RequestParam(required = false) String name) {
        if (name != null) {
            this.name = name;
        }
        return "Hello " + this.name + "\n";
    }
}
