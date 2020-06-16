package poly.service;

import poly.dto.GroupDTO;

import java.util.List;

public interface IGroupService {
    int MakeGG(GroupDTO gDTO) throws Exception;

    int MkGG(GroupDTO gDTO) throws  Exception;

    List<GroupDTO> getgg(GroupDTO gDTO) throws Exception;

    String GnCheck(String gname) throws Exception;

    int Delgu(GroupDTO gDTO) throws Exception;

    String already(GroupDTO gDTO) throws Exception;

    GroupDTO getGroupInfo(String seq) throws Exception;

    String gg(GroupDTO gDTO) throws Exception;

    int chcount(GroupDTO gDTO) throws Exception;

    List<GroupDTO> users(String gname)throws Exception;
}
