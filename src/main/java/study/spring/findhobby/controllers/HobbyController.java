package study.spring.findhobby.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.findhobby.helper.RegexHelper;
import study.spring.findhobby.helper.WebHelper;
import study.spring.findhobby.model.hobby;
import study.spring.findhobby.model.interest;
import study.spring.findhobby.model.members;
import study.spring.findhobby.service.HobbyService;
import study.spring.findhobby.service.InterestService;
import uap_clj.java.api.Browser;
import uap_clj.java.api.Device;
import uap_clj.java.api.OS;

@Controller
public class HobbyController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	HobbyService hobbyService;
	
	@Autowired
	InterestService interestService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	// 검색 페이지로 이동
	@RequestMapping(value = "/findhobby.do", method = RequestMethod.POST)
	public ModelAndView findhobby(Model model,
			@RequestParam(value="search_text" ,required = false) String search_text,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		List<hobby> output_findhobby_list = null;
		List<hobby> output_findhobby_list_A = null;
		
		hobby input = new hobby();
		input.setH_name(search_text);
		input.setH_option(search_text);
		
		try {
			output_findhobby_list = hobbyService.getPopulHobbyAll();
			output_findhobby_list_A = hobbyService.getHobbyAllFindDetail(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		if(search_text == null || search_text == "") {
			model.addAttribute("output_findhobby_list_all","a");
		}else {
			model.addAttribute("output_findhobby_list_all", search_text);
		}
		
		model.addAttribute("output_findhobby_list",output_findhobby_list);
		model.addAttribute("output_findhobby_list_A",output_findhobby_list_A);
		model.addAttribute("keyword",search_text);
		
		
		return new ModelAndView("findhobby");
	}
	
	
	// 모든 취미 페이지
	@RequestMapping(value = "/allhobby.do", method = RequestMethod.GET)
	public ModelAndView allhobby(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		
		List<hobby> output_allhobby = null;
		
		hobby input = new hobby();
		
		try {
			
			output_allhobby = hobbyService.getHobbyAll(input);
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		model.addAttribute("output_allhobby",output_allhobby);
		
		
		return new ModelAndView("allhobby");
	}
	
	
	// 인기 top10 페이지
	@RequestMapping(value = "/popularity_hobby.do", method = RequestMethod.GET)
	public ModelAndView popularity_hobby(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		
		List<hobby> output_popularity_hobby = null;
		
		try {
			
			output_popularity_hobby = hobbyService.getPopulHobbyAll();
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		model.addAttribute("output_popularity_hobby",output_popularity_hobby);
		
		
		return new ModelAndView("popularity_hobby");
	}
	
	
	//취미 상세 페이지로 이동
	@RequestMapping(value = "/hobby_detail.do", method = RequestMethod.GET)
	public ModelAndView hobby_detail(Model model,
			@RequestParam(value = "id" , defaultValue =  "0") int id,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		
		hobby output_hobby_detail = null;
		
		hobby input = new hobby();
		input.setId(id);
		
		try {
			
			output_hobby_detail = hobbyService.getHobbyItem(input);
			
			hobby input_count = new hobby();
			input_count.setId(id);
			input_count.setH_count(output_hobby_detail.getH_count());
			
			hobbyService.editHobbyCount(input_count);
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		String input_similar_hobby = (String)output_hobby_detail.getH_option();
		
		List<hobby> output_similar_hobby = null;
		
		hobby input_similar_hobby_detail = new hobby();
		input_similar_hobby_detail.setH_option(input_similar_hobby);
		
		try {
			
			output_similar_hobby = hobbyService.getHobbyAllSimilar(input_similar_hobby_detail);
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		model.addAttribute("output_hobby_detail",output_hobby_detail);
		model.addAttribute("output_similar_hobby",output_similar_hobby);
		
		
		return new ModelAndView("hobby_detail");
	}
	
	
	// 관심 취미 등록
	@RequestMapping(value = "/favhobby_add.do", method = RequestMethod.GET)
	public ModelAndView favhobby_add(Model model,
			@RequestParam(value = "id" , defaultValue =  "0") int h_id,
			@RequestParam(value = "h_name" , required = false) String h_name,
			@RequestParam(value = "h_image_a" , required = false) String h_image_a,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		
		if(h_id == 0) {
			return webHelper.redirect(null, "관리자에게 문의 하세요.");
		}
		
		// user-agent 검색
		String ua = request.getHeader("User-Agent");
		
		Map<String, String> browser = Browser.lookup(ua);
		
		Map<String, String> os = (Map<String, String>) OS.lookup(ua);
		
		Map<String, String> device = (Map<String, String>) Device.lookup(ua);
		
		String browserStr = String.format("family=%s, patch=%s, major=%s, minor=%s", 
				browser.get("family"), browser.get("patch"),browser.get("major"),browser.get("minor"));
			
		String osStr = String.format("family=%s, patch=%s, patch_minor=%s, major=%s, minor=%s", 
				os.get("family"), os.get("patch"),os.get("patch_minor"),os.get("major"),os.get("minor"));
			
		String deviceStr = String.format("family=%s, model=%s, brand=%s", 
				device.get("family"), device.get("model"),device.get("brand"));
		
		
		//입력
		interest input = new interest();
		input.setI_user_agent(ua);
		input.setI_browser(browserStr);
		input.setI_os(osStr);
		input.setI_device(deviceStr);
		input.setI_h_id(h_id);
		input.setI_h_name(h_name);
		input.setI_h_image_a(h_image_a);
		
		int output_count = 0;
		
		try {
			
			output_count = interestService.getInterestCount(input);
			
			if(output_count == 0) {
				interestService.addInterest(input);
			}else {
				return webHelper.redirect(null, "관리자에게 문의 하세요. already favhobby , two favhobby");
			}
			
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		String redirectUrl = contextPath + "/favhobby_fav.do";
		
		return webHelper.redirectA(redirectUrl, "관심취미 목록이 추가 되었습니다. add favhobby");
		
		
		
		
	}
	
	
	// 관심취미 페이지
	@RequestMapping(value = "/favhobby_fav.do", method = RequestMethod.GET)
	public ModelAndView favhobby_fav(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		String ua = request.getHeader("User-Agent");

		Map<String, String> browser = Browser.lookup(ua);

		Map<String, String> os = (Map<String, String>) OS.lookup(ua);

		Map<String, String> device = (Map<String, String>) Device.lookup(ua);

		String browserStr = String.format("family=%s, patch=%s, major=%s, minor=%s", 
				browser.get("family"), browser.get("patch"),browser.get("major"),browser.get("minor"));

		String osStr = String.format("family=%s, patch=%s, patch_minor=%s, major=%s, minor=%s", 
				os.get("family"), os.get("patch"),os.get("patch_minor"),os.get("major"),os.get("minor"));

		String deviceStr = String.format("family=%s, model=%s, brand=%s", 
				device.get("family"), device.get("model"),device.get("brand"));
		
		interest input = new interest();
		input.setI_browser(browserStr);
		input.setI_device(deviceStr);
		input.setI_os(osStr);
		input.setI_user_agent(ua);
		
		List<interest> output_favhobby_list = null;
		
		
		try {
			
			output_favhobby_list = interestService.getInterestAllFavPage(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
	
		
		
		
		model.addAttribute("output_favhobby_list",output_favhobby_list);
		
		
		
		return new ModelAndView("favhobby");
	}
	
	
	
	// 취미 테스트 페이지로 이동
	@RequestMapping(value = "/hobby_test.do", method = RequestMethod.GET)
	public ModelAndView hobby_test(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		
		return new ModelAndView("hobby_test");
	}
	
	// 취미 테스트 페이지A로 이동
	@RequestMapping(value = "/hobby_test_A.do", method = RequestMethod.GET)
	public ModelAndView hobby_test_A(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
			
			
		return new ModelAndView("hobby_test_A");
	}
	
	// 취미 테스트 페이지B로 이동
	@RequestMapping(value = "/hobby_test_B.do", method = RequestMethod.POST)
	public ModelAndView hobby_test_B(Model model,HttpServletRequest request,
			@RequestParam(value = "test_A" , required = false) String test_A
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		if(test_A == null) {
			return webHelper.redirect(null, "A선택지를 선택해주세요. no testA");
		}
		
		model.addAttribute("output_test_result_A",test_A);
		
		return new ModelAndView("hobby_test_B");
	}
	
	// 취미 테스트 페이지C로 이동
	@RequestMapping(value = "/hobby_test_C.do", method = RequestMethod.POST)
	public ModelAndView hobby_test_C(Model model,HttpServletRequest request,
			@RequestParam(value = "test_A" , required = false) String test_A,
			@RequestParam(value = "test_B" , required = false) String test_B
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		if(test_B == null) {
			return webHelper.redirect(null, "B선택지를 선택해주세요. no testB");
		}
		
		model.addAttribute("output_test_result_A",test_A);
		model.addAttribute("output_test_result_B",test_B);
		
		return new ModelAndView("hobby_test_C");
	}

	// 취미 테스트 페이지D로 이동
	@RequestMapping(value = "/hobby_test_D.do", method = RequestMethod.POST)
	public ModelAndView hobby_test_D(Model model,HttpServletRequest request,
			@RequestParam(value = "test_A" , required = false) String test_A,
			@RequestParam(value = "test_B" , required = false) String test_B,
			@RequestParam(value = "test_C" , required = false) String test_C
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		if(test_C == null) {
			return webHelper.redirect(null, "C선택지를 선택해주세요. no testC");
		}
		
		model.addAttribute("output_test_result_A",test_A);
		model.addAttribute("output_test_result_B",test_B);
		model.addAttribute("output_test_result_C",test_C);
		
		return new ModelAndView("hobby_test_D");
	}
	
	// 취미 테스트 페이지결과로 이동
	@RequestMapping(value = "/hobby_test_result.do", method = RequestMethod.POST)
	public ModelAndView hobby_test_result(Model model,HttpServletRequest request,
			@RequestParam(value = "test_A" , required = false) String test_A,
			@RequestParam(value = "test_B" , required = false) String test_B,
			@RequestParam(value = "test_C" , required = false) String test_C,
			@RequestParam(value = "test_D" , required = false) String test_D
			
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		if(test_D == null) {
			return webHelper.redirect(null, "D선택지를 선택해주세요. no testD");
		}
		
		if(test_A == null && test_B == null && test_C == null && test_D == null) {
			return webHelper.redirect(null, "모든 선택지 선택이 안된 오류 입니다. no all test");
		}
		
		String testAll = "";
		
		testAll = test_A + test_B + test_C + test_D ;
		
		String testResultMBTI ="";
		String testResultMBTI_cont="";
		String testResultMBTI_hobby="";
		
		hobby output_test_A = null;
		hobby output_test_B = null;
		
		hobby input_A = new hobby();
		hobby input_B = new hobby();
		
		switch(testAll) {
			case "ISTJ":
				testResultMBTI = "ISTJ";
				testResultMBTI_cont ="책임감이 강하고 헌식적인 타입";
				testResultMBTI_hobby ="책읽기 , 자기계발 , 가구배치변화 , 플래너 작성";
				input_A.setId(26);
				input_B.setId(71);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "ISFJ":
				testResultMBTI = "ISFJ";
				testResultMBTI_cont ="차분하고 헌신적 , 인내심이 강한 타입";
				testResultMBTI_hobby ="퍼즐 , 자수 , 퍼즐맞춰서 액자 완성";
				input_A.setId(11);
				input_B.setId(22);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "INFJ":
				
				testResultMBTI = "INFJ";
				testResultMBTI_cont ="높은 통찰력 , 사람들에게 영감을 주는 타입";
				testResultMBTI_hobby ="책읽기 , 스케치 , 독서 , 리뷰";
				input_A.setId(26);
				input_B.setId(23);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "INTJ":
				
				testResultMBTI = "INTJ";
				testResultMBTI_cont ="의지강함 , 독립적 , 분석력 뛰어난 타입";
				testResultMBTI_hobby ="수영 , 영화감상 , 상품구매후기 작성 , 영화속 인물분석";
				input_A.setId(33);
				input_B.setId(8);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "ISTP":
				
				testResultMBTI = "ISTP";
				testResultMBTI_cont ="과묵 , 분석적 , 적응력강한 타입";
				testResultMBTI_hobby ="드라이브 , 산책 , 수영 , 3D펜으로 뭔가 제작";
				input_A.setId(67);
				input_B.setId(65);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "ISFP":
				
				testResultMBTI = "ISFP";
				testResultMBTI_cont ="온화하고 겸손 , 삶의 여유 만끽하는 타입";
				testResultMBTI_hobby ="제과제빵 , 책읽기 , 요리 , 익명채팅";
				input_A.setId(26);
				input_B.setId(21);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "INFP":
				
				testResultMBTI = "INFP";
				testResultMBTI_cont ="성실 , 이해심 많음 , 개방적인 타입";
				testResultMBTI_hobby ="블로거 활동 , 유튜버 , 글쓰기 , 언어공부 , 사진찍기";
				input_A.setId(72);
				input_B.setId(66);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "INTP":
				
				testResultMBTI = "INTP";
				testResultMBTI_cont ="지적 호기심 높음 , 잠재력 , 가능성 중요시하는 타입";
				testResultMBTI_hobby ="클라이밍 , 포커 , 추리소설읽기 , 역사속 사건 탐색";
				input_A.setId(15);
				input_B.setId(49);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "ESTP":
				
				testResultMBTI = "ESTP";
				testResultMBTI_cont ="느긋 , 관용적 , 타협잘하는 타입";
				testResultMBTI_hobby ="보컬 , 스쿠버 다이빙 , 인테리어 소품 제작";
				input_A.setId(31);
				input_B.setId(1);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "ESFP":
				
				testResultMBTI = "ESFP";
				testResultMBTI_cont ="호기심 많음 , 개방적인 타입";
				testResultMBTI_hobby ="체스 , 당구 , 친목모임 , 그룹통화";
				input_A.setId(14);
				input_B.setId(36);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "ENFP":
				
				testResultMBTI = "ENFP";
				testResultMBTI_cont ="상상력 풍부 , 순발력 뛰어남 , 일상적 활동에 지루함 느끼는 타입";
				testResultMBTI_hobby ="자격증따기 , 스쿼시 , 연극감상 , 악기연주 , 음악감상";
				input_A.setId(70);
				input_B.setId(38);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "ENTP":
				
				testResultMBTI = "ENTP";
				testResultMBTI_cont ="박학다식 , 독창적 , 새로운 시도 하는 타입";
				testResultMBTI_hobby ="여행 , 서핑 , 생활지식 채우기 , 유튜브감상";
				input_A.setId(32);
				input_B.setId(69);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "ESTJ":
				
				testResultMBTI = "ESTJ";
				testResultMBTI_cont ="체계적 일함 , 규칙 준수하는 타입";
				testResultMBTI_hobby ="야구 , 공예 , 동아리 리더 활동 , 아침마다 데일리 플랜 작성";
				input_A.setId(29);
				input_B.setId(20);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "ESFJ":
				
				testResultMBTI = "ESFJ";
				testResultMBTI_cont ="사람에게 관심 많음 , 친절 , 동정심 많은 타입";
				testResultMBTI_hobby ="영화감상 , 아카펠라 , 가족,친구와 영화감상 , 자원봉사";
				input_A.setId(4);
				input_B.setId(8);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "ENFJ":
				
				testResultMBTI = "ENFJ";
				testResultMBTI_cont ="정의로운 사회 운동가형 , 사교적 , 타인 의견 존중하는 타입";
				testResultMBTI_hobby ="음악듣기 , 연기 , 이벤트만들기 , 낭독회";
				input_A.setId(73);
				input_B.setId(16);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
			case "ENTJ":
				
				testResultMBTI = "ENTJ";
				testResultMBTI_cont ="철저하게 준비 , 활동적 , 통솔력이 있고 단호한 타입";
				testResultMBTI_hobby ="프로그래밍 , 자기계발 , 전략게임 , 레저활동";
				input_A.setId(6);
				input_B.setId(71);
				
				try {
					
					output_test_A = hobbyService.getHobbyItem(input_A);
					output_test_B = hobbyService.getHobbyItem(input_B);
					
				} catch (Exception e) {
					
					return webHelper.redirect(null, e.getLocalizedMessage());
					
				}
				
				break;
		}
		
		
		model.addAttribute("testResultMBTI",testResultMBTI);
		model.addAttribute("testResultMBTI_cont",testResultMBTI_cont);
		model.addAttribute("testResultMBTI_hobby",testResultMBTI_hobby);
		model.addAttribute("output_test_A",output_test_A);
		model.addAttribute("output_test_B",output_test_B);
		
			
		return new ModelAndView("hobby_test_result");
	}
	
}
