package com.dgricenko.planner.controller;

import com.dgricenko.planner.domain.Message;
import com.dgricenko.planner.repository.MessageRepo;
import com.dgricenko.planner.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {
@Autowired
private MessageService messageService;
@Autowired
private MessageRepo messageRepo;

/// PUT IN SERVICE LOGIC!

    @GetMapping("/messages")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Message> messages = messageRepo.findAll();

        if (filter!= null && !filter.isEmpty()) {
            messages = messageRepo.findByComment(filter);
        }else {
            messages = messageRepo.findAll();
        }

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "messages";
    }

    @PostMapping("/messageDelete/{message}")
    public String deleteMessage(@PathVariable Message message) {

        messageService.deleteMessage(message);


        return "redirect:/main";
    }

    @PostMapping("/messageActive/{message}")
    public String activateMessage(@PathVariable Message message) {

        messageService.activateMessage(message);

        return "redirect:/main";
    }


}
