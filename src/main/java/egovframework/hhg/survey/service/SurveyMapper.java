package egovframework.hhg.survey.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.hhg.survey.vo.SurveyAnswerVO;
import egovframework.hhg.survey.vo.SurveyQuestionVO;
import egovframework.hhg.survey.vo.SurveyUtileVO;
import egovframework.hhg.survey.vo.SurveyVO;

@Mapper
public interface SurveyMapper {
	public List<SurveyVO> getSurveyList(SurveyVO surveyVO);
	public SurveyVO getSurveyPost(SurveyVO surveyVO);
	
	public List<SurveyQuestionVO> getSurveyQueList(SurveyQuestionVO surveyQVO);
	public List<SurveyUtileVO> getSurveyUtileList (SurveyUtileVO surveyUVO);
	public List<SurveyUtileVO> getSurveyOption(SurveyUtileVO uvo);
	public List<SurveyUtileVO> getSurveyCate(SurveyUtileVO uvo);
	
	public void getSurveyAllInsert(List<SurveyAnswerVO> list);
	public void getSurveyInsert(SurveyAnswerVO avo);
	
	public void getSurveyAllUpdate(List<SurveyAnswerVO> list);
	public void getSurveyUpdate(SurveyAnswerVO avo);
	
	public void getSurveyAllDelete(List<SurveyAnswerVO> list);
	public void getSurveyDelete(SurveyAnswerVO avo);
	
	public Integer getTotal(Integer sur_id);
	public Integer getSurveyLastPage(Integer sur_id);
	
	public Integer getSurveySubmit(Integer user_id);
	public List<SurveyUtileVO> getSurveyAnwser(SurveyUtileVO uvo);
}
