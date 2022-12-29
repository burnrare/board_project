package egovframework.hhg.login.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import egovframework.hhg.login.service.MenuService;
import egovframework.hhg.login.vo.LogVO;

@RestController
public class LogController {
	
	@Autowired
	MenuService menuService;
 	
	// restController 정의, 사용 방법 읽어 보고
	@ResponseBody
	@RequestMapping(value = "/admin/menuLog.do", method = RequestMethod.POST)
	public List<List<LogVO>> log() {
		List<LogVO> year_vo = menuService.getMenuLogYear();
		List<LogVO> month_vo = menuService.getMenuLogMonth();
		List<LogVO> day_vo = menuService.getMenuLogDay();
		List<LogVO> time_vo = menuService.getMenuLogTime();
		
		// 리스트 안에~
		List<List<LogVO>> logs = new ArrayList<List<LogVO>>();
		logs.add(year_vo);
		logs.add(month_vo);
		logs.add(day_vo);
		logs.add(time_vo);
		
		return logs;
	}
	
}
