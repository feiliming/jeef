package com.dsideal.jeef.controller;

import com.dsideal.jeef.model.User;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;

/**
 * 
 * @author feilm220
 *
 */
public class AdminIndexController extends Controller {

	public void index() {
		User user = getSessionAttr("user");
		if(user != null){
			render("index.html");
			return;
		}
		redirect("/admin/login");
	}
	
	public void index_v1() {
		render("index_v1.html");
	}
	
	public void login(){
		render("login.html");
	}
	
	public void login_v2(){
		render("login_v2.html");
	}
	
	@Clear
	public void getCaptcha(){
		//String randomCodeKey = getPara("randomCodeKey");
		//render(new CaptchaRender(randomCodeKey));
		renderCaptcha();
	}
	
	public void doLogin(){
		String loginName = getPara("loginName");
		String password = getPara("password");
		//boolean b = CaptchaRender.validate(this, loginCaptcha.toUpperCase(), "loginCaptcha");
		boolean b = validateCaptcha("loginCaptcha");
		if(!b){
			setAttr("msg", "验证码错误!");
			render("login.html");
			return;
		}
		User user = new User();
		user.set("login_name", loginName);
		user.set("password", password);
		user = User.dao.checkLoginNameAndPassword(user);
		if(user != null){
			setSessionAttr("user", user);
			redirect("/admin");
		}else{
			setAttr("msg", "用户名或密码错误!");
			render("login.html");
		}
	}
	
	public void logout(){
		removeSessionAttr("user");
		redirect("/admin/login");
	}
}
