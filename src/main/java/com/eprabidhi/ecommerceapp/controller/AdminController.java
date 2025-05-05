package com.eprabidhi.ecommerceapp.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    // Request handling
    @GetMapping("/admin/home")
    public String openHome(Model model, Principal p) {
        // Model object is used to send data to the view
        model.addAttribute("username", p.getName());

        return "admin/dashboard"; // fixed typo in the view name
    }
}
