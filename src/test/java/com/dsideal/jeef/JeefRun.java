package com.dsideal.jeef;

import com.jfinal.core.JFinal;

public class JeefRun {
	/**
	 * Run jeef as application
	 */
	public static void main(String[] args) {
		JFinal.start("src/main/webapp", 8081, "/jeef", 3);
	}
}
