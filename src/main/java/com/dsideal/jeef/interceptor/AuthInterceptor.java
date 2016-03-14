package com.dsideal.jeef.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * 权限认证拦截器
 * @author feilm220
 *
 */
public class AuthInterceptor implements Interceptor {
	
	

	@Override
	public void intercept(Invocation inv) {
		System.out.println(11111);
		inv.invoke();
		System.out.println(22222);
	}

}
