package egovframework.hhg.login.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import egovframework.hhg.code.service.CodeService;
import egovframework.hhg.utills.vo.CodeVO;

@RestController
public class CodeController {
	@Autowired
	CodeService codeService;
	
	@ResponseBody
	@RequestMapping(value = "/admin/codeInfo.do", method = RequestMethod.POST)
	public List<CodeVO> middleCode(CodeVO cvo) {
		System.out.println("========= cvo.getCode_main_id() ======== " + cvo.getCode_main_id());
		if(cvo.getCode_mid_id() != null) {		
			List<CodeVO> codeSubList = codeService.getCodeSubList(cvo);
			return codeSubList;
		} else if(cvo.getCode_main_id() != null) {			
			List<CodeVO> codeMidList = codeService.getCodeMiddleList(cvo);
			return codeMidList;
		} else {
			List<CodeVO> codeAllList = codeService.getCodeList();
			return codeAllList;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/boardInsert.do", method = RequestMethod.POST)
	public List<CodeVO> code(@RequestBody CodeVO cvo) {
		System.out.println("========= cvo.getCode_main_id() ======== " + cvo.getCode_main_id());
		if(cvo.getCode_mid_id() != null) {		
			List<CodeVO> codeSubList = codeService.getCodeSubList(cvo);
			return codeSubList;
		} else {			
			List<CodeVO> codeMidList = codeService.getCodeMiddleList(cvo);
			return codeMidList;
		}
	}
	
}
