package egovframework.hhg.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.hhg.board.service.BoardService;
import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.code.service.CodeService;
import egovframework.hhg.login.service.MenuService;
import egovframework.hhg.login.service.UserService;
import egovframework.hhg.login.vo.MenuVO;
import egovframework.hhg.login.vo.UserVO;
import egovframework.hhg.utills.vo.CodeVO;

@Controller
public class AdminController {

	@Autowired
	UserService userService;
	@Autowired
	BoardService boardService;
	@Autowired
	MenuService menuService;
	@Autowired
	CodeService codeService;
	
	@RequestMapping(value ="/admin/menuRegist.do", method = RequestMethod.GET)
	public String menuRegist(BoardVO bvo, Model model, HttpSession session, HttpServletRequest request) {
		
		if(session.getAttribute("login") == null) {			
			return "redirect:/errorPage.do";
		} 
		
		UserVO uvo = (UserVO) (session.getAttribute("login"));
		
		System.out.println(uvo.getU_type());
		
		if(uvo.getU_type() == 2 || uvo.getU_type() == 1) {
			List<BoardVO> typeList = boardService.boardType(bvo);
			model.addAttribute("typeList", typeList);
			
			List<MenuVO> authList = menuService.getMenuAuthList();
			model.addAttribute("authList", authList);
			
			List<MenuVO> allList = menuService.getMenuListAll();
			model.addAttribute("allList", allList);
			
			List<MenuVO> tyList = menuService.getMenuTyList();
			model.addAttribute("tyList", tyList);
		} else {
			return "redirect:/errorPage.do";
		}
		
		return "admin/menuRegist";
	}
	
	@RequestMapping(value = "/admin/codeInfo.do", method = RequestMethod.GET)
	public String codeInfo(Model model, CodeVO cvo, @RequestParam(value="searchVal", required = false) String searchVal, HttpSession session, HttpServletRequest request) {
		
		
		if(session.getAttribute("login") == null) {			
			return "redirect:/errorPage.do";
		} 
		
		UserVO uvo = (UserVO) (session.getAttribute("login"));
		
		System.out.println(uvo.getU_type());
		
		if(uvo.getU_type() == 2 || uvo.getU_type() == 1) {
			 if(searchVal != null) {
				 cvo.setSearchVal(searchVal);
			 }
			 
			 System.out.println(cvo.getViewType());
			
			List<CodeVO> codeList = codeService.getCodeMainList(cvo);
			model.addAttribute("codeList", codeList);
			model.addAttribute("searchKey", cvo.getSearchKey());
			model.addAttribute("viewType", cvo.getViewType());
		} else {
			return "redirect:/errorPage.do";
		}
		
		return "admin/codeInfo";
	}
	
	@ResponseBody
	@RequestMapping(value ="/admin/codeInfoProc.do", method = RequestMethod.POST)
	public String codeInfoInsertProc(@RequestBody CodeVO cvo) {

		List<CodeVO> codeAllList = codeService.getCodeList();
		for(CodeVO checkVO : codeAllList) {
			if(checkVO.getCode_id().equals(cvo.getCode_id())) {
				return "code_id_error";
			}
		}
		codeService.codeInsert(cvo);
		return "true";
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/codeInfoModifyProc.do", method = RequestMethod.POST)
	public String codeInfoModifyProc(@RequestBody CodeVO cvo) {
		List<CodeVO> codeAllList = codeService.getCodeList();
			for(CodeVO checkVO : codeAllList) {
				// checkVO 기존, cvo 새로운				
				if(checkVO.getPar_code_id() != null) {				
					if(checkVO.getPar_code_id().equals(cvo.getCode_id())) {
						codeService.codeDownUpdate(cvo);
					}
				}
			}
			codeService.codeUpdate(cvo);
		return "true";
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/codeInfoDe.do", method = RequestMethod.POST)
	public String codeInfoDelete(Model model, @RequestBody List<CodeVO> list) {
		for(CodeVO cvo : list) {
			System.out.println("!!!!!!!!! cvo.getCodeId" + cvo.getCode_id());
			codeService.codeDelete(cvo);
		}
		return "admin/codeInfo";
	}

	@RequestMapping(value = "/tiles/first.do")
	public String main(HttpServletRequest re, Model model) {
		
		List<MenuVO> authList = menuService.getMenuAuthList();
		model.addAttribute("authList", authList);
		
		List<MenuVO> allList = menuService.getMenuListAll();
		model.addAttribute("allList", allList);
		
		return "tiles/first";
	}
	
	@RequestMapping(value = "/etc/search.do", method = RequestMethod.GET)
	public String search() {
		return "etc/search";
	}
	
	@RequestMapping(value = "/admin/adminMain.do", method = RequestMethod.GET)
	public String adminMain() {
		return "admin/adminMain";
	}
	
	
	@RequestMapping(value = "/errorPage.do", method = RequestMethod.GET)
	public String error() {
		return "errorPage";
	}
	
	@RequestMapping(value = "/admin/menuLog.do", method = RequestMethod.GET)
	public String logProc(HttpSession session, HttpServletRequest request) {
		
		if(session.getAttribute("login") == null) {			
			return "redirect:/errorPage.do";
		}
		
		UserVO uvo = (UserVO) (session.getAttribute("login"));
		
		if(uvo.getU_type() == 2 || uvo.getU_type() == 1) {
			return "admin/menuLog";
		} else {			
			return "redirect:/errorPage.do";
		}
	}
	
	@ResponseBody
	@RequestMapping(value ="/admin/menuRegistProc.do", method = RequestMethod.POST)
	public String menuRegistProc(@RequestBody MenuVO mvo, Model model) {
		menuService.getMenuRegist(mvo);
		return "admin/menuRegist";
	}

	@ResponseBody
	@RequestMapping(value ="/admin/menuAuthRegistProc.do", method = RequestMethod.POST)
	public String menuAuthRegistProc(@RequestBody List<MenuVO> list, Model model) {
		for(MenuVO vo : list) {
			menuService.getMenuAuthRegist(vo);
		}
		return "admin/menuRegist";
	}
	
	@ResponseBody
	@RequestMapping(value ="/admin/menuDelUpdate.do", method = RequestMethod.POST)
	public String menuDelUpdate(@RequestBody MenuVO mvo, Model model) {
		menuService.getMenuDelUpdate(mvo);
		return "admin/menuRegist";
	}
	
	// 메뉴명만 업데이트
	@ResponseBody
	@RequestMapping(value ="/admin/menuUpdate.do", method = RequestMethod.POST)
	public String menuUpdate(@RequestBody MenuVO mvo, Model model) {
		menuService.getMenuUpdate(mvo);
		menuService.getMenuAuthDelete(mvo);
		return "admin/menuRegist";
	}

	@ResponseBody
	@RequestMapping(value ="/admin/menuAuthUpdateProc.do", method = RequestMethod.POST)
	public String menuAuthUpdateProc(@RequestBody List<MenuVO> list, Model model) {
		for(MenuVO vo : list) {
			menuService.getMenuAuthUpdate(vo);
		}
		return "admin/menuRegist";
	}
	
	@ResponseBody
	@RequestMapping(value ="/admin/menuAuthDeleteProc.do", method = RequestMethod.POST)
	public String menuAuthDeleteProc(BoardVO bvo, @RequestBody MenuVO vo, Model model) {
		menuService.getMenuAuthDelete(vo);
		menuService.getMenuDelete(vo);
		menuService.getMenuLogDel(vo);
		menuService.getMenuBoardDelete(vo);
		return "admin/menuRegist";
	}
}
