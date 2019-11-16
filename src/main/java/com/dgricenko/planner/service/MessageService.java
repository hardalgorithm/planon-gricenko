package com.dgricenko.planner.service;

import com.dgricenko.planner.domain.Message;
import com.dgricenko.planner.repository.MessageRepo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MessageService {
    private final MessageRepo messageRepo;

    public MessageService(MessageRepo messageRepo) {
        this.messageRepo = messageRepo;
    }

    @Transactional
    public boolean deleteMessage(Message message){
        Message messageFromDb = messageRepo.findById(message.getId()).orElseGet(() -> new Message());

        messageRepo.delete(messageFromDb);
        return true;
    }

    @Transactional
    public boolean activateMessage(Message message) {
        Message messageFromDb = messageRepo.findById(message.getId()).orElseGet(() -> new Message());
        if (messageFromDb.isActive()==true){
            return false;
        }
        messageFromDb.setActive(true);
        messageRepo.save(messageFromDb);
        return true;
    }
}
