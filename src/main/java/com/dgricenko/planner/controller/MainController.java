package com.dgricenko.planner.controller;

import com.dgricenko.planner.domain.Message;
import com.dgricenko.planner.repository.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

    @Autowired
    private MessageRepo messageRepo;

    @Value("${upload.path}")//search in app.properties this path(add to MvcConfig too!)
    private String uploadPath;

    @GetMapping("/")
    public String greeting() {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Message> messages = messageRepo.findAll();

        if (filter!= null && !filter.isEmpty()) {
            messages = messageRepo.findByComment(filter);
        }else {
            messages = messageRepo.findAll();
        }

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "main";
    }

}