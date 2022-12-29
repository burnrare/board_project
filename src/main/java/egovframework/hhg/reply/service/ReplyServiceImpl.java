package egovframework.hhg.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.hhg.board.service.BoardMapper;
import egovframework.hhg.reply.vo.ReplyVO;

@Service	
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper replyMapper;
	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public List<ReplyVO> getReplyList(ReplyVO replyVo) {
		return replyMapper.getReplyList(replyVo);
	}

	@Transactional
	@Override
	public void ReplyInsertProc(ReplyVO replyVo) {
		replyMapper.ReplyInsertProc(replyVo);
		Integer board_id = replyVo.getR_board_id();
		boardMapper.boardReplyCount(board_id, 1);
	}

}
