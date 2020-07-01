package poly.service;

import poly.dto.GroupDTO;
import poly.dto.UserDTO;

import java.util.List;

public interface IUserService {
    int Reg(UserDTO uDTO) throws Exception;

    UserDTO login(UserDTO uDTO) throws Exception;

    String eCheck(String email) throws Exception;

    String nCheck(String name) throws  Exception;

    List<GroupDTO> getGG(String function) throws Exception;

    int deluser(String name) throws Exception;
}
