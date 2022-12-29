package egovframework.hhg.login.controller;

import java.util.List;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;

import egovframework.hhg.login.service.MenuService;
import egovframework.hhg.login.service.UserService;
import egovframework.hhg.login.vo.MenuVO;

public class MenuPreparer implements ViewPreparer  {
	
	@Autowired
	MenuService menuService;
	@Autowired
	UserService userService;
	
	@Override
	public void execute(Request request, AttributeContext attributeContext) throws PreparerException {
		
		List<MenuVO> menuList = menuService.getMenuList();
		attributeContext.putAttribute("menuList", new Attribute(menuList), true);
		
	}
}
