package com.dsideal.jeef.controller;

import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.ext.render.CaptchaRender;

/**
 * 
 * @author feilm220
 *
 */
public class CommonController extends Controller{

	@Clear
	public void getCaptcha(){
		//String randomCodeKey = getPara("randomCodeKey");
		//render(new CaptchaRender(randomCodeKey));
		renderCaptcha();
	}
}
