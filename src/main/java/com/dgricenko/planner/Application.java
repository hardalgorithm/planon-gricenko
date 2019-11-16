package com.dgricenko.planner;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

//    @Bean
//    public CommandLineRunner runner(UserRepo userRepo){
//        return new CommandLineRunner() {
//            @Override
//            public void run(String... args) throws Exception {
//                for (int i = 0; i < 3; i++){
//                    User user = new User("userName"+i,"000"+i);
//                    userRepo.save(user);
//                }
//            }
//        };
//    }
}
