package com.dgricenko.planner.service;

import com.dgricenko.planner.domain.Master;
import com.dgricenko.planner.repository.MasterRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MasterService {

    @Autowired
    private MasterRepo masterRepo;

    @Transactional
    public boolean addAgent(Master master){
        Master masterFromDb = masterRepo.findByLastName(master.getLastName());

        if (masterFromDb != null) {
            return false;
        }

        masterRepo.save(master);
        return true;
    }
}
