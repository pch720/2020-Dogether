package poly.service.impl;

import org.springframework.stereotype.Service;
import poly.persistance.mapper.IGroupMapper;

import javax.annotation.Resource;

@Service("GroupService")
public class GroupService {
    @Resource(name = "GroupMapper")
    private IGroupMapper groupMapper;
}
