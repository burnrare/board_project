package egovframework.hhg.login.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.login.vo.LogVO;
import egovframework.hhg.login.vo.MenuVO;
import egovframework.hhg.login.vo.UserVO;
import egovframework.hhg.survey.vo.SurveyVO;

@Mapper
public interface MenuMapper {
	public List<MenuVO> getMenuList ();
	public List<MenuVO> getMenuListAll();
 	public List<MenuVO> getMenuAuthList();
 	public List<MenuVO> getMenuAuthType(String m_seq);
	
 	public void getMenuRegist(MenuVO mvo);
	public void getMenuAuthRegist(MenuVO mvo);
	
	public void getMenuAuthAllRegist(List<MenuVO> mvo);
	public void getMenuDelUpdate(MenuVO mvo);
	public void getMenuDelete(MenuVO mvo);
	public void getMenuAuthDelete(MenuVO mvo);
	public void getMenuBoardDelete(MenuVO mvo);
	public void getMenuUpdate(MenuVO mvo);
	public void getMenuAuthUpdate(MenuVO vo);
	
	public List<MenuVO> getMenuTyList();
	public MenuVO getUserMenuList(Integer m_seq);
	
	public void getMenuLog(MenuVO mvo);
	public void getMenuLogDel(MenuVO mvo);
	
	// 통합검색
	public List<MenuVO> getSearchAll(MenuVO mvo);
	public List<MenuVO> getUserMenuAuthList(MenuVO mvo);
	public List<BoardVO> getUserBoardList(MenuVO mvo2);
	public List<SurveyVO> getUserSurveyList(MenuVO mvo2);
	
	//통계
	public List<LogVO> getMenuLogYear();
	public List<LogVO> getMenuLogMonth();
	public List<LogVO> getMenuLogDay();
	public List<LogVO> getMenuLogTime();
	public int selectCompareTime(String regTime);
}
