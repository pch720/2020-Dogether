package poly.service;

import poly.dto.BoardDTO;

import java.util.List;

public interface IBoardService {
    int write(BoardDTO bDTO) throws Exception;

    List<BoardDTO> getnotice(String seq) throws Exception;

    int delwork(BoardDTO bDTO) throws Exception;
}
