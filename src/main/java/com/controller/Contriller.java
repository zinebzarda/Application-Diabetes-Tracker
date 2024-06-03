package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.sql.SQLException;

@Controller
public class Contriller {
    @GetMapping("/")
    public String showEtudients(ModelMap modelMap) throws SQLException, ClassNotFoundException {

        modelMap.addAttribute("shows"," test zardaaaaa girl of hassan ");
        return "index";
    }
}
