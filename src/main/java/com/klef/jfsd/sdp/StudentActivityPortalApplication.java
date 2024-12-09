package com.klef.jfsd.sdp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.klef.jfsd.sdp.controller", "com.klef.sdp.service"})

public class StudentActivityPortalApplication {

	public static void main(String[] args) {
		SpringApplication.run(StudentActivityPortalApplication.class, args);
		System.out.println("Project is Running...!!!");
	}

}
