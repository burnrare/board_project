package egovframework.hhg.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.login.vo.LogVO;
import egovframework.hhg.login.vo.MenuVO;
import egovframework.hhg.login.vo.UserVO;
import egovframework.hhg.survey.vo.SurveyVO;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	MenuMapper menuMapper;

	@Override
	public List<MenuVO> getMenuList() {
		return menuMapper.getMenuList();
	}

	@Override
	public List<MenuVO> getMenuAuthList() {
		return menuMapper.getMenuAuthList();
	}

	@Override
	public void getMenuRegist(MenuVO mvo) {
		menuMapper.getMenuRegist(mvo);
	}

	@Override
	public void getMenuAuthAllRegist(List<MenuVO> list) {
		for(MenuVO vo : list) {
			menuMapper.getMenuAuthRegist(vo);
		}
	}

	@Override
	public void getMenuAuthRegist(MenuVO mvo) {
		menuMapper.getMenuAuthRegist(mvo);
	}

	@Override
	public void getMenuDelUpdate(MenuVO mvo) {
		menuMapper.getMenuDelUpdate(mvo);
	}

	@Override
	public List<MenuVO> getMenuListAll() {
		return menuMapper.getMenuListAll();
	}

	@Override
	public List<MenuVO> getSearchAll(MenuVO mvo) {
		return menuMapper.getSearchAll(mvo);
	}

	@Override
	public List<MenuVO> getMenuTyList() {
		return menuMapper.getMenuTyList();
	}

	@Override
	public void getMenuDelete(MenuVO mvo) {
		menuMapper.getMenuDelete(mvo);
	}

	@Override
	public void getMenuAuthDelete(MenuVO mvo) {
		menuMapper.getMenuAuthDelete(mvo);
	}

	@Override
	public List<MenuVO> getMenuAuthType(String m_seq) {
		return menuMapper.getMenuAuthType(m_seq);
	}

	@Override
	public List<MenuVO> getUserMenuAuthList(MenuVO mvo) {
		return menuMapper.getUserMenuAuthList(mvo);
	}

	@Override
	public MenuVO getUserMenuList(Integer m_seq) {
		return menuMapper.getUserMenuList(m_seq);
	}

	@Override
	public List<BoardVO> getUserBoardList(MenuVO mvo2) {
		return menuMapper.getUserBoardList(mvo2);
	}

	@Override
	public List<SurveyVO> getUserSurveyList(MenuVO mvo2) {
		return menuMapper.getUserSurveyList(mvo2);
	}

	@Override
	public void getMenuLog(MenuVO mvo) {
		menuMapper.getMenuLog(mvo);
	}

	@Override
	public List<LogVO> getMenuLogYear() {
		return menuMapper.getMenuLogYear();
	}

	@Override
	public List<LogVO> getMenuLogMonth() {
		return menuMapper.getMenuLogMonth();
	}

	@Override
	public List<LogVO> getMenuLogDay() {
		return menuMapper.getMenuLogDay();
	}

	@Override
	public List<LogVO> getMenuLogTime() {
		return menuMapper.getMenuLogTime();
	}

	@Override
	public void getMenuLogDel(MenuVO mvo) {
		menuMapper.getMenuLogDel(mvo);
	}

	@Override
	public void getMenuUpdate(MenuVO mvo) {
		menuMapper.getMenuUpdate(mvo);
	}

	@Override
	public void getMenuAuthUpdate(MenuVO vo) {
		menuMapper.getMenuAuthUpdate(vo);
	}

	@Override
	public void getMenuBoardDelete(MenuVO mvo) {
		menuMapper.getMenuBoardDelete(mvo);
	}

	@Override
	public int selectCompareTime(String regTime) {
		return menuMapper.selectCompareTime(regTime);
	}

}
