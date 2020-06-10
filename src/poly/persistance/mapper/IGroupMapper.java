package poly.persistance.mapper;

import config.Mapper;
import poly.dto.GroupDTO;

@Mapper("GroupMapper")
public interface IGroupMapper {

    int MakeGG(GroupDTO gDTO) throws Exception;

    int MkGG(GroupDTO gDTO) throws Exception;
}
