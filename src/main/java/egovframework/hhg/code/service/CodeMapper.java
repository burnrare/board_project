package egovframework.hhg.code.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.hhg.utills.vo.CodeVO;

@Mapper
public interface CodeMapper {
	public List<CodeVO> getCodeList(); // 전체 코드 불러오는 sql
	public List<CodeVO> getCodeMainList (CodeVO cvo); // 대분류 불러오는 sql
	public List<CodeVO> getCodeMiddleList (CodeVO cvo); // 중분류 불러오는 sql
	public List<CodeVO> getCodeSubList (CodeVO cvo); // 소분류 불러오는 sql
	public void codeDeleteList (List<CodeVO> cvo);
	public void codeDelete(CodeVO cvo); // 코드 delete
	public void codeInsert(CodeVO cvo); // 코드 insert
	public void codeUpdate(CodeVO cvo); // 코드 대분류, 중분류 update
	public void codeDownUpdate(CodeVO cvo); // 코드 중분류, 소분류 update
}
