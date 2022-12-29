package egovframework.hhg.sns.controller;

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

import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.gallery.service.GalleryService;
import egovframework.hhg.login.vo.UserVO;
import egovframework.hhg.reply.vo.ReplyVO;
import egovframework.hhg.sns.service.SnsService;

@Controller
public class SnsController {
	
	@Autowired
	SnsService snsService;
	@Autowired
	GalleryService galleryService;
	
	 @RequestMapping(value = "/sns/snsList.do", method = RequestMethod.GET)
	 public String snsList(BoardVO bvo, Model model, @RequestParam("m_seq") String m_seq) {
		 model.addAttribute("m_seq", m_seq);
		 return "sns/snsList";
	 }
	 
	 @ResponseBody
	 @RequestMapping(value = "/sns/snsInsertProc.do", method = RequestMethod.POST)
	 public void snsInsertProc(@RequestBody BoardVO bvo) {
		 snsService.snsInsertProc(bvo);
	 }
	 
	 @ResponseBody
	 @RequestMapping(value = "/sns/snsDeleteProc.do", method = RequestMethod.POST)
	 public void snsDeleteProc(@RequestBody BoardVO bvo) {
		 // 권한 체크
		 snsService.snsDeleteProc(bvo);
	 }
	 
	 @ResponseBody
	 @RequestMapping(value = "/sns/snsUpdateProc.do", method = RequestMethod.POST)
	 public void snsUpdateProc(@RequestBody BoardVO bvo) {
		 snsService.snsUpdateProc(bvo);
	 }
	 
	 @ResponseBody
	 @RequestMapping(value = "/sns/snsReplyInsertProc.do", method = RequestMethod.POST)
	 public void snsReplyInsertProc(@RequestBody ReplyVO rvo) {
		 snsService.snsReplyProc(rvo);
	 }

	 @ResponseBody
	 @RequestMapping(value = "/sns/snsReplyUpdateProc.do", method = RequestMethod.POST)
	 public void snsReplyUpdateProc(@RequestBody ReplyVO rvo) {
		 snsService.snsReplyUpdateProc(rvo);
	 }
	 
	 @ResponseBody
	 @RequestMapping(value = "/sns/snsReplyDeleteProc.do", method = RequestMethod.POST)
	 public Integer snsDeleteProc(@RequestBody ReplyVO rvo) {
		 snsService.snsReplyDeleteProc(rvo);
		 Integer r_new_cnt = snsService.getReplyCnt(rvo);
		 return r_new_cnt;
	 }
	 
	@ResponseBody
	@RequestMapping(value = "/sns/heart.do", method = RequestMethod.POST, produces = "application/json")
	public Integer heart(HttpServletRequest request, @RequestBody BoardVO bvo) {
		
		Integer h_cnt = snsService.getHeartLogCnt(bvo);
		
		System.out.println(h_cnt);
		
		if(h_cnt == null) {
			galleryService.heartLogInsert(bvo);
		} else {
			galleryService.heartLogUpdate(bvo);
		}
		
		Integer new_h_cnt = snsService.getHeartLogNew(bvo);
		System.out.println(new_h_cnt);
		
		return new_h_cnt;

	}
}

