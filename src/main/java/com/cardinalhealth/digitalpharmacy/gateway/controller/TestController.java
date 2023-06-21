package com.cardinalhealth.digitalpharmacy.gateway.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/status")
    public String getStatus() {
        return "Gateway Service is rolling smooth";
    }
}
