package study.spring.findhobby.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import uap_clj.java.api.Browser;
import uap_clj.java.api.Device;
import uap_clj.java.api.OS;

@Slf4j
public class AppInterceptor implements HandlerInterceptor{
	long startTime=0, endTime=0;
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		log.debug("AppInterceptor.preHandle 실행됨");
		
		startTime= System.currentTimeMillis();
		
		//1) 클라이언트의 요청 정보 확인하기
		String url = request.getRequestURI().toString();
		
		String methodName = request.getQueryString();
		
		String querySring = request.getQueryString();
		
		if(querySring != null) {
			url = url + "?" + querySring;
		}
		
		log.debug(String.format("[%s] %s", methodName , url));
		
		//2) 클라이언트가 전달한 모든 파라미터 확인하기
		Map<String, String[]> params = request.getParameterMap();
		
		for(String key : params.keySet()) {
			String[] value = params.get(key);
			log.debug(String.format("(p) <-- %s = %s", key, String.join(",", value)));
		}
		
		//3) 클라이언트가 머물렀던 이전 페이지와 이전페이지에 머문 시간 확인하기
		String referer = request.getHeader("referer");
		
		if(referer != null && endTime >0) {
			log.debug(String.format("- REFERER: time=%d, url=%s", startTime - endTime , referer));
		}
		
		//4) 접속한 클라이언트의 장치 정보를 로그로 기록
		String ua = request.getHeader("User-Agent");
		Map<String, String> browser = Browser.lookup(ua);
		Map<String, String> os = (Map<String, String>) OS.lookup(ua);
		Map<String, String> device = (Map<String, String>) Device.lookup(ua);
			
		String browserStr = String.format("- Browser: {family=%s, patch=%s, major=%s, minor=%s}", 
							browser.get("family"), browser.get("patch"),browser.get("major"),browser.get("minor"));
					
		String osStr = String.format("- OS: {family=%s, patch=%s, patch_minor=%s, major=%s, minor=%s}", 
							os.get("family"), os.get("patch"),os.get("patch_minor"),os.get("major"),os.get("minor"));
					
		String deviceStr = String.format("- Device: {family=%s, model=%s, brand=%s}", 
							device.get("family"), device.get("model"),device.get("brand"));
					
		log.debug(browserStr);
		log.debug(osStr);
		log.debug(deviceStr);		

		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
//		log.debug("AppInterceptor.postHandle 실행됨");
		
		endTime = System.currentTimeMillis();
		
		log.debug(String.format("running time: %d(ms)\n", endTime-startTime));
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
//		log.debug("AppInterceptor.afterCompletion 실행됨");
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	

}
