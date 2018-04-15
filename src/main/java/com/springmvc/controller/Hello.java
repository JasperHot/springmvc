package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Hello {
	// http://127.0.0.1:8080/springmvc/Hello
	@RequestMapping(value = "/Hello")
	public String HelloWorld(Model model) {
		model.addAttribute("message", "Hello World!!!");
		return "HelloWorld";
	}
}
