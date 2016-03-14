package com.dsideal.jeef.config;

import com.dsideal.jeef.interceptor.AuthInterceptor;
import com.dsideal.jeef.interceptor.LoginInterceptor;
import com.dsideal.jeef.model.Organization;
import com.dsideal.jeef.model.User;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;

/**
 * API引导式配置
 * @author feilm220
 *
 */
public class JeefConfig extends JFinalConfig{

	@Override
	public void configConstant(Constants me) {
		//加载少量必要配置，随后可用PropKit.get(...)获取值
		PropKit.use("config.properties");
		me.setDevMode(PropKit.getBoolean("devMode", true));
		
		//me.setBaseViewPath("/WEB-INF/views");
		me.setError404View("/WEB-INF/views/404.html");
		me.setError500View("/WEB-INF/views/500.html");
	}

	@Override
	public void configRoute(Routes me) {
		me.add(new AdminRoutes());
	}

	@Override
	public void configPlugin(Plugins me) {
		//使用druid连接池
		DruidPlugin druidPlugin = new DruidPlugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password"));
		me.add(druidPlugin);
		//Record模式
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
		arp.setShowSql(PropKit.getBoolean("showSql", false));
		//配置数据库列名大写不敏感
		arp.setContainerFactory(new CaseInsensitiveContainerFactory(true));
		//arp.setDialect(new MysqlDialect());
		me.add(arp);
		//数据库表和Model对应
		//arp.addMapping("sys_config", Config.class);
		//arp.addMapping("sys_resource", Resource.class);
		arp.addMapping("sys_user", User.class);
		//arp.addMapping("sys_role", Role.class);
		arp.addMapping("sys_organization", Organization.class);
		
		me.add(new EhCachePlugin());
	}

	@Override
	public void configInterceptor(Interceptors me) {
		me.add(new LoginInterceptor());
		me.add(new AuthInterceptor());
	}

	@Override
	public void configHandler(Handlers me) {
		//页面上可以${contextPath}取到ContextPath值
		me.add(new ContextPathHandler("contextPath"));
	}

	public static void main(String[] args) {
		JFinal.start("src/main/webapp", 8081, "/jeef", 3);
	}
}
