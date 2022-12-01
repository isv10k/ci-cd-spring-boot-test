package com.isv10k.cicdtest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/api")
    public String helloWorld(@RequestParam(required = false) String name) {
        if (name == null) {
            return "Hello world!";
        } else {
            return "Hello " + name + "!";
        }
    }

    @GetMapping("/")
    public String root() {
        StringBuilder sb = new StringBuilder();
        sb.append("Go to /api\n")
                .append("or /api?name=Name");
        return sb.toString();
    }
}
