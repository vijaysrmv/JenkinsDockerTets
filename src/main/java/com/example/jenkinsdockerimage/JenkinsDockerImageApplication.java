package com.example.jenkinsdockerimage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class JenkinsDockerImageApplication {

	public static void main(String[] args) {
		SpringApplication.run(JenkinsDockerImageApplication.class, args);
	}

}

@RestController
class HomeController{
	@RequestMapping("/getDtaa")
	public String getData(){
		return "Done";
	}
}
