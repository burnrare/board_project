package egovframework.hhg.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.hhg.board.vo.BoardVO;

@Service	
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getBoardList(BoardVO boardVo) {
		return boardMapper.getBoardList(boardVo);
	}

	@Override
	public void boardInsertProc(BoardVO boardVo) {
		boardMapper.boardInsertProc(boardVo);
	}

	@Override
	public BoardVO boardPost(BoardVO boardVo) {
		return boardMapper.boardPost(boardVo);
	}

	@Override
	public Integer boardCntUp(Integer board_id) {
		return boardMapper.boardCntUp(board_id);
	}

	@Override
	public void boardPostUp(BoardVO boardVo) {
		boardMapper.boardPostUp(boardVo);
	}

	@Override
	public void boardPostDe(BoardVO boardVo) {
		boardMapper.boardPostDe(boardVo);
	}

	@Override
	public Integer countBoardList(BoardVO boardVo) {
		return boardMapper.countBoardList(boardVo);
	}

	@Override
	public List<BoardVO> boardType(BoardVO boardVo) {
		return boardMapper.boardType(boardVo);
	}

	@Override
	public List<BoardVO> noticeList(BoardVO boardVo) {
		return boardMapper.noticeList(boardVo);
	}
}
