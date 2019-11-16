package com.dgricenko.planner.repository;

import com.dgricenko.planner.domain.Master;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MasterRepo extends JpaRepository<Master,Long> {



    Master findByLastName(String lastName);
}
