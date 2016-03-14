package com.dsideal.jeef.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * 
 * @author feilm220
 *
 */
public class LoginValidator extends Validator{

	@Override
	protected void validate(Controller c) {
		validateRequired("loginName", "loginNameMsg", "用户名不能为空");
		validateRequired("password", "passwordMsg", "密码不能为空");
	}

	@Override
	protected void handleError(Controller c) {
		c.keepPara("loginName");
        c.render("login.html");
	}

}
