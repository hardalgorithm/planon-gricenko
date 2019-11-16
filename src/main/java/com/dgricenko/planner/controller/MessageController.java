package com.dgricenko.planner.controller;

import com.dgricenko.planner.domain.Message;
import com.dgricenko.planner.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MessageController {
@Autowired
private MessageService messageService;


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
