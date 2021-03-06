package com.dsideal.jeef.model;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * Generated by JFinal, do not modify this file.
 * <pre>
 * Example:
 * public void configPlugin(Plugins me) {
 *     ActiveRecordPlugin arp = new ActiveRecordPlugin(...);
 *     _MappingKit.mapping(arp);
 *     me.add(arp);
 * }
 * </pre>
 */
public class _MappingKit {

	public static void mapping(ActiveRecordPlugin arp) {
		arp.addMapping("sys_config", "id", Config.class);
		arp.addMapping("sys_dictionary", "id", Dictionary.class);
		arp.addMapping("sys_organization", "id", Organization.class);
		arp.addMapping("sys_resource", "id", Resource.class);
		arp.addMapping("sys_role", "id", Role.class);
		// Composite Primary Key order: resource_id,role_id
		arp.addMapping("sys_role_resource", "resource_id,role_id", RoleResource.class);
		arp.addMapping("sys_user", "id", User.class);
		// Composite Primary Key order: role_id,user_id
		arp.addMapping("sys_user_role", "role_id,user_id", UserRole.class);
	}
}

