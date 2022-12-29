package egovframework.hhg.login.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.login.vo.UserVO;

@Mapper
public interface UserMapper {
	public void userJoinProc(UserVO userVo);
	public UserVO userLoginProc(UserVO userVo);
	
	public Integer idCheck(UserVO userVo);
	public Integer pwdCheck(UserVO userVo);
	
	public void userViewLog(BoardVO bvo);
	public Integer userViewLogList(BoardVO bvo);
}
