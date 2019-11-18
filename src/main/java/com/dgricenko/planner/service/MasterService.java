package com.dgricenko.planner.service;

import com.dgricenko.planner.domain.Master;
import com.dgricenko.planner.domain.Message;
import com.dgricenko.planner.repository.MasterRepo;
import com.dgricenko.planner.repository.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class MasterService {

    @Autowired
    private MasterRepo masterRepo;
    @Autowired
    private MessageRepo messageRepo;

    @Value("${upload.path}")//search in app.properties this path(add to MvcConfig too!)
    private String uploadPath;


    public void savePhoto(@RequestParam("photo") MultipartFile file, Master master) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();//
            String resultFileName =file.getOriginalFilename()+uuidFile;

            file.transferTo(new File(uploadPath + "/" + resultFileName));

            master.setPhoto(resultFileName);
        }
    }


}
