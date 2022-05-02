package study.spring.findhobby.controllers;

import java.util.List;
import java.util.Random;

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

import study.spring.findhobby.helper.MailHelper;
import study.spring.findhobby.helper.PageData;
import study.spring.findhobby.helper.RegexHelper;
import study.spring.findhobby.helper.WebHelper;
import study.spring.findhobby.model.hobby;
import study.spring.findhobby.model.members;
import study.spring.findhobby.model.notice;
import study.spring.findhobby.service.HobbyService;
import study.spring.findhobby.service.MembersService;



@Controller
public class LoginController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	MembersService membersService;
	
	@Autowired
	HobbyService hobbyService;
	
	@Autowired
	MailHelper mailhelper;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	// 로그인 페이지로 이동
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView login(Model model
			) {
		
		return new ModelAndView("login");
	}
	
	// 로그인 확인 페이지
	@RequestMapping(value = "/login_ok.do", method = RequestMethod.POST)
	public ModelAndView login_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pw" , required = false) String m_pw){
		
		//1) 유효성 검사
		if(m_id == null || m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(m_pw == null || m_pw.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
	
		
		//2) 데이터 검사
		members input = new members();
		input.setM_id(m_id);
		input.setM_pw(m_pw);
		
		members output = null;
		HttpSession session  = request.getSession();
			
		try {
				
			int a = membersService.getMembersCount(input);
				
			if( a == 1  ) {
					
				output = membersService.getMembersItem(input);
					
			}else {
					
				return webHelper.redirect(null,"아이디나 비밀번호가 잘못 되었습니다. ID / PW error , delete user");
					
			}
				
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
			
		//3) 결과 확인 위한 페이지 이동
		model.addAttribute("key",output);
		session.setAttribute("key", output); 
			
		if(output.getId() == 0) {
			
			String redirectUrl = contextPath + "/master/master_main.do";
			
			return webHelper.redirect(redirectUrl, "관리자 로그인 되었습니다. admin sucess");
			
		}else {
			
			String redirectUrl = contextPath + "/main.do";
			
			return webHelper.redirect(redirectUrl, "로그인 되었습니다. login sucess");
			
		}
		
	}
	
	// 로그인 확인후 개인정보 페이지로 이동
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView myPage(Model model,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		int A = key.getId();
		
		if(A == 0) {
			return webHelper.redirect(null, "개발자에게 문의하세요. AHAH coming");
		}
		
		members input = new members();
		input.setId(A);
		
		members output = null;
		
		try {
			
			output = membersService.getMembersItem(input);
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		model.addAttribute("output",output);
		session.setAttribute("key", key);
		
		
		return new ModelAndView("mypage");
	}
	
	// 로그 아웃 부분
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(Model model,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		session.invalidate();
		
		List<hobby> output_hobby_list = null;
		
		hobby input = new hobby();
		
		try {
			output_hobby_list = hobbyService.getHobbyAll(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output_hobby_list",output_hobby_list);
		
		
		String redirectUrl = contextPath + "/main.do";
		
		return webHelper.redirect(redirectUrl, "로그아웃 되었습니다. logout");
	}
	
	
	//회원가입 페이지로 이동
	@RequestMapping(value = "/login_user_plus.do", method = RequestMethod.GET)
	public ModelAndView login_user_plus(Model model) {
		
		return new ModelAndView("login_user_plus");
	}
	
	
	
	//회원가입 확인 페이지로 이동
	@RequestMapping(value = "/login_user_plus_ok.do", method = RequestMethod.POST)
	public ModelAndView login_user_plus_ok(Model model,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pwA" , required = false) String m_pwA,
			@RequestParam(value = "m_pwB" , required = false) String m_pwB,
			@RequestParam(value = "m_name" , required = false) String m_name,
			@RequestParam(value = "m_username" , required = false) String m_username,
			@RequestParam(value = "m_email" , required = false) String m_email,
			@RequestParam(value = "m_phone" , required = false) String m_phone,
			@RequestParam(value = "m_birthday" , required = false) String m_birthday,
			@RequestParam(value = "gender" , required = false) String gender) {
		
		//1) 유효성 검사
		if(m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요. id1"); }
		if(!regexHelper.isEngNum(m_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다. id2"); }
				
		if(m_pwA.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요. pw1"); }
		if(!regexHelper.isEngNum(m_pwA)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다. pw2"); }
				
		String pwA = (String)m_pwA;
		String pwB = (String)m_pwB;
				
		if(!(pwA.equals(pwB))) 						{ return webHelper.redirect(null, "비밀번호를 확인해주세요. pw3"); }
				
		if(m_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요. name1"); }
		if(!regexHelper.isKor(m_name)) 		{ return webHelper.redirect(null, "이름은 한글만 가능합니다. name2"); }
				
		if(m_username.equals("")) 				{ return webHelper.redirect(null, "닉네임을 입력하세요. username1"); }
		if(!regexHelper.isEngNum(m_username)) 	{ return webHelper.redirect(null, "닉네임은 영어와 숫자로만 가능합니다. username2"); }
				
		if(m_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요. email1"); }
		if(!regexHelper.isEmail(m_email)) 	{ return webHelper.redirect(null, "이메일 형식에 맞게 입력해 주세요. email2"); }
				
		if(m_phone.equals("")) 						{ return webHelper.redirect(null, "휴대폰번호를 입력하세요. phone1"); }
		if(!regexHelper.isCellPhone(m_phone)) 		{ return webHelper.redirect(null, "휴대폰번호를 (-)없이 다시 입력해주세요. phone2"); }
				
		if(m_birthday.equals("")) 				{ return webHelper.redirect(null, "생년월일을 입력하세요. birth1"); }
		
		if(gender.equals("")) 				{ return webHelper.redirect(null, "성별을 입력해주세요. gender1"); }
		
		members input = new members();
		input.setM_id(m_id);
		input.setM_pw(m_pwA);
		input.setM_name(m_name);
		input.setM_username(m_username);
		input.setM_email(m_email);
		input.setM_phone(m_phone);
		input.setM_birthday(m_birthday);
		input.setM_gender(gender);
		
		try {
			membersService.addMembers(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String redirectUrl = contextPath + "/login.do";
		return webHelper.redirect(redirectUrl, "회원가입 되었습니다. members add");
		
	}
	
	
	// ID/PW 찾기 페이지로 이동
	@RequestMapping(value = "/login_user_IDPW.do", method = RequestMethod.GET)
	public ModelAndView login_user_IDPW(Model model) {
		
		return new ModelAndView("login_user_IDPW");
	}
	
	// ID 찾기 페이지로 이동
	@RequestMapping(value = "/login_user_findID.do", method = RequestMethod.GET)
	public ModelAndView login_user_findID(Model model) {
		
		return new ModelAndView("login_user_findID");
	}
	
	// ID 찾기 확인페이지로 이동
	@RequestMapping(value = "/login_user_findID_ok.do", method = RequestMethod.POST)
	public ModelAndView login_user_findID_ok(Model model,
			@RequestParam(value = "m_name" , required = false) String m_name,
			@RequestParam(value = "m_email" , required = false) String m_email,
			HttpServletRequest request
			) {
			
			if(m_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요. name1"); }
			if(!regexHelper.isKor(m_name)) 		{ return webHelper.redirect(null, "이름은 한글만 가능합니다. name2"); }
			
			if(m_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요. email1"); }
			if(!regexHelper.isEmail(m_email)) 	{ return webHelper.redirect(null, "이메일 형식에 맞게 입력해 주세요. email2"); }
			
			members input = new members();
			input.setM_name(m_name);
			input.setM_email(m_email);
			
			int idok = 0;
			
			try {
				idok = membersService.getMembersCount(input);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			if(idok != 1) {
				return webHelper.redirect(null, "아이디 이메일을 확인해 주세요. ID / email check");
			}
			
			members output_findID = null;
			
			try {
				output_findID = membersService.getMembersItem(input);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
//			HttpSession session  = request.getSession();
//			session.setAttribute("output_findID", output_findID);
			
//			 String redirectUrl = contextPath + "/login_user_findID_ok_final.do"; 
//			 return webHelper.redirect(redirectUrl, "확인되었습니다. members find");
			
			model.addAttribute("output_findID",output_findID);
			 
			return new ModelAndView("login_user_findID_ok_final");
			
			
		}
		
	// ID 찾기 진짜 마지막 페이지로 이동
//	@RequestMapping(value = "/login_user_findID_ok_final.do", method = RequestMethod.GET)
//	public ModelAndView login_user_findID_ok_final(Model model,
//			HttpServletRequest request,
//			HttpSession session
//			) {
//		
//		
//		members output_findID = (members) session.getAttribute("output_findID");
//		
//		Integer inputId = (Integer)output_findID.getId();
//		
//		members output_findID_final = null;
//		
//		members input = null;
//		input.setId(inputId);
//		
//		try {
//			output_findID_final = membersService.getMembersItem(input);
//		} catch (Exception e) {
//			return webHelper.redirect(null, e.getLocalizedMessage());
//		}
//		
//		session.removeAttribute("output_findID");
//		model.addAttribute("output_findID_final",output_findID_final);
//				
//		return new ModelAndView("login_user_findID_ok_final");
//	}
	
	
	// PW 찾기 페이지 1로 이동
	@RequestMapping(value = "/login_user_findPW_A.do", method = RequestMethod.GET)
	public ModelAndView login_user_findPW_A(Model model) {
			
		return new ModelAndView("login_user_findPW_A");
	}
	
	// PW 찾기 페이지 2로 이동전 검사
	@RequestMapping(value = "/findPW_A_ok.do", method = RequestMethod.POST)
	public ModelAndView findPW_A_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_name" , required = false) String m_name,
			@RequestParam(value = "m_email" , required = false) String m_email
			) {
		
		HttpSession session  = request.getSession();
		
		if(m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요. id no insert_PW_A"); }
		if(m_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요. name no insert_PW_A"); }
		if(m_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요. eamil no insert_PW_A"); }
		
		members input = new members();
		input.setM_id(m_id);
		input.setM_email(m_email);
		input.setM_name(m_name);
		
		int output_count = 0;
		members output_members = null;
		
		try {
			
			output_count = membersService.getMembersCountPassword(input);
			output_members = membersService.getMembersItemPassword(input);
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		if ( output_count == 0  ) {
			return webHelper.redirect(null, " 입력하신 정보를 확인해주세요. members no insert_PW_A");
		}
		
		if ( output_count > 1  ) {
			return webHelper.redirect(null, "정보 확인 오류입니다 관리자에게 문의하세요. two members insert_PW_A");
		}
		
		int count = 8;
		
		String[] outcode ={ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", 
				"K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", 
                "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
		
		String maincode = "";
		Random random = new Random(System.currentTimeMillis());
		int besize = outcode.length;
		for(int i = 0; i < count; i++) {
			maincode += outcode[random.nextInt(besize)];
		}
		
		String to = output_members.getM_email();
		String subject = "findhobby 비밀번호 인증키 전송";
		String content = "인증번호 8자리를 비밀번호 재설정 페이지에 입력해주세요. 인증번호 (  " + maincode + "  )";
		
		try {
			
			mailhelper.sendMail(to, subject, content);
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, "메일 발송에 실패 했습니다.");
			
		}
		
		session.setAttribute("pw_ok", maincode);
		session.setAttribute("key", output_members);
		
		String redirectUrl = contextPath + "/login_user_findPW_B.do";
		return webHelper.redirect(redirectUrl, "회원정보가 확인되었습니다. 메일주소로 인증번호 8자리를 발송했습니다. mem_ok , email_submit");
	}
	
	// PW 찾기 페이지 2로 이동
	@RequestMapping(value = "/login_user_findPW_B.do", method = RequestMethod.GET)
	public ModelAndView login_user_findPW_B(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		String pw_ok = (String) session.getAttribute("pw_ok");
		members key = (members) session.getAttribute("key");
			
		session.setAttribute("pw_ok", pw_ok);
		session.setAttribute("key", key);
				
		return new ModelAndView("login_user_findPW_B");
	}
	
	// PW 찾기 페이지 3로 이동전 검사
	@RequestMapping(value = "/findPW_B_ok.do", method = RequestMethod.POST)
	public ModelAndView findPW_B_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "pass_code" , required = false) String pass_code
			) {
		
			HttpSession session  = request.getSession();
			String pw_ok = (String) session.getAttribute("pw_ok");
			members key = (members) session.getAttribute("key");
				
			String A = String.valueOf(pw_ok.trim());
			String B = String.valueOf(pass_code.trim());
				
				
			if(pass_code.equals("")) 				{ return webHelper.redirect(null, "인증번호를 입력하세요. passcode no insert_PW_B"); }
				
			if(pw_ok == null) {
				return webHelper.redirect(null, "개발자에게 문의하세요. AHAH coming no passcode");
			}
	
			if(!(A.equals(B))) {
				return webHelper.redirect(null, "인증번호키를 확인 후 다시 입력해 주세요. password != passcode");
			}
				
			session.setAttribute("key", key);
				
			String redirectUrl = contextPath + "/login_user_findPW_C.do";
			return webHelper.redirect(redirectUrl, "인증번호가 확인 되었습니다. passcode ok");
	}
		
	// PW 찾기 페이지 3로 이동
	@RequestMapping(value = "/login_user_findPW_C.do", method = RequestMethod.GET)
	public ModelAndView login_user_findPW_C(Model model,
			HttpServletRequest request
				) {
					
				HttpSession session  = request.getSession();
				String pw_ok = (String) session.getAttribute("pw_ok");
				members key = (members) session.getAttribute("key");
					
				session.setAttribute("pw_ok", pw_ok);
				session.setAttribute("key", key);
					
				return new ModelAndView("login_user_findPW_C");
	}
	
		
	// PW 찾기 페이지 마지막 비밀번호 변경 후 로그인 페이지로 이동
	@RequestMapping(value = "/findPW_C_ok.do", method = RequestMethod.POST)
	public ModelAndView findPW_C_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "m_pw_A" , required = false) String m_pw_A,
			@RequestParam(value = "m_pw_B" , required = false) String m_pw_B
			) {
					
			HttpSession session  = request.getSession();
			String pw_ok = (String) session.getAttribute("pw_ok");
			members key = (members) session.getAttribute("key");
			int A = key.getId();
					
			if(m_pw_A == null) {
				return webHelper.redirect(null, "패스워드를 입력해주세요. AHAH coming no password_A");
			}
					
			if(m_pw_B == null) {
				return webHelper.redirect(null, "패스워드를 한번더 입력해주세요. AHAH coming no password_B");
			}
					
			if(key == null) {
				return webHelper.redirect(null, "개발자에게 문의하세요. AHAH coming no member code");
			}
					
			if(!regexHelper.isEngNum(m_pw_A)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다. pw2"); }
			if(!regexHelper.isEngNum(m_pw_B)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다. pw2"); }
				
			String pwA = (String)m_pw_A;
			String pwB = (String)m_pw_B;
			if(!(pwA.equals(pwB))) 						{ return webHelper.redirect(null, "비밀번호를 확인해주세요. pwa != pwb"); }
					
					
			members input_A = new members();
			input_A.setId(A);
			input_A.setM_pw(m_pw_A);
					
					
			try {
				
				membersService.editMembers_password(input_A);
						
			} catch (Exception e) {
						
				return webHelper.redirect(null, e.getLocalizedMessage());
						
			}
					
			session.invalidate();
				
			String redirectUrl = contextPath + "/login.do";
			return webHelper.redirect(redirectUrl, "비밀번호가 변경되었습니다. password change");
	}
		
	
	
	
	// 마이페이지 에서 회원 정보 수정 페이지로 이동
	@RequestMapping(value = "/mypage_update.do", method = RequestMethod.GET)
	public ModelAndView mypage_update(Model model,HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		int A = key.getId();
		
		if(A == 0) {
			return webHelper.redirect(null, "개발자에게 문의하세요. AHAH coming");
		}
		
		members input = new members();
		input.setId(A);
		
		members output_mypage_update = null;
		
		try {
			
			output_mypage_update = membersService.getMembersItem(input);
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		model.addAttribute("output_mypage_update",output_mypage_update);
		session.setAttribute("key", key);
		
		
		return new ModelAndView("mypage_update");
	}
	
	
	// 회원 수정 확인 페이지
	@RequestMapping(value = "/mypage_update_ok.do", method = RequestMethod.POST)
	public ModelAndView edit_ok(Model model,
			@RequestParam(value = "id" , defaultValue =  "0") int id,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pw" , required = false) String m_pw,
			@RequestParam(value = "m_name" , required = false) String m_name,
			@RequestParam(value = "m_username" , required = false) String m_username,
			@RequestParam(value = "m_email" , required = false) String m_email,
			@RequestParam(value = "m_phone" , required = false) String m_phone,
			@RequestParam(value = "m_birthday" , required = false) String m_birthday,
			@RequestParam(value = "gender" , required = false) String gender,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		int A = key.getId();
		
		//1) 유효성 검사
		
		if(id == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다. no user");
		}
		
		if(m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요. id1"); }
		if(!regexHelper.isEngNum(m_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다. id2"); }
				
		if(m_pw.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요. pw1"); }
		if(!regexHelper.isEngNum(m_pw)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다. pw2"); }
					
		if(m_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요. name1"); }
		if(!regexHelper.isKor(m_name)) 		{ return webHelper.redirect(null, "이름은 한글만 가능합니다. name2"); }
				
		if(m_username.equals("")) 				{ return webHelper.redirect(null, "닉네임을 입력하세요. username1"); }
		if(!regexHelper.isEngNum(m_username)) 	{ return webHelper.redirect(null, "닉네임은 영어와 숫자로만 가능합니다. username2"); }
				
		if(m_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요. email1"); }
		if(!regexHelper.isEmail(m_email)) 	{ return webHelper.redirect(null, "이메일 형식에 맞게 입력해 주세요. email2"); }
				
		if(m_phone.equals("")) 						{ return webHelper.redirect(null, "휴대폰번호를 입력하세요. phone1"); }
		if(!regexHelper.isCellPhone(m_phone)) 		{ return webHelper.redirect(null, "휴대폰번호를 (-)없이 다시 입력해주세요. phone2"); }
				
		if(m_birthday.equals("")) 				{ return webHelper.redirect(null, "생년월일을 입력하세요. birth1"); }
		
		if(gender.equals("")) 				{ return webHelper.redirect(null, "성별을 입력해주세요. gender1"); }
			
		// 2) 비밀번호 확인
		if(A == 0) {
			return webHelper.redirect(null, "개발자에게 문의하세요. AHAH coming");
		}
		
		members input_pw_ok = new members();
		input_pw_ok.setId(A);
		input_pw_ok.setM_pw(m_pw);
		
		int output_pw_ok = 0;
		
		try {
			
			output_pw_ok = membersService.getMembersCount(input_pw_ok);
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		if(output_pw_ok != 1) {
			return webHelper.redirect(null, "비밀번호를 확인해 주세요. PW_ok_check");
		}
		
				
		//3) 데이터 저장
		members input = new members();
		input.setId(id);
		input.setM_id(m_id);
		input.setM_pw(m_pw);
		input.setM_name(m_name);
		input.setM_username(m_username);
		input.setM_email(m_email);
		input.setM_phone(m_phone);
		input.setM_birthday(m_birthday);
		input.setM_gender(gender);
		
		members input_mypage_come = new members();
		
		input_mypage_come.setId(A);
		
		members output_mypage_come = null;
		
		
		try {
			
			membersService.editMembers(input);
			
			output_mypage_come = membersService.getMembersItem(input_mypage_come);
			
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		
		model.addAttribute("output",output_mypage_come);
		session.setAttribute("key", key);
		
		
		String redirectUrl = contextPath + "/mypage.do";
		
		return webHelper.redirect(redirectUrl, "수정되었습니다. update sucess");
	}	
	
	//탈퇴하기 페이지
	@RequestMapping(value = "/mypage_delete.do", method = RequestMethod.GET)
	public ModelAndView mypage_delete(Model model,HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		int A = key.getId();
		
		if(A == 0) {
			return webHelper.redirect(null, "개발자에게 문의하세요. AHAH coming");
		}
		
		members input = new members();
		input.setId(A);
		
		members output_mypage_delete_page = null;
		
		try {
			
			output_mypage_delete_page = membersService.getMembersItem(input);
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		model.addAttribute("output_mypage_delete_page",output_mypage_delete_page);
		session.setAttribute("key", key);
		
		return new ModelAndView("mypage_delete");
	}	
	
	// 탈퇴처리 페이지
	@RequestMapping(value = "/mypage_delete_ok.do", method = RequestMethod.POST)
	public ModelAndView mypage_delete_ok(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "id" , defaultValue =  "0") int id,
			@RequestParam(value = "m_pwA" , required = false) String m_pwA,
			@RequestParam(value = "m_pwB" , required = false) String m_pwB
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		int A = key.getId();
		
		if(A == 0) {
			return webHelper.redirect(null, "개발자에게 문의하세요. AHAH coming");
		}
		
		if(id == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다. no user");
		}
		
		if(m_pwA.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요. pw1"); }
		if(!regexHelper.isEngNum(m_pwA)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다. pw2"); }
				
		String pwA = (String)m_pwA;
		String pwB = (String)m_pwB;
				
		if(!(pwA.equals(pwB))) 						{ return webHelper.redirect(null, "비밀번호를 확인해주세요. pw3"); }
		
		
		members input = new members();
		input.setId(id);
		input.setM_pw(m_pwA);
		
		int output_pw_ok = 0;
		
		try {
			
			output_pw_ok = membersService.getMembersCount(input);
			
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		
		if(output_pw_ok != 1) {
			return webHelper.redirect(null, "비밀번호를 확인해 주세요. PW_ok_check");
		}
		
		members delete_input = new members();
		delete_input.setId(id);
		
		try {
			
			membersService.editMembers_delete(delete_input);
			
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		session.invalidate();
		
		String redirectUrl = contextPath + "/main.do";
		
		return webHelper.redirect(redirectUrl, "탈퇴되었습니다. delete sucess");
	}	
	
	//
	// 로그인 확인 페이지
	@RequestMapping(value = "/qna_login_ok.do", method = RequestMethod.POST)
	public ModelAndView qna_login_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pw" , required = false) String m_pw){
			
		//1) 유효성 검사
		if(m_id == null || m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(m_pw == null || m_pw.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		
		//2) 데이터 검사
		members input = new members();
		input.setM_id(m_id);
		input.setM_pw(m_pw);
		
		members output = null;
		HttpSession session  = request.getSession();
			
		try {
				
			int a = membersService.getMembersCount(input);
				
			if( a == 1  ) {
					
				output = membersService.getMembersItem(input);
					
			}else {
					
				return webHelper.redirect(null,"아이디나 비밀번호가 잘못 되었습니다. ID / PW error , delete user");
					
			}
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			//3) 결과 확인 위한 페이지 이동
			model.addAttribute("key",output);
			session.setAttribute("key", output); 
			
			String redirectUrl = contextPath + "/usercenter_question.do";
			
			return webHelper.redirect(redirectUrl, "로그인 되었습니다. qna login sucess");
			
	}
	
	//************************************************************************************************************************************************
	// 관리자 페이지로 이동
		@RequestMapping(value = "/master/master_main.do", method = RequestMethod.GET)
		public ModelAndView master_main(Model model,
				HttpServletRequest request,
				@RequestParam(value="keyword" ,required = false) String keyword,
				@RequestParam(value="page" ,defaultValue = "1") int nowPage
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			if(key == null) {
				return webHelper.redirect(null, "개발자에게 문의하세요. AHAH coming admin error");
			}
			
			int totalCount = 0;
			int listCount = 10;
			int pageCount = 5;
			
			members input = new members();
			input.setM_name(keyword);
			input.setM_id(keyword);
			input.setM_username(keyword);
			input.setM_email(keyword);
			input.setM_phone(keyword);
			
			List<members> output = null;
			PageData pageData = null;
			
			try {
				
				totalCount = membersService.getMembersCountMaster(input);
				
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
				members.setOffset(pageData.getOffset());
				members.setListCount(pageData.getListCount());
				
				output = membersService.getMembersAllMaster(input);
						
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			model.addAttribute("keyword",keyword);
			model.addAttribute("pageData",pageData);
			model.addAttribute("output_master_members",output);
			
			return new ModelAndView("/master/master_main");
		}
	
	
	
	
}
