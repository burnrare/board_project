package egovframework.hhg.reply.service;

import java.util.List;

import egovframework.hhg.reply.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> getReplyList (ReplyVO replyVo);
	public void ReplyInsertProc (ReplyVO replyVo);
}
