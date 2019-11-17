package com.dgricenko.planner.controller;

import com.dgricenko.planner.domain.Master;
import com.dgricenko.planner.domain.Message;
import com.dgricenko.planner.domain.User;
import com.dgricenko.planner.repository.MasterRepo;
import com.dgricenko.planner.repository.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

@Controller
public class MasterController {

 @Autowired
 private MasterRepo masterRepo;
 @Autowired
 private MessageRepo messageRepo;

    @Value("${upload.path}")//search in app.properties this path(add to MvcConfig too!)
    private String uploadPath;



    @GetMapping("/masterlist")
    public String masterList(Model model){
        Iterable<Master> masters = masterRepo.findAll();
        model.addAttribute("masters",masters);
        return "masterlist";
    }

    @GetMapping("/master/{master}")
    public String showMaster(@PathVariable Master master,
                             Model model){

        Iterable<Message> messages = messageRepo.findByMaster(master);
        model.addAttribute("master",master);
        model.addAttribute("messages", messages);
        return "masterPage";
    }

    @GetMapping("/masterCreate")
    public String userEditForm(
             Model model
    ){
        Iterable<Master> masters = masterRepo.findAll();
        model.addAttribute("masters",masters);

        return "masterCreate";
    }

    @PostMapping(value = "/master/{master}")
    public String add(@AuthenticationPrincipal User user,
                      @PathVariable Master master,
                      @RequestParam String comment,
                      @RequestParam Date date, Model model)
                      {
        Message message = new Message(comment, date, user, master);

        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);

        return "redirect:/main";
    }

    @PostMapping("/masterEdit")
    public String add(

                      @RequestParam String firstName,
                      @RequestParam String lastName,
                      @RequestParam String description,
                      @RequestParam String phone,
                      @RequestParam String socialLink,

                      @RequestParam("photo") MultipartFile file) throws IOException {
        Master master = new Master(firstName,lastName,description,phone,socialLink);

        if (file != null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();//
            String resultFileName =file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFileName));

            master.setPhoto(resultFileName);
        }

        masterRepo.save(master);


        return "redirect:/masterlist";
    }
}
