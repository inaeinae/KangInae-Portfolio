package com.inae.portfolio.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class indexController {
	
	@RequestMapping("programInfo")
	public void ProgramInfoView(HttpServletRequest request, HttpServletResponse response, @RequestParam("programLanguage") String programLanguage) throws IOException {
		/*String fileName = "";
		if(programLanguage.toLowerCase().equals("c#")) fileName = "cshop";
		else fileName = programLanguage.toLowerCase();
		String local = request.getSession().getServletContext().getRealPath("resources/data/hashtag/" + fileName + ".md");*/
		String local = request.getSession().getServletContext().getRealPath("resources/data/hashtag/" + programLanguage.toLowerCase() + ".md");
		File file = new File(local);
		
		if(file.exists()) {
			FileReader reader = new FileReader(file);
			BufferedReader bufReader = new BufferedReader(reader);
			
			String line, context = "";
			int count = 0;
			HashMap<String, String> map = new HashMap<String, String>();
			
			while((line = bufReader.readLine()) != null) {
				if(count == 0) {
					map.put("header", line);
					count++;
				} else {
					context += line + "<br>";
				}
			}
			map.put("context", context);

			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(map, response.getWriter());
		}
	}
}
