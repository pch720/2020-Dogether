package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface IUserMapper {
    int Reg(UserDTO uDTO) throws Exception;

    UserDTO login(UserDTO uDTO)throws Exception;
}
