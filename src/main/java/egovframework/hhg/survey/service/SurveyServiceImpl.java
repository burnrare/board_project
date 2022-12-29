package egovframework.hhg.survey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.hhg.survey.vo.SurveyAnswerVO;
import egovframework.hhg.survey.vo.SurveyQuestionVO;
import egovframework.hhg.survey.vo.SurveyUtileVO;
import egovframework.hhg.survey.vo.SurveyVO;
@Service
public class SurveyServiceImpl implements SurveyService {
	
	@Autowired
	SurveyMapper surveyMapper;

	@Override
	public List<SurveyVO> getSurveyList(SurveyVO surveyVO) {
		return surveyMapper.getSurveyList(surveyVO);
	}

	@Override
	public SurveyVO getSurveyPost(SurveyVO surveyVO) {
		return surveyMapper.getSurveyPost(surveyVO);
	}

	@Override
	public List<SurveyQuestionVO> getSurveyQueList(SurveyQuestionVO surveyQVO) {
		return surveyMapper.getSurveyQueList(surveyQVO);
	}

	@Override
	public List<SurveyUtileVO> getSurveyUtileList(SurveyUtileVO surveyUVO) {
		return surveyMapper.getSurveyUtileList(surveyUVO);
	}

	@Override
	public Integer getTotal(Integer sur_id) {
		return surveyMapper.getTotal(sur_id);
	}

	@Override
	public void getSurveyInsert(SurveyAnswerVO avo) {
		surveyMapper.getSurveyInsert(avo);
	}

	@Override
	public void getSurveyAllInsert(List<SurveyAnswerVO> list) {
		for(SurveyAnswerVO vo : list) {
			surveyMapper.getSurveyInsert(vo);
		}
	}

	@Override
	public Integer getSurveySubmit(Integer user_id) {
		return surveyMapper.getSurveySubmit(user_id);
	}

	@Override
	public List<SurveyUtileVO> getSurveyAnwser(SurveyUtileVO qvo) {
		return surveyMapper.getSurveyAnwser(qvo);
	}

	@Override
	public void getSurveyAllUpdate(List<SurveyAnswerVO> list) {
		for(SurveyAnswerVO vo : list) {			
			surveyMapper.getSurveyUpdate(vo);
		}
	}

	@Override
	public void getSurveyUpdate(SurveyAnswerVO avo) {
		surveyMapper.getSurveyUpdate(avo);
	}

	@Override
	public void getSurveyAllDelete(List<SurveyAnswerVO> list) {
		for(SurveyAnswerVO vo : list) {			
			surveyMapper.getSurveyDelete(vo);
		}
	}

	@Override
	public void getSurveyDelete(SurveyAnswerVO avo) {
		surveyMapper.getSurveyDelete(avo);
	}

	@Override
	public List<SurveyUtileVO> getSurveyOption(SurveyUtileVO uvo) {
		return surveyMapper.getSurveyOption(uvo);
	}

	@Override
	public List<SurveyUtileVO> getSurveyCate(SurveyUtileVO uvo) {
		return surveyMapper.getSurveyCate(uvo);
	}

	@Override
	public Integer getSurveyLastPage(Integer sur_id) {
		return surveyMapper.getSurveyLastPage(sur_id);
	}
	
}
