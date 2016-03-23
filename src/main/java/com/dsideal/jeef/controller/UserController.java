package com.dsideal.jeef.controller;

import com.alibaba.fastjson.JSONObject;
import com.dsideal.jeef.model.User;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class UserController extends Controller{

	public void index(){
		render("user.html");
	}
	
	public void bst(){
		render("table_bootstrap.html");
	}
	
	public void getUsers() {
		String org_id = getPara("org_id");
		int limit = getParaToInt("limit");
		int offset = getParaToInt("offset");
		int pageNumber = (offset + limit)/limit;
		int pageSize = limit;
		String sortOrder = getPara("order");
		String searchText = getPara("search");
		
		Page<User> users = User.dao.getUsers(pageNumber, pageSize, sortOrder, org_id, searchText);
		
		JSONObject obj = new JSONObject();
		obj.put("list", users.getList());
		obj.put("total", users.getTotalRow());
		obj.put("totalPages", users.getTotalPage());
		obj.put("pageNumber", users.getPageNumber());
		obj.put("pageSize", users.getPageSize());
		renderJson(obj);
	}
	
	
}
