package egovframework.hhg.reply.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.hhg.reply.vo.ReplyVO;

@Mapper
public interface ReplyMapper {
	public List<ReplyVO> getReplyList (ReplyVO replyVo);
	public void ReplyInsertProc (ReplyVO replyVo);
	public void SecReplyInsertProc (ReplyVO replyVo);
	public void ReplyUpdateStepProc (ReplyVO replyVo);
}
