package egovframework.hhg.survey.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.hhg.login.vo.UserVO;
import egovframework.hhg.survey.service.SurveyService;
import egovframework.hhg.survey.service.SurveyServiceImpl;
import egovframework.hhg.survey.vo.SurveyAnswerVO;
import egovframework.hhg.survey.vo.SurveyQuestionVO;
import egovframework.hhg.survey.vo.SurveyUtileVO;
import egovframework.hhg.survey.vo.SurveyVO;

@Controller
public class SurveyController {
	
	@Autowired
	SurveyService surveyService;
	@Autowired
	SurveyServiceImpl surveyImpl;
	
	@RequestMapping(value = "/survey/surveyList.do", method = RequestMethod.GET)
	public String surveyList(SurveyVO svo, Model model) {
		
		
		System.out.println(svo.getM_seq());
		
		List<SurveyVO> surveyList = surveyService.getSurveyList(svo);
		model.addAttribute("surveyList", surveyList);
		
		return "survey/surveyList";
	}
	
	@RequestMapping(value = "/survey/surveyErr.do", method = RequestMethod.GET)
	public String surveyErr(SurveyVO survey, HttpServletRequest request) {
		
		SurveyVO svo = surveyService.getSurveyPost(survey);
		System.out.println(svo.getSur_login_yn());
		
		char login_yn = svo.getSur_login_yn(); // 로그인 여부
		
		HttpSession ses = request.getSession();
		
		ses.setAttribute("login_yn", login_yn);
		
		return "survey/surveyErr";
	}
	
