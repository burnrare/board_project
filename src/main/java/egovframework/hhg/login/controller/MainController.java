package egovframework.hhg.login.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.login.service.MenuService;
import egovframework.hhg.login.service.UserService;
import egovframework.hhg.login.validation.UserValidator;
import egovframework.hhg.login.vo.MenuVO;
import egovframework.hhg.login.vo.UserVO;
import egovframework.hhg.survey.vo.SurveyVO;
import egovframework.hhg.utills.common.Common;
@Controller
public class MainController {

	@Autowired
	UserService userService;
	@Autowired
	MenuService menuService;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(@ModelAttribute("userVo") @Valid UserVO userVo) {
		return "login";
	}

	@ResponseBody
	@RequestMapping(value = "/loginProc.do", method = RequestMethod.POST, produces = "application/json")
	public Integer loginProc(HttpServletRequest re, @RequestBody UserVO vo) {
		
		UserVO login = userService.userLoginProc(vo);
		HttpSession session = re.getSession();

		if (login != null) {
			session.setAttribute("login", login);
			return 0;
		} else {
			return 2;
		}

	}

	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login.do";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join(@ModelAttribute("userVo") @Valid UserVO userVo, Model model) {
		model.addAttribute("userVo", userVo);
		return "join";
	}

	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/joinProc.do", method = RequestMethod.POST)
	public String joinProc(@ModelAttribute("userVo") @Valid UserVO userVo, HttpServletRequest re,
			BindingResult bindingResult, Model model) {

		new UserValidator().validate(userVo, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("userVo", userVo);
			return "join";
		} else {
			userService.userJoinProc(userVo);
			return "redirect:/login.do";
		}
	}

	@RequestMapping(value = "/checkId", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody Integer checkId(UserVO uvo, Model model) {
		return userService.idCheck(uvo);
	}

	@RequestMapping(value = "/close.do")
	public String close() {
		return "close";
	}
	
	@RequestMapping(value = "/tiles/tiles-layout.do", method = RequestMethod.GET)
	public String tiles() {
		return "tiles/tiles-layout";
	}
	
	@RequestMapping(value ="/etc/searchAll.do", method = RequestMethod.GET)
	public String searchAll(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "AllsearchVal") String searchVal) {
			
		    HttpSession session = request.getSession();
			UserVO uvo = new UserVO();
			MenuVO muvo = new MenuVO();
			
			if(session.getAttribute("login") != null) {
				uvo = (UserVO) session.getAttribute("login");
				muvo.setAuth_type(uvo.getU_type());
			} else {
				muvo.setAuth_type(null);
			}

			List<MenuVO> mList = menuService.getUserMenuAuthList(muvo);
			model.addAttribute("menuAuthList", mList);

			ArrayList<List> boardList = new ArrayList<List>();
			ArrayList<List> surveyList = new ArrayList<List>();
			List<MenuVO> menuList = new ArrayList<>();
			
			System.out.println(searchVal);
			
			// board, survey search
			if(!mList.isEmpty()) {
				for(MenuVO vo : mList) {
					
					MenuVO mvo = menuService.getUserMenuList(vo.getM_seq());
					
					if(mvo != null) {
						if(searchVal != null) {							
							mvo.setSearchVal(searchVal);
						} else {
							mvo.setSearchVal(null);
						}
						
						List<BoardVO> bvo = menuService.getUserBoardList(mvo);
						List<SurveyVO> svo = menuService.getUserSurveyList(mvo);
						
						if(!bvo.isEmpty()) {				
							menuList.add(mvo);
							boardList.add(bvo);
							
							for(BoardVO btvo : bvo) {
								btvo.setB_regist_dt(Common.formatTimeString(btvo.getB_regist_dt(), menuService));
							}
							
						}
						
						if(!svo.isEmpty()) {
							menuList.add(mvo);
							surveyList.add(svo);
						}
						
					}
					
				}
			}
			model.addAttribute("searchList", boardList);
			model.addAttribute("searchList2", surveyList);
			model.addAttribute("menuList", menuList);
			model.addAttribute("AllsearchVal", searchVal);
		return "etc/search";
	}
	
	@ResponseBody
	@RequestMapping(value="/etc/linkLog.do", method = RequestMethod.POST)
	public String linkClick(@RequestBody MenuVO mvo) {
		menuService.getMenuLog(mvo);
		return "etc/linkLog";
	}
}
