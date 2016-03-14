package com.dsideal.jeef.interceptor;

import java.util.ArrayList;
import java.util.List;

import com.dsideal.jeef.model.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * 登录验证
 * @author feilm220
 *
 */
public class LoginInterceptor implements Interceptor{
	
	/**
	 * 可以匿名访问的路径
	 */
	private static List<String> anonUrls = new ArrayList<String>();
	static {
		anonUrls.add("/admin/login");
		anonUrls.add("/admin/login_v2");
		anonUrls.add("/admin/doLogin");
		anonUrls.add("/admin/logout");
	}

	@Override
	public void intercept(Invocation inv) {
		if(inv.getActionKey().equals("/admin/login")){
			User user = inv.getController().getSessionAttr("user");
			if(user != null){
				inv.getController().redirect("/admin");
				return;
			}
		}
		if(anonUrls.contains(inv.getActionKey())){
			inv.invoke();
			return;
		}
		User user = inv.getController().getSessionAttr("user");
		if(user == null){
			inv.getController().redirect("/admin/login");
			return;
		}
		
		inv.invoke();
	}

}
