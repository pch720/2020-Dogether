package poly.service.impl;

import org.springframework.stereotype.Service;
import poly.dto.GroupDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.IUserMapper;
import poly.service.IUserService;

import javax.annotation.Resource;
import java.util.List;

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

    @Override
    public String eCheck(String email) throws Exception {
        return userMapper.eCheck(email);
    }

    @Override
    public String nCheck(String name) throws Exception {
        return userMapper.nCheck(name);
    }

    @Override
    public List<GroupDTO> getGG(String function) throws Exception {
        return userMapper.getGG(function);
    }

    @Override
    public int deluser(String name) throws Exception {
        return userMapper.deluser(name);
    }

}
