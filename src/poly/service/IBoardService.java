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

    int MNotice(BoardDTO bDTO) throws Exception;

    int writerep(BoardDTO bDTO) throws Exception;

    List<BoardDTO> getrep(String seq) throws Exception;

    int delrep(String seq) throws Exception;

    int like(BoardDTO bDTO)throws Exception;

    int ML(BoardDTO bDTO) throws Exception;

    int DL(BoardDTO bDTO) throws Exception;

    String CL(BoardDTO bDTO) throws Exception;
}
