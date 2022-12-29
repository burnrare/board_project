package egovframework.hhg.login.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.hhg.login.vo.UserVO;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return UserVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
			UserVO userVO = (UserVO)target;
			
			if(isEmptyOrWhitespace(userVO.getU_ncnm())) {
				errors.rejectValue("u_ncnm", "Pattern.userVo.u_ncnm");
			} else if(userVO.getU_ncnm().length() < 2) {
				errors.rejectValue("u_ncnm", "Pattern.userVo.u_ncnm");
			}
			
			if(userVO.getU_id() == null || userVO.getU_id().length() < 11) {
				errors.rejectValue("u_id", "Pattern.userVo.u_id");
			} else if(userVO.getU_id() == null || userVO.getU_id().length() > 12) {
				errors.rejectValue("u_id", "Pattern.userVo.u_id2");
			}
	
			if(userVO.getU_pwd() == null || userVO.getU_pwd().length() < 6) {
				errors.rejectValue("u_pwd", "Pattern.userVo.u_pwd");
			}
	}

	private boolean isEmptyOrWhitespace(String value) {
		if(value == null || value.trim().length() == 0) {
			return true;
		} else {			
			return false;
		}
	}

}
