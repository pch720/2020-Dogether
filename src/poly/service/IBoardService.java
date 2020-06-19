package poly.service;

import poly.dto.BoardDTO;
import poly.dto.GroupDTO;

import java.util.List;

public interface IBoardService {
    int write(BoardDTO bDTO) throws Exception;

    List<BoardDTO> getnotice(String seq) throws Exception;

    int delwork(BoardDTO bDTO) throws Exception;

    int finwork(BoardDTO bDTO) throws Exception;

    List<BoardDTO> getUnotice(GroupDTO gDTO) throws Exception;
}
