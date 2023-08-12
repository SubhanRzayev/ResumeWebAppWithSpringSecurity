package com.company.controller;

import com.company.dto.ResponseDTO;
import com.company.dto.UserDTO;
import com.company.entity.User;
import com.company.service.inter.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
public class UserRestController {

    @Autowired
    private UserServiceInter userService;

    @CrossOrigin(origins = "http://localhost:8081")
    @GetMapping(value = "/users")
    private ResponseEntity<ResponseDTO> getUser(
            @RequestParam(name = "name", required = false) String name,
            @RequestParam(name = "surname", required = false) String surname,
            @RequestParam(name = "age", required = false) Integer age
    ) {
        List<User> users = userService.getAll(name, surname, age);

        List<UserDTO> userDTOS = new ArrayList<>();
        for (int i = 0; i < users.size(); i++) {
            User u = users.get(i);
            userDTOS.add(new UserDTO(u));
        }

        return ResponseEntity.ok(ResponseDTO.of(userDTOS));
//        return ResponseEntity.status(HttpStatus.OK).body(userDTOS);
    }

    @CrossOrigin(origins = "http://localhost:8081")
    @GetMapping(value = "/users/{id}")
    private ResponseEntity<ResponseDTO> getUserById(@PathVariable("id") int id) {
        User user = userService.getUserById(id);
        return ResponseEntity.ok(ResponseDTO.of(new UserDTO(user)));
    }

    @CrossOrigin(origins = "http://localhost:8081")
    @DeleteMapping(value = "/users/{id}")
    private ResponseEntity<ResponseDTO> deleteUser(@PathVariable("id") int id) {
        User user = userService.getUserById(id);
        userService.removeUser(id);

        return ResponseEntity.ok(ResponseDTO.of(new UserDTO(user), "Successfully deleted"));
    }

    @CrossOrigin(origins = "http://localhost:8081")
    @PostMapping(value = "/users")
    public ResponseEntity<ResponseDTO> addUser(@RequestBody UserDTO userDTO) {
        User user = new User();
        user.setName(userDTO.getName());
        user.setSurname(userDTO.getSurname());
        user.setPassword(userDTO.getPassword());
        userService.addUser(user);
        return ResponseEntity.ok(ResponseDTO.of(new UserDTO(user), "Successfully added"));
    }
}
