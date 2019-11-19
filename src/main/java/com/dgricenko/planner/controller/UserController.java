package com.dgricenko.planner.controller;


import com.dgricenko.planner.domain.Role;
import com.dgricenko.planner.domain.User;
import com.dgricenko.planner.repository.UserRepo;
import com.dgricenko.planner.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")//check whois then still methods (@EnableGlobalMethodSecurity in WebSecur)
public class UserController {
    @Autowired
    private UserRepo userRepo;
    @Autowired
   private UserService userService;

    @GetMapping
    public String userList(Model model){
        model.addAttribute("users",userRepo.findAll());
        return "userList";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model){
            model.addAttribute("user",user);
            model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user){

        user.setUsername(username);

        userService.getChangeRole(form,user);

        userRepo.save(user);

        return "redirect:/user";
    }



}
