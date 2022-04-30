package study.spring.findhobby.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import uap_clj.java.api.Browser;
import uap_clj.java.api.Device;
import uap_clj.java.api.OS;

/**
 * Handles requests for the application home page.
 */

@Slf4j
@Controller
public class HomeController {
	
	// private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		// logger.info("Welcome home! The client locale is {}.", locale);
		
		log.debug("Hello FindHobby");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/user_agent.do", method = RequestMethod.GET)
	public String userAgent(Model model, HttpServletRequest request) {
		
		// 1) 접근한 클라이언트 HTTP 헤더 정보 가져오기
		String ua = request.getHeader("user-Agent");
		
		//2) uap 라이브러리 기능 통해 UserAgent 정보 파싱
		//import uap_cil.java.api.Browser;
		Map<String, String> browser = Browser.lookup(ua);
		
		//운영체제 정보
		//import uap_cil.java.api.OS;
		Map<String, String> os = (Map<String, String>) OS.lookup(ua);
		
		//디바이스 정보
		//import uap_cil.java.api.Device;
		Map<String, String> device = (Map<String, String>) Device.lookup(ua);
		
		/** 3) 추출된 정보들을 출력하기 위해 문자열로 묶기  */
		String browserStr = String.format("- Browser: {family=%s, patch=%s, major=%s, minor=%s}",
				browser.get("family"),browser.get("patch"),browser.get("major"),browser.get("minor"));
		
		String osStr = String.format("- OS: {family=%s, patch=%s, patch_minor=%s , major=%s, minor=%s}",
				os.get("family"),os.get("patch"),os.get("patch_minor"),os.get("major"),os.get("minor"));
		
		String deviceStr = String.format("- Device: {family=%s, model=%s, brand=%s}",
				device.get("family"),device.get("model"),device.get("brand"));
		
		 /** 4) 화면에 출력하기 위해 view 에게 전달 */
		model.addAttribute("user_agent",ua);
		model.addAttribute("browser",browserStr);
		model.addAttribute("os",osStr);
		model.addAttribute("device",deviceStr);
		
		 /** 5) view 이름 리턴 */
		
		return "user_agent";
	}
	
}
