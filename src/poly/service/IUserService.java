package poly.service;

import poly.dto.UserDTO;

public interface IUserService {
    int Reg(UserDTO uDTO) throws Exception;

    UserDTO login(UserDTO uDTO) throws Exception;
}
