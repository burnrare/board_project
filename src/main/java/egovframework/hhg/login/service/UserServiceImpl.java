package egovframework.hhg.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.login.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Override
	public UserVO userLoginProc(UserVO userVo) {
		return userMapper.userLoginProc(userVo);
	}

	@Override
	public void userJoinProc(UserVO userVo) {
		userMapper.userJoinProc(userVo);
	}

	@Override
	public Integer idCheck(UserVO userVo) {
		return userMapper.idCheck(userVo);
	}

	@Override
	public Integer pwdCheck(UserVO userVo) {
		return userMapper.pwdCheck(userVo);
	}

	@Override
	public void userViewLog(BoardVO bvo) {
		userMapper.userViewLog(bvo);
	}
	
	@Override
	public Integer userViewLogList(BoardVO bvo) {
		return userMapper.userViewLogList(bvo);
	}
}
