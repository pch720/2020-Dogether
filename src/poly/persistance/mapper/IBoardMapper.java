package poly.persistance.mapper;

import config.Mapper;
import poly.dto.BoardDTO;

import java.util.List;

@Mapper("BoardMapper")
public interface IBoardMapper {

    int write(BoardDTO bDTO) throws Exception;

    List<BoardDTO> getnotice(String seq) throws Exception;
}