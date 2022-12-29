package egovframework.hhg.login.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import egovframework.hhg.login.service.MenuService;
import egovframework.hhg.login.vo.MenuVO;
import egovframework.hhg.login.vo.UserVO;

public class AuthenticInterceptor implements HandlerInterceptor {
	
	@Autowired
	MenuService menuService;
	
	List<String> urls;
	
	 protected Log log = LogFactory.getLog(AuthenticInterceptor.class);
	 
	 public void setUrls(List urls) {
		  this.urls = urls;
	 }
	 
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) 
	    		throws Exception {
		 
		 if(log.isDebugEnabled()) {

			 System.out.println("== url : " + request.getRequestURI() + " ==");
			 
			 String m_seq = request.getParameter("m_seq"); // 들어가고자 하는 메뉴의 시퀀스
 	    	 HttpSession session = request.getSession();
	    	 UserVO uvo = new UserVO();
	    	 
	    	 List<MenuVO> menuAuthList = menuService.getMenuAuthType(m_seq); // 회원 권한이 있는 메뉴 list

			 if(session.getAttribute("login") != null) {
				 uvo = (UserVO) session.getAttribute("login");
			 }
			 
			 // 인증 체크가 필요 없는 url
			 for(int i = 0; i < urls.size(); i++) {
				 if(request.getRequestURI().contains(urls.get(i))) {
					 System.out.println("== url : " + urls.get(i) + " ==");
					 return true;
				 }
			 }
			 
			 if(!menuAuthList.isEmpty()) {			
				 for(MenuVO menuAuthvo : menuAuthList) {
					 if(uvo.getU_type() == menuAuthvo.getAuth_type()) {
						 return true;
					 }
				 }
				 response.sendRedirect("/errorPage.do");
				 return false;
			 } 
			 
			 List<MenuVO> menuList = menuService.getMenuList();
			 for(MenuVO menuVo : menuList) {
				 Integer m_seq_int = Integer.valueOf(m_seq);
				 if(menuVo.getM_seq() == m_seq_int) {
					 return true; 
				 }
			 }
			 response.sendRedirect("/errorPage.do");
			 return false;
		 }
		return true;			 
	    }
	 
	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
	    		ModelAndView modeAndView) throws Exception {
	    }
	 
	    @Override
	    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
	    		Object handler, Exception ex){
	    }
	

}
