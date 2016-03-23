!function($){
	'use strict'
	
	//jquery自定义方法
	//方法1, 调用方式$.fun(1,2)
	$.extend({
		fun1 : function(arg1,arg2){
			alert(arg1);
		}
	});
	
	//方法2, 调用方式$("#div").fun(1,2)
	$.fn.fun2 = function(arg1, arg2){
		alert(arg1);
	};
	
	//方法3, 调用方式$.fun(1,2)
	$.fun3 = function(arg1, arg2){
		alert(arg1);
	};
	
	var f1 = function(){alert(111)};
	var f2 = function(){alert(111)};
	var defaults1 = {
		f1 : function(){alert(111)},
		ff : "111"
	}
	var defaults2 = {
		f2 : f2,
		ff : "222"
	}
	var dd = $.extend(true, {}, defaults1, defaults2);
	
	/////
	var OrgTree = function(){
		this.init();
	}
	
	OrgTree.DefaultSetting = {
		view: {
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	}
	
	OrgTree.prototype.init = function(){
		$.ajax({
			type : "GET",
			url : 'admin/org/getOrgsForZtree',
			async : false,
			success : function(data) {
				$.fn.zTree.init($("#orgTree"), OrgTree.DefaultSetting, data);
			}
		});
	}
	
	$.fn.orgTree = function(options){
		$.extend(OrgTree.DefaultSetting, options);
		return new OrgTree();
	}
	
	//$(function () {
    //    $('[data-toggle="orgTree"]').orgTree();
    //});

}(jQuery);