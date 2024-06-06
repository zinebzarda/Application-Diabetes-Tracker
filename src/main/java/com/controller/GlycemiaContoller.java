package com.controller;

import com.model.Glycemia;
import com.services.GlycemiaServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("")
public class GlycemiaContoller {

    private final GlycemiaServices service;

    public GlycemiaContoller(GlycemiaServices service) {
        this.service = service;
    }
    @GetMapping("/add")
    public String addGlycemiaForm(Model model) {
        model.addAttribute("reading", new Glycemia());
        return "add-glycemia-form";
    }

    @PostMapping("/add")
    public String addGlycemiaSubmit(@ModelAttribute("reading") Glycemia reading) {
        service.addGlycemia(reading);
        return "redirect:/";
    }

    @GetMapping("/")
    public String showEtudients(ModelMap modelMap) throws SQLException, ClassNotFoundException {
        modelMap.addAttribute("shows",service.getAllGlycemia());
        System.out.println(service.getAllGlycemia());
        return "index";
    }

    @GetMapping("/delete/{id}")
    public String deleteGlycemia(@PathVariable long id) {
        service.deleteGlycemia(id);
        return "redirect:/";
    }



}

