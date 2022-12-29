package egovframework.hhg.sns.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.gallery.service.GalleryService;
import egovframework.hhg.login.service.MenuService;
import egovframework.hhg.reply.vo.ReplyVO;
import egovframework.hhg.sns.service.SnsService;
import egovframework.hhg.utills.common.Common;

@RestController
public class SnsRestController {

	@Autowired
	SnsService snsService;
	@Autowired
	GalleryService galleryService;
	@Autowired
	MenuService menuService;

	@ResponseBody
	@RequestMapping(value = "/sns/snsList.do", method = RequestMethod.POST)
	public List<BoardVO> sns(BoardVO bvo) {
		System.out.println("!!!!! restController " + bvo.toString());
		List<BoardVO> snsList = snsService.GetSnsList(bvo);
		
		if(!snsList.isEmpty()) {
			for(BoardVO btvo : snsList) {
				btvo.setB_regist_dt(Common.formatTimeString(btvo.getB_regist_dt(), menuService));
			}
		}
		
		return snsList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/sns/snsListSearch.do", method = RequestMethod.POST)
	public List<BoardVO> snsSearch(@RequestBody BoardVO bvo) {
		List<BoardVO> snsListSearch = snsService.getSnsListSearch(bvo);
		return snsListSearch;
	}
	
	@ResponseBody
	@RequestMapping(value = "/sns/snsListUserSearch.do", method = RequestMethod.POST)
	public List<BoardVO> snsUserSearch(@RequestBody BoardVO bvo) {
		List<BoardVO> snsListUserSearch = snsService.getSnsListUserSearch(bvo);
		return snsListUserSearch;
	}
	
	@ResponseBody
	@RequestMapping(value = "/sns/heartList.do", method = RequestMethod.POST)
	public List<BoardVO> heart1(BoardVO bvo) {
		List<BoardVO> heartList = snsService.getHeartList();
		return heartList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/sns/heartChk.do", method = RequestMethod.POST)
	public Integer heart2(@RequestBody BoardVO bvo) {
		Integer heart = galleryService.getHeartCnt(bvo);
		System.out.println(heart);
		return heart;
	}

	@ResponseBody
	@RequestMapping(value = "/sns/snsReplyList.do", method = RequestMethod.POST)
	public List<ReplyVO> reply(ReplyVO rvo) {
		System.out.println(rvo.getR_board_id());
		List<ReplyVO> replyList = snsService.getReplyList(rvo);
		
		if(!replyList.isEmpty()) {
			for(ReplyVO rtvo : replyList) {
				rtvo.setR_regist_dt(Common.formatTimeString(rtvo.getR_regist_dt(), menuService));
			}
		}
		
		return replyList;
	}

	@ResponseBody
	@RequestMapping(value = "/sns/snsUpdateList.do", method = RequestMethod.POST)
	public BoardVO snsUpdate(@RequestBody BoardVO bvo) {
		System.out.println(bvo.getBoard_id());
		BoardVO update = snsService.getUpdateList(bvo);
		update.setB_regist_dt(Common.formatTimeString(update.getB_regist_dt(), menuService));
		return update;
	}

	@ResponseBody
	@RequestMapping(value = "/sns/snsInsertList.do", method = RequestMethod.POST)
	public BoardVO snsInsert(@RequestBody BoardVO bvo) {
		BoardVO insert = snsService.getInsertList(bvo);
		return insert;
	}

	@ResponseBody
	@RequestMapping(value = "/sns/snsReplyUpdateList.do", method = RequestMethod.POST)
	public ReplyVO snsReplyUpdate(@RequestBody ReplyVO rvo) { // BoardVO update =
		ReplyVO update = snsService.getReplyUpdateList(rvo);
		update.setR_regist_dt(Common.formatTimeString(update.getR_regist_dt(), menuService));
		return update;
	}

	@ResponseBody
	@RequestMapping(value = "/sns/snsReplyInsertList.do", method = RequestMethod.POST)
	public ReplyVO snsReplyInsert(@RequestBody ReplyVO rvo) { // BoardVO insert =
		ReplyVO insert = snsService.getReplyInsertList(rvo);
		Integer r_new_cnt = snsService.getReplyCnt(rvo);
		insert.setR_regist_dt(Common.formatTimeString(insert.getR_regist_dt(), menuService));
		insert.setR_new_cnt(r_new_cnt);
		
		return insert;
	}

}
