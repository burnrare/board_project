package egovframework.hhg.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.hhg.board.service.BoardService;
import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.code.service.CodeService;
import egovframework.hhg.login.service.MenuService;
import egovframework.hhg.login.service.UserService;
import egovframework.hhg.login.vo.UserVO;
import egovframework.hhg.reply.service.ReplyService;
import egovframework.hhg.reply.vo.ReplyVO;
import egovframework.hhg.utills.vo.CodeVO;

@Controller
public class BoardController {

	/*
	 * 게시판 리스트 출력 22.11.03 황하경
	 */

	@Autowired
	BoardService boardService;
	@Autowired
	ReplyService replyService;
	@Autowired
	UserService userService;
	@Autowired
	MenuService menuService;
	@Autowired
	EgovPropertyService EgovService;
	@Autowired
	CodeService codeService;

	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(BoardVO bvo, Model model, @RequestParam("m_seq") Integer m_seq, @RequestParam(value="searchVal", required = false) String searchVal ) {
		
		Integer CntPerPage = bvo.getCntPerPage();

		 PaginationInfo pagingInfo = new PaginationInfo();
		 pagingInfo.setCurrentPageNo(bvo.getPageIndex());
		 pagingInfo.setRecordCountPerPage(CntPerPage); 
		 pagingInfo.setPageSize(5);
		 
		 int firstIndex = pagingInfo.getFirstRecordIndex();
		 int lastIndex = pagingInfo.getLastRecordIndex();
		 
		 bvo.setFirstIndex(firstIndex);
		 bvo.setLastIndex(lastIndex);	 
		 bvo.setM_seq(m_seq);
		 
		 if(searchVal != null) {
			 bvo.setSearchVal(searchVal);
		 }
		 
		 List<BoardVO> boardList = boardService.getBoardList(bvo);
		 int a = boardService.countBoardList(bvo); 

		 pagingInfo.setTotalRecordCount(a);
		 
		 List<BoardVO> noticeList = boardService.noticeList(bvo);
		 
		 model.addAttribute("pageIndex", bvo.getPageIndex());
		 model.addAttribute("searchKey", bvo.getSearchKey());
		 model.addAttribute("cntPerPage", CntPerPage);
		 model.addAttribute("paging", pagingInfo); 
		 model.addAttribute("noticeList", noticeList);
		 model.addAttribute("boardList", boardList);
		 model.addAttribute("m_seq", m_seq);

		return "board/boardList";

	}

	@RequestMapping(value = "/board/boardInsert.do", method = RequestMethod.GET)
	public String boardInsert(BoardVO bvo, Model model, @RequestParam("m_seq") String m_seq, HttpSession session, HttpServletRequest request) {

		if(session.getAttribute("login") == null) {			
			return "redirect:/errorPage.do";
		}
		
		List<BoardVO> typeList = boardService.boardType(bvo);
		List<CodeVO> codeAllList = codeService.getCodeList();
		model.addAttribute("codeAllList", codeAllList);
		model.addAttribute("typeList", typeList);
		model.addAttribute("m_seq", m_seq);
		
		return "board/boardInsert";

	}

	@RequestMapping(value = "/board/boardInsertProc.do", method = RequestMethod.POST)
	public String boardInsertProc(BoardVO bvo, Model model) {		
			boardService.boardInsertProc(bvo);
		return "redirect:/close.do";
	}

	@RequestMapping(value = "/board/boardRePost.do", method = RequestMethod.GET)
	public String boardRePost(BoardVO bvo, Model model, @RequestParam("m_seq") String m_seq, HttpServletRequest request,
			HttpSession session) {
		
		if(session.getAttribute("login") == null) {			
			return "redirect:/errorPage.do";
		}
		
		BoardVO boardPost = boardService.boardPost(bvo);
		List<CodeVO> codeAllList = codeService.getCodeList();
		model.addAttribute("codeAllList", codeAllList);
		model.addAttribute("boardPost", boardPost);
		model.addAttribute("m_seq", m_seq);
		
		return "board/boardRePost";
	}

	@RequestMapping(value = "/board/boardRePostProc.do", method = RequestMethod.POST)
	public String boardRePostProc(BoardVO bvo, Model model) {
		boardService.boardInsertProc(bvo);
		return "redirect:/close.do";
	}
	
	@GetMapping(value = "/board/boardPost.do")
	public String boardPost(BoardVO bvo, Model model, HttpServletResponse response,
			HttpSession session) {		
		
		BoardVO bP = boardService.boardPost(bvo);
		model.addAttribute("boardPost", bP);
		
		ReplyVO replyVO = new ReplyVO();
		replyVO.setR_board_id(bvo.getBoard_id());

		List<ReplyVO> replyList = replyService.getReplyList(replyVO);
		model.addAttribute("replyList", replyList);

		Integer board_id = bvo.getBoard_id();
		
		if(session.getAttribute("login") != null) {
		
			UserVO uvo = (UserVO) session.getAttribute("login");
			Integer user_id = uvo.getUser_id();
			
			bvo.setBoard_id(board_id);
			bvo.setUser_id(user_id);
			
			Integer v_cnt = userService.userViewLogList(bvo);
			
			if(v_cnt == null) {
				boardService.boardCntUp(board_id);
				userService.userViewLog(bvo);
			} else {
				return "board/boardPost";
			}
			
		}
		return "board/boardPost";
	}

	@RequestMapping(value = "/board/boardPostModify.do", method = RequestMethod.GET)
	public String boardModify(BoardVO bvo, Model model, @RequestParam("m_seq") String m_seq, HttpServletRequest request, HttpSession session) {
		
		
		if(session.getAttribute("login") == null) {			
			return "redirect:/errorPage.do";
		}
		
		
		BoardVO boardPost = boardService.boardPost(bvo);
		model.addAttribute("boardPost", boardPost);
		List<CodeVO> codeAllList = codeService.getCodeList();
		model.addAttribute("codeAllList", codeAllList);

		return "board/boardPostModify";

	}

	@RequestMapping(value = "/board/boardPostUp.do", method = RequestMethod.POST)
	public String boardPostUp(BoardVO bvo, Model model) {
		boardService.boardPostUp(bvo);
		return "redirect:/close.do";
	}

	@RequestMapping(value = "/board/boardPostDe.do", method = RequestMethod.GET)
	public String boardPostDe(BoardVO bvo, Model model) {
		boardService.boardPostDe(bvo);
		return "redirect:/close.do";
	}
	
	// 원래 댓글
	@RequestMapping(value = "/board/replyInsertProc.do", method = RequestMethod.POST)
	public String replyInsertProc(BoardVO bvo, ReplyVO rvo, Model model) {
		rvo.setR_board_id(bvo.getBoard_id());
		replyService.ReplyInsertProc(rvo);
		return "redirect:/board/boardPost.do?board_id=" + bvo.getBoard_id() + "&m_seq=" + bvo.getM_seq();
	}
	// 리댓글
	@RequestMapping(value = "/board/SecreplyInsertProc.do", method = RequestMethod.POST)
	public String secReplyProc(BoardVO bvo, ReplyVO rvo, Model model) {
		rvo.setR_board_id(bvo.getBoard_id());
		replyService.ReplyInsertProc(rvo);
		return "redirect:/board/boardPost.do?board_id=" + bvo.getBoard_id() + "&m_seq=" + bvo.getM_seq();
	}
}
