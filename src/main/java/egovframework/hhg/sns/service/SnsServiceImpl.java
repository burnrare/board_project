package egovframework.hhg.sns.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.hhg.board.service.BoardMapper;
import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.reply.vo.ReplyVO;

@Service
public class SnsServiceImpl implements SnsService {
	
	@Autowired
	SnsMapper snsMapper; 
	@Autowired
	BoardMapper boardMapper; 

	@Override
	public List<BoardVO> GetSnsList(BoardVO bvo) {
		// 맨 처음 뿌려 줄 list
		return snsMapper.GetSnsList(bvo);
	}

	@Override
	public List<BoardVO> GetSnsScrollList(BoardVO bvo) {
		return snsMapper.GetSnsScrollList(bvo);
	}

	@Transactional
	@Override
	public void snsInsertProc(BoardVO bvo) {
		snsMapper.snsInsertProc(bvo);
	}

	@Override
	public void snsDeleteProc(BoardVO bvo) {
		snsMapper.snsDeleteProc(bvo);
	}

	@Override
	public void snsUpdateProc(BoardVO bvo) {
		snsMapper.snsUpdateProc(bvo);
	}

	@Override
	public BoardVO getUpdateList(BoardVO bvo) {
		return snsMapper.getUpdateList(bvo);
	}

	@Override
	public BoardVO getInsertList(BoardVO bvo) {
		return snsMapper.getInsertList(bvo);
	}

	@Override
	public void snsReplyProc(ReplyVO rvo) {
		snsMapper.snsReplyProc(rvo);
		Integer board_id = rvo.getR_board_id();
		System.out.println(board_id);
		boardMapper.boardReplyCount(board_id, 1);
	}

	@Override
	public List<ReplyVO> getReplyList(ReplyVO rvo) {
		return snsMapper.getReplyList(rvo);
	}

	@Override
	public void snsReplyCount(BoardVO bvo) {
		snsMapper.snsReplyCount(bvo);
	}

	@Override
	public void snsReplyUpdateProc(ReplyVO rvo) {
		snsMapper.snsReplyUpdateProc(rvo);
	}

	@Override
	public void snsReplyDeleteProc(ReplyVO rvo) {
		snsMapper.snsReplyDeleteProc(rvo);
		Integer board_id = rvo.getR_board_id();
		System.out.println(board_id);
		snsMapper.snsReplyDeleteCount(board_id, 1);
	}

	@Override
	public ReplyVO getReplyUpdateList(ReplyVO rvo) {
		return snsMapper.getReplyUpdateList(rvo);
	}

	@Override
	public ReplyVO getReplyInsertList(ReplyVO rvo) {
		return snsMapper.getReplyInsertList(rvo);
	}

	@Override
	public List<BoardVO> getHeartList() {
		return snsMapper.getHeartList();
	}

	@Override
	public List<BoardVO> getSnsListSearch(BoardVO bvo) {
		return snsMapper.getSnsListSearch(bvo);
	}

	@Override
	public List<BoardVO> getSnsListUserSearch(BoardVO bvo) {
		return snsMapper.getSnsListUserSearch(bvo);
	}

	@Override
	public Integer getHeartLogCnt(BoardVO bvo) {
		return snsMapper.getHeartLogCnt(bvo);
	}

	@Override
	public Integer getHeartLogNew(BoardVO bvo) {
		return snsMapper.getHeartLogNew(bvo);
	}

	@Override
	public Integer getReplyCnt(ReplyVO rvo) {
		return snsMapper.getReplyCnt(rvo);
	}

}
