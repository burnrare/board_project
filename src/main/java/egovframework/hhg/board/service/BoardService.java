package egovframework.hhg.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import egovframework.hhg.board.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> getBoardList (BoardVO boardVo);
	public void boardInsertProc(BoardVO boardVo);
	public BoardVO boardPost(BoardVO boardVo);
	public void boardPostUp (BoardVO boardVo);
	public void boardPostDe (BoardVO boardVo);
	public Integer boardCntUp (Integer board_id);
	
	public List<BoardVO> boardType(BoardVO boardVo);
	
	public List<BoardVO> noticeList (BoardVO boardVo);
	public Integer countBoardList(BoardVO boardVo);

}
