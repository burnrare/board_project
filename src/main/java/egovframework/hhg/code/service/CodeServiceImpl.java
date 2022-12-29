package egovframework.hhg.code.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.hhg.utills.vo.CodeVO;

@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	CodeMapper codeMapper;

	@Override
	public List<CodeVO> getCodeMainList(CodeVO cvo) {
		return codeMapper.getCodeMainList(cvo);
	}

	@Override
	public List<CodeVO> getCodeMiddleList(CodeVO cvo) {
		return codeMapper.getCodeMiddleList(cvo);
	}

	@Override
	public List<CodeVO> getCodeSubList(CodeVO cvo) {
		return codeMapper.getCodeSubList(cvo);
	}

	@Override
	public void codeDeleteList(List<CodeVO> list) {
		for(CodeVO cvo : list) {			
			codeMapper.codeDelete(cvo);
		}
	}

	@Override
	public void codeDelete(CodeVO cvo) {
		codeMapper.codeDelete(cvo);
	}

	@Override
	public List<CodeVO> getCodeList() {
		return codeMapper.getCodeList();
	}

	@Override
	public void codeInsert(CodeVO cvo) {
		codeMapper.codeInsert(cvo);
	}

	@Override
	public void codeUpdate(CodeVO cvo) {
		codeMapper.codeUpdate(cvo);
	}

	@Override
	public void codeDownUpdate(CodeVO cvo) {
		codeMapper.codeDownUpdate(cvo);
	}
	
}
