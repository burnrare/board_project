package egovframework.hhg.utills.common;

import egovframework.hhg.login.service.MenuService;

public class Common {

	private static class Time_Maximum {
		public static final int SEC = 60;
		public static final int MIN = 60;
		public static final int HOUR = 24;
		public static final int DAY = 30;
		public static final int MONTH = 12;
	}
	
	public static String formatTimeString(String regTime, MenuService menuService) {
		
		int diffTime = menuService.selectCompareTime(regTime);
		String msg = null;
		
		if(diffTime < Time_Maximum.SEC) {
			msg = "방금 전";
		} else if((diffTime /= Time_Maximum.SEC) < Time_Maximum.MIN) {
			msg = diffTime + "분 전";
		} else if((diffTime /= Time_Maximum.MIN) < Time_Maximum.HOUR) {
			msg = (diffTime) + "시간 전";
		} else if((diffTime /= Time_Maximum.HOUR) < Time_Maximum.DAY) {
			msg = (diffTime) + "일 전";
		} else if((diffTime /= Time_Maximum.DAY) < Time_Maximum.MONTH) {
			msg = (diffTime) + "달 전";
		} else {
			msg = (diffTime) + "년 전";
		}
		return msg;
	}
	
}
