package poly.service.impl;

import org.springframework.stereotype.Service;
import poly.dto.GroupDTO;
import poly.persistance.mapper.IGroupMapper;
import poly.service.IGroupService;

import javax.annotation.Resource;

@Service("GroupService")
public class GroupService implements IGroupService
{
    @Resource(name = "GroupMapper")
    private IGroupMapper groupMapper;

    @Override
    public int MakeGG(GroupDTO gDTO) throws Exception {
        return groupMapper.MakeGG(gDTO);
    }

    @Override
    public int MkGG(GroupDTO gDTO) throws Exception {
        return groupMapper.MkGG(gDTO);
    }
}
