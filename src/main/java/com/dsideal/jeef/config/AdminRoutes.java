package com.dsideal.jeef.config;

import com.dsideal.jeef.controller.AdminIndexController;
import com.dsideal.jeef.controller.CommonController;
import com.dsideal.jeef.controller.OrganizationController;
import com.dsideal.jeef.controller.UserController;
import com.jfinal.config.Routes;

public class AdminRoutes extends Routes{

	@Override
	public void config() {
		add("/admin", AdminIndexController.class, "/WEB-INF/views");
		add("/admin/common", CommonController.class, "/WEB-INF/views");
		add("/admin/user", UserController.class, "/WEB-INF/views");
		add("/admin/org", OrganizationController.class, "/WEB-INF/views");
	}

}
