package study.spring.findhobby.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.findhobby.helper.RegexHelper;
import study.spring.findhobby.helper.WebHelper;
import study.spring.findhobby.model.hobby;
import study.spring.findhobby.model.members;
import study.spring.findhobby.service.HobbyService;





@Controller
public class MainController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	HobbyService hobbyService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main(Model model) {
		
		List<hobby> output_hobby_list = null;
		
		hobby input = new hobby();
		
		try {
			output_hobby_list = hobbyService.getHobbyAll(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output_hobby_list",output_hobby_list);
		
		
		return new ModelAndView("main");
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView mainMain(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		List<hobby> output_hobby_list = null;
		
		hobby input = new hobby();
		
		try {
			output_hobby_list = hobbyService.getHobbyAll(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output_hobby_list",output_hobby_list);
		
		
		return new ModelAndView("main");
	}
}
