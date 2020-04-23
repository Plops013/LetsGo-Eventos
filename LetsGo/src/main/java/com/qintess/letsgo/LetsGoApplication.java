package com.qintess.letsgo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication
public class LetsGoApplication extends SpringBootServletInitializer{
	
	public static void main(String[] args) {
		SpringApplication.run(LetsGoApplication.class, args);
	}
}
