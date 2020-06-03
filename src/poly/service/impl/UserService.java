package poly.service.impl;

import org.springframework.stereotype.Service;
import poly.dto.UserDTO;
import poly.persistance.mapper.IUserMapper;
import poly.service.IUserService;

import javax.annotation.Resource;

@Service("UserService")
public class UserService implements IUserService {

    @Resource(name = "UserMapper")
    private IUserMapper userMapper;

    @Override
    public int Reg(UserDTO uDTO) throws Exception {
        return userMapper.Reg(uDTO);
    }

    @Override
    public UserDTO login(UserDTO uDTO) throws Exception {
        return userMapper.login(uDTO);
    }

}
