package egovframework.hhg.sns.service;

import java.util.List;

import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.reply.vo.ReplyVO;

public interface SnsService {
	public List<BoardVO> GetSnsList(BoardVO bvo);
	public List<BoardVO> getSnsListSearch(BoardVO bvo);
	public List<BoardVO> getSnsListUserSearch(BoardVO bvo);
	public List<BoardVO> GetSnsScrollList(BoardVO bvo);
	public List<ReplyVO> getReplyList(ReplyVO rvo);
	public BoardVO getUpdateList(BoardVO bvo);
	public BoardVO getInsertList(BoardVO bvo);
	public void snsInsertProc(BoardVO bvo);
	public void snsDeleteProc(BoardVO bvo);
	public void snsUpdateProc(BoardVO bvo);
	
	public ReplyVO getReplyUpdateList(ReplyVO rvo);
	public ReplyVO getReplyInsertList(ReplyVO rvo);
	public void snsReplyUpdateProc(ReplyVO rvo);
	public void snsReplyDeleteProc(ReplyVO rvo);
	public void snsReplyProc(ReplyVO rvo);
	public void snsReplyCount(BoardVO bvo);
	
	public List<BoardVO> getHeartList();
	public Integer getHeartLogCnt(BoardVO bvo);
	public Integer getHeartLogNew(BoardVO bvo);
	public Integer getReplyCnt(ReplyVO rvo);

}
