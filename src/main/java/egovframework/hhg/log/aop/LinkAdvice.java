package egovframework.hhg.log.aop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import egovframework.hhg.login.interceptor.AuthenticInterceptor;
import egovframework.hhg.login.service.MenuService;
import egovframework.hhg.login.vo.MenuVO;

@Aspect
@Component
public class LinkAdvice {
	
	@Autowired
	MenuService menuService;
	
	protected Log log = LogFactory.getLog(AuthenticInterceptor.class);
	
	/*
	 * After : 메소드 실행 후
	 * execution : getBoardList 메소드 지정 * 로 모든 메소드 지정 가능
	 * 접근지정자 : 생략 가능 ex) public, private
	 * * : 변환 타입
	 * 
	 */
	@After("execution(* *List*(..))")
	public void afterAdvice(JoinPoint jp) {
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String requestUrl = request.getRequestURI().toString(); // 요청하는 url
		String m_seq = request.getParameter("m_seq"); // 요청된 url에 있는 m_seq
		MenuVO mvo = new MenuVO(); // 새로운 menuVO
		List<MenuVO> menuList = menuService.getMenuList();
		
		mvo.setM_seq(Integer.valueOf(m_seq)); // mvo에 m_seq 넣기
		
		for(MenuVO vo : menuList) {
			if(requestUrl.contains(m_seq) && vo.getTy_id() != 1004) {
				menuService.getMenuLog(mvo); // 넣은 뒤 log 쌓기
				return;
			} else if(!requestUrl.contains(m_seq) && vo.getTy_id() == 1004) {
				menuService.getMenuLog(mvo);
				return;
			}			
		}
		
		
	}
	
}