	@RequestMapping(value = "/survey/surveyMain.do", method = RequestMethod.GET)
	public String survayMain(SurveyVO survey, SurveyAnswerVO savo, Model model, HttpServletRequest request) {

		SurveyVO svo = surveyService.getSurveyPost(survey);
		
        // 현재 날짜 구하기
		String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
        // 포맷 적용
		Date startday = null;
		Date today = null;
		Date endday = null;
		
			try {
				startday = dateFormat.parse(svo.getStart_dt());
				today = dateFormat.parse(todayfm);
				endday = dateFormat.parse(svo.getEnd_dt());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Integer compare = startday.compareTo(today);
			Integer compare2 = endday.compareTo(today);
			
			if(compare > 0) {
				// startday > today
				model.addAttribute("compare", compare);
				return "survey/surveyErr";
				
			} else if(compare2 < 0) {
				//endday < today
				model.addAttribute("compare2", compare2);
				return "survey/surveyErr";
			} else {
				
		HttpSession ses = request.getSession();
		int sur_id = svo.getSur_id();
		char login_yn = svo.getSur_login_yn(); // 로그인 여부
		int subCnt = svo.getSur_submit_cnt(); // 몇 번 참여 가능한지
		
		model.addAttribute("login", ses.getAttribute("login")); // 로그인 여부
		
		if(login_yn == 'Y') { // 로그인 필요하다

			if(ses.getAttribute("login") == null) {
				return "survey/surveyErr";
			} else {	
				int userId = ((UserVO) request.getSession().getAttribute("login")).getUser_id();
				model.addAttribute("surveyMain", svo);

				Integer cnt = surveyService.getSurveySubmit(userId); // 참여했는지 안 했는지
				System.out.println(cnt);
				
				if(subCnt != 0) {
						if(cnt == subCnt) {
							model.addAttribute("existSubmit", cnt); // 참여했으면 1 아니면 0
							model.addAttribute("login_yn", login_yn);
							System.out.println("이미 참여한 사람");
							return "survey/surveyMain";
						} else {
							model.addAttribute("existSubmit", cnt); // 참여했으면 1 아니면 0
							model.addAttribute("login_yn", login_yn);
							return "survey/surveyMain";
						}
				}
			}		
		} else if(login_yn == 'N') { // 로그인 필요하지 않다
			
			if(ses.getAttribute("login") == null) {
				model.addAttribute("surveyMain", svo);
				model.addAttribute("login_yn", login_yn);
				ses.setAttribute("login_yn", login_yn);
				return "survey/surveyMain";
			} else {	
				
				int userId = ((UserVO) request.getSession().getAttribute("login")).getUser_id();
				model.addAttribute("surveyMain", svo);

				Integer cnt = surveyService.getSurveySubmit(userId); // 참여했는지 안 했는지
				System.out.println(cnt);
				
				if(subCnt != 0) {
						if(cnt == subCnt) {
							model.addAttribute("existSubmit", cnt); // 참여했으면 1 아니면 0
							model.addAttribute("login_yn", login_yn);
							System.out.println("이미 참여한 사람");
							return "survey/surveyMain";
						} else {
							model.addAttribute("existSubmit", cnt); // 참여했으면 1 아니면 0
							model.addAttribute("login_yn", login_yn);
							ses.setAttribute("login_yn", login_yn);
							return "survey/surveyMain";
						}
				}
			}
			
		} 
		model.addAttribute("surveyMain", svo);
		return "survey/surveyMain";
			}
	}
	
	@RequestMapping(value = "/survey/surveyInsert.do", method = RequestMethod.GET)
	public String surveyInsert(SurveyVO svo, Model model, SurveyQuestionVO qvo, SurveyUtileVO uvo) {
		
		qvo.setSur_id(svo.getSur_id());
		List<SurveyQuestionVO> sqvo = surveyService.getSurveyQueList(qvo);
		List<SurveyUtileVO> suvo = surveyService.getSurveyOption(uvo);
		List<SurveyUtileVO> suvo2 = surveyService.getSurveyCate(uvo);
		SurveyVO srvo = surveyService.getSurveyPost(svo);
		Integer lastNum = surveyService.getSurveyLastPage(svo.getSur_id());
		
		model.addAttribute("page", srvo);
		model.addAttribute("questionList", sqvo);
		model.addAttribute("optionList", suvo);
		model.addAttribute("cateList", suvo2);
		model.addAttribute("lastNum", lastNum);
		
		int que_total = surveyService.getTotal(svo.getSur_id());
		model.addAttribute("getTotal", que_total);

		return "survey/surveyInsert";
	}
	
	@ResponseBody
	@RequestMapping(value = "/surveyInsertProc.do", method = RequestMethod.POST, produces = "application/json")
	public String surveyInsertProc(SurveyVO svo, @RequestBody List<SurveyAnswerVO> list, Model model) {
		for(SurveyAnswerVO avo : list) {
			surveyService.getSurveyInsert(avo);
		}
		return "true";
	}
	
	@RequestMapping(value = "/survey/surveyModify.do", method = RequestMethod.GET)
	public String surveyModify(SurveyVO svo, Model model, SurveyQuestionVO qvo, SurveyUtileVO uvo, HttpServletRequest request) {
		
		SurveyVO srvo = surveyService.getSurveyPost(svo);
		model.addAttribute("page", srvo);
		
		qvo.setSur_id(svo.getSur_id());
		List<SurveyQuestionVO> sqvo = surveyService.getSurveyQueList(qvo);
		model.addAttribute("questionList", sqvo);
		
		uvo.setSur_id(svo.getSur_id());
		int userId = ((UserVO) request.getSession().getAttribute("login")).getUser_id();
		uvo.setUser_id(userId);
		
		List<SurveyUtileVO> sqvo2 = surveyService.getSurveyAnwser(uvo);
		model.addAttribute("answerList", sqvo2);
		
		List<SurveyUtileVO> suvo = surveyService.getSurveyOption(uvo);
		model.addAttribute("optionList", suvo);
		
		Integer lastNum = surveyService.getSurveyLastPage(svo.getSur_id());
		model.addAttribute("lastNum", lastNum);
		
		int que_total = surveyService.getTotal(svo.getSur_id());
		model.addAttribute("getTotal", que_total);

		return "/survey/surveyModify";
	}
	
	@ResponseBody
	@RequestMapping(value = "/surveyModifyProc.do", method = RequestMethod.POST, produces = "application/json")
	public String surveyModifyProc(SurveyVO svo, @RequestBody List<SurveyAnswerVO> list, Model model) {
		for(SurveyAnswerVO avo : list) {
			surveyService.getSurveyDelete(avo);
		}
		for(SurveyAnswerVO avo2 : list) {
			surveyService.getSurveyInsert(avo2);
		}
		return "true";
	}
	
	@ResponseBody
	@RequestMapping(value = "/surveyDeleteProc.do", method = RequestMethod.POST, produces = "application/json")
	public String surveyDeleteProc(SurveyVO svo, @RequestBody List<SurveyAnswerVO> list, Model model) {
		for(SurveyAnswerVO avo : list) {
			surveyService.getSurveyDelete(avo);
		}
		return "true";
	}
}
