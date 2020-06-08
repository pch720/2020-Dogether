package poly.service;

import poly.dto.GroupDTO;
import poly.dto.UserDTO;

public interface IUserService {
    int Reg(UserDTO uDTO) throws Exception;

    UserDTO login(UserDTO uDTO) throws Exception;

    String eCheck(String email) throws Exception;

    String nCheck(String name) throws  Exception;

    int MakeGG(GroupDTO gDTO) throws Exception;
}
