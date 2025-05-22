package com.example.springboot.gke.controller;

import org.springframework.web.bind.annotation.*;

@RestController
public class TestController {

    @GetMapping("/")
    public String hello() {
        return "Hello from Spring Boot on GKE!";
    }
}
