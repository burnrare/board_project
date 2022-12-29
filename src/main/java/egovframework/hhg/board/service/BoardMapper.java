package egovframework.hhg.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.hhg.board.vo.BoardVO;

@Mapper
public interface BoardMapper {
	public List<BoardVO> getBoardList (BoardVO boardVo);
	public void boardInsertProc(BoardVO boardVo);
	public BoardVO boardPost(BoardVO boardVo);
	public void boardPostUp (BoardVO boardVo);
	public void boardPostDe (BoardVO boardVo);
	public Integer boardCntUp (Integer board_id);
	
	public Integer countBoardList(BoardVO boardVo);
	public List<BoardVO> boardType(BoardVO boardVo);
	
	public List<BoardVO> noticeList (BoardVO boardVo);
	
	public void boardReplyCount (@Param("board_id") Integer board_id, @Param("amount") Integer amount);
}
