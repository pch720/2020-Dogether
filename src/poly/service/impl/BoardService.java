package poly.service.impl;

import org.springframework.stereotype.Service;
import poly.dto.BoardDTO;
import poly.persistance.mapper.IBoardMapper;
import poly.service.IBoardService;

import javax.annotation.Resource;
import java.util.List;

@Service("BoardService")
public class BoardService implements IBoardService {

    @Resource(name = "BoardMapper")
    private IBoardMapper boardMapper;

    @Override
    public int write(BoardDTO bDTO) throws Exception {
        return boardMapper.write(bDTO);
    }

    @Override
    public List<BoardDTO> getnotice(String seq) throws Exception {
        return boardMapper.getnotice(seq);
    }
}
