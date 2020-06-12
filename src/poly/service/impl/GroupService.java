package poly.service.impl;

import org.springframework.stereotype.Service;
import poly.dto.GroupDTO;
import poly.persistance.mapper.IGroupMapper;
import poly.service.IGroupService;

import javax.annotation.Resource;
import java.util.List;

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

    @Override
    public List<GroupDTO> getgg(GroupDTO gDTO) throws Exception {
        return groupMapper.getgg(gDTO);
    }

    @Override
    public String GnCheck(String gname) throws Exception {
        return groupMapper.GnCheck(gname);
    }

    @Override
    public int Delgu(GroupDTO gDTO) throws Exception {
        return groupMapper.Delgu(gDTO);
    }

    @Override
    public String already(GroupDTO gDTO) throws Exception {
        return groupMapper.already(gDTO);
    }

    @Override
    public GroupDTO getGroupInfo(String seq) throws Exception {
        return groupMapper.getGroupInfo(seq);
    }
}
