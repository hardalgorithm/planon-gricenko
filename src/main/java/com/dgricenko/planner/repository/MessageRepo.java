package com.dgricenko.planner.repository;

import com.dgricenko.planner.domain.Master;
import com.dgricenko.planner.domain.Message;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageRepo extends CrudRepository<Message,Long> {
    List<Message> findByComment(String tag);

    List<Message> findByMaster(Master id);
}
