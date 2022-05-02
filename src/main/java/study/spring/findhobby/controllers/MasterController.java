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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import study.spring.findhobby.helper.MailHelper;
import study.spring.findhobby.helper.PageData;
import study.spring.findhobby.helper.RegexHelper;
import study.spring.findhobby.helper.UploadItem;
import study.spring.findhobby.helper.WebHelper;
import study.spring.findhobby.model.hobby;
import study.spring.findhobby.model.members;
import study.spring.findhobby.model.notice;
import study.spring.findhobby.model.qna;
import study.spring.findhobby.service.HobbyService;
import study.spring.findhobby.service.MembersService;
import study.spring.findhobby.service.NoticeService;
import study.spring.findhobby.service.QNAService;



@Controller
public class MasterController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	MembersService membersService;
	@Autowired
	HobbyService hobbyService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	QNAService qnaService;
	
	@Autowired
	MailHelper mailhelper;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	// 관리자 로그아웃처리
	@RequestMapping(value = "/master/master_logout.do", method = RequestMethod.GET)
	public ModelAndView master_logout(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		session.invalidate();
		
		String redirectUrl = contextPath + "/main.do";
		
		return webHelper.redirect(redirectUrl, "관리자 로그아웃 되었습니다. admin logout");
	}
	
	
	// 관리자 페이지로 이동
	//**************************************************************************************************************
	@RequestMapping(value = "/master/master_members.do", method = RequestMethod.GET)
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
	
	
	// 회원 추가 페이지
	@RequestMapping(value = "/master/master_user_plus.do", method = RequestMethod.GET)
	public ModelAndView master_user_plus(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		return new ModelAndView("/master/master_user_plus");
	}
	
	// 회원 추가 확인 페이지
	@RequestMapping(value = "/master/master_user_plus_ok.do", method = RequestMethod.POST)
	public ModelAndView master_user_plus_ok(Model model,
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
			
			String redirectUrl = contextPath + "/master/master_main.do";
			return webHelper.redirect(redirectUrl, "회원추가 되었습니다. master members add");
			
		}
	
	// 관리자 페이지 회원 정보 상세 페이지
	@RequestMapping(value = "/master/master_user_see.do", method = RequestMethod.GET)
	public ModelAndView master_user_see(Model model,
			@RequestParam(value = "id" , defaultValue =  "0") int id,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		
		members id_key = (members) session.getAttribute("id_key");
		session.setAttribute("key", key);
		
		members input = new members();
		if(id_key != null) {
			input.setId(id_key.getId());
		}else {
			input.setId(id);
		}
		
		session.removeAttribute("id_key");
		
		members output = null;
		
		try {
			
			output = membersService.getMembersItem(input);
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		model.addAttribute("output",output);
		
		return new ModelAndView("/master/master_user_see");
	}
	
	//회원 수정 페이지
	@RequestMapping(value = "/master/master_user_update.do", method = RequestMethod.GET)
	public ModelAndView mypage_update(Model model,
			@RequestParam(value = "id" , defaultValue =  "0") int id,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		members input = new members();
		input.setId(id);
		
		members output_master_update = null;
		
		try {
			
			output_master_update = membersService.getMembersItem(input);
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		model.addAttribute("output_master_update",output_master_update);
		
		return new ModelAndView("/master/master_user_change");
	}
	
	// 회원 수정 확인 페이지
		@RequestMapping(value = "/master/master_update_ok.do", method = RequestMethod.POST)
		public ModelAndView master_update_ok(Model model,
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
			
			session.setAttribute("key", key);
			
			
			// 유효성 검사
			
			if(id == 0) {
				return webHelper.redirect(null, "회원번호가 없습니다. no user");
			}
			
			if(m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요. id1"); }
			if(!regexHelper.isEngNum(m_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다. id2"); }
						
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
			input.setId(id);
			input.setM_id(m_id);
			input.setM_name(m_name);
			input.setM_username(m_username);
			input.setM_email(m_email);
			input.setM_phone(m_phone);
			input.setM_birthday(m_birthday);
			input.setM_gender(gender);
			
			members input_master_come = new members();
			
			input_master_come.setId(id);
			
			members output_master_come = null;
			
			
			try {
				
				membersService.editMembersMaster(input);
				
				output_master_come = membersService.getMembersItem(input_master_come);
				
				
			} catch (Exception e) {
				
				return webHelper.redirect(null, e.getLocalizedMessage());
				
			}
			
			model.addAttribute("output",output_master_come);
			session.setAttribute("id_key", output_master_come);
			
			String redirectUrl = contextPath + "/master/master_user_see.do";
			
			return webHelper.redirect(redirectUrl, "수정되었습니다. master update sucess");
		}	
		
		// 관리자 페이지 탈퇴처리 
		@RequestMapping(value = "/master/master_user_delete.do", method = RequestMethod.GET)
		public ModelAndView master_user_delete(
				Model model,
				HttpServletRequest request,
				@RequestParam(value = "id" , defaultValue =  "0") int id
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			
			if(id == 0) {
				return webHelper.redirect(null, "회원번호가 없습니다. no user");
			}
			
			members delete_input = new members();
			delete_input.setId(id);
			
			try {
				
				membersService.editMembers_delete(delete_input);
				
				
			} catch (Exception e) {
				
				return webHelper.redirect(null, e.getLocalizedMessage());
				
			}
			
			String redirectUrl = contextPath + "/master/master_main.do";
			
			return webHelper.redirect(redirectUrl, "탈퇴되었습니다. master delete sucess");
		}	
		
		
		
		
		// 2) 관리자 취미 페이지 메인
		// 관리자 취미 페이지로 이동
		//**************************************************************************************************************
		@RequestMapping(value = "/master/master_hobby_main.do", method = RequestMethod.GET)
		public ModelAndView master_hobby_main(Model model,
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
				
			hobby input = new hobby();
			input.setH_cont(keyword);
			input.setH_name(keyword);
			input.setH_option(keyword);
				
			List<hobby> output_hobby_main = null;
			PageData pageData = null;
				
			try {
					
				totalCount = hobbyService.getHobbyCountMaster(input);
					
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
					
				hobby.setOffset(pageData.getOffset());
				hobby.setListCount(pageData.getListCount());
					
				output_hobby_main = hobbyService.getHobbyAllMaster(input);
							
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
				
			model.addAttribute("keyword",keyword);
			model.addAttribute("pageData",pageData);
			model.addAttribute("output_hobby_main",output_hobby_main);
				
			return new ModelAndView("/master/master_hobby_main");
		}
		
		
		//취미 상세 페이지
		
		@RequestMapping(value = "/master/master_hobby_see.do", method = RequestMethod.GET)
		public ModelAndView master_hobby_see(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				HttpServletRequest request) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			hobby id_key_hobby = (hobby) session.getAttribute("id_key_hobby");
			
			hobby input = new hobby();
			if(id_key_hobby != null) {
				input.setId(id_key_hobby.getId());
			}else {
				input.setId(id);
			}
			
			session.removeAttribute("id_key_hobby");
			
			hobby master_output_detail = null;
			
			try {
				
				master_output_detail = hobbyService.getHobbyItem(input);
				
			} catch (Exception e) {
				
				return webHelper.redirect(null, e.getLocalizedMessage());
				
			}
			
			model.addAttribute("master_output_detail",master_output_detail);
			
			return new ModelAndView("/master/master_hobby_see");
		}	
		
	// 취미 추가 
		@RequestMapping(value = "/master/master_hobby_plus.do", method = RequestMethod.GET)
		public ModelAndView master_hobby_plus(Model model,
				HttpServletRequest request
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			return new ModelAndView("/master/master_hobby_plus");
			
		}
		
		@RequestMapping(value = "/master/master_hobby_plus_ok.do", method = RequestMethod.POST)
		public ModelAndView master_hobby_plus_ok(Model model,
				@RequestParam(value = "h_name" , required = false) String h_name,
				@RequestParam(required=false) MultipartFile h_image_a,
				@RequestParam(required=false) MultipartFile[] h_image_b,
				@RequestParam(value = "h_name" , required = false) String h_option,
				@RequestParam(value = "h_name" , required = false) String h_cont,
				HttpServletRequest request
				) {
						
			if(h_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요. name1"); }
			if(h_option.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요. name1"); }
			if(h_cont.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요. name1"); }
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			UploadItem item = null;
			
			// 단일 업로드 부분
			try {
		           item = webHelper.saveMultipartFile(h_image_a);
			} catch (NullPointerException e) {
				e.printStackTrace();
				return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
		    } catch (Exception e) {
		    	e.printStackTrace();
		    	return webHelper.redirect(null, "업로드에 실패했습니다.");
		    }
			
			String input_h_image_a = item.getFilePath().replace("/", "");
			input_h_image_a = input_h_image_a.trim();
			
			//다중 업로드 부분
			List<UploadItem> list = null;
			
			try {
				list = webHelper.saveMultipartFile(h_image_b);
			} catch (NullPointerException e) {
				e.printStackTrace();
				return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
		    } catch (Exception e) {
		    	e.printStackTrace();
		    	return webHelper.redirect(null, "업로드에 실패했습니다.");
		    }
			
			String input_h_image_b = "";
			
	        for (int i=0; i<list.size(); i++) {
	            UploadItem item_A = list.get(i);
	            
	            if(i == 0) {
	            	input_h_image_b += item_A.getFilePath().replace("/", "");
	            }else {
	            	input_h_image_b += "," + item_A.getFilePath().replace("/", "");
	            }
	            
	            // 원본 파일의 경로를 웹상에 노출 가능한 형태로 보정
	            String fileUrl = webHelper.getUploadUrl(item_A.getFilePath());
	            item_A.setFileUrl(fileUrl);
	        }
			
			// 취미추가 위한 input
			
			hobby input = new hobby();
			input.setH_name(h_name);
			input.setH_cont(h_cont);
			input.setH_option(h_option);
			input.setH_image_a(input_h_image_a);
			input.setH_image_b(input_h_image_b);
			
			hobby input_key = new hobby();
			
			hobby master_output_detail = null;
			
			try {
				
				hobbyService.addHobby(input);
				
				input_key.setId(input.getId());
				
				master_output_detail = hobbyService.getHobbyItem(input_key);
				
			} catch (Exception e) {
				
				return webHelper.redirect(null, e.getLocalizedMessage());
				
			}
			
			 model.addAttribute("master_output_detail", master_output_detail);
			
			return new ModelAndView("/master/master_hobby_see");
			
		}
		
		// 취미 수정 페이지로 이동
		@RequestMapping(value = "/master/master_hobby_update.do", method = RequestMethod.GET)
		public ModelAndView master_hobby_update(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				HttpServletRequest request
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			if(id == 0) {
				return webHelper.redirect(null, "취미번호가 없습니다. no hobby");
			}
			
			hobby input = new hobby();
			input.setId(id);
			
			hobby master_hobby_update = null;
			
			try {
				
				master_hobby_update = hobbyService.getHobbyItem(input);
				
			} catch (Exception e) {
				
				return webHelper.redirect(null, e.getLocalizedMessage());
				
			}
			
			//String image_a = master_hobby_update.getH_image_a() + "기존업로드 이미지 입니다. 확인 후 재설정 해주세요.";
			//String image_b = master_hobby_update.getH_image_b() + "기존업로드 이미지 입니다. 확인 후 재설정 해주세요.";
			
			model.addAttribute("master_hobby_update", master_hobby_update);
			//model.addAttribute("image_a", image_a);
			//model.addAttribute("image_b", image_b);
			
			return new ModelAndView("/master/master_hobby_change");
			
		}	
		
		// 취미 수정 처리
		@RequestMapping(value = "/master/master_hobby_update_ok.do", method = RequestMethod.POST)
		public ModelAndView master_hobby_update_ok(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				@RequestParam(value = "h_name" , required = false) String h_name,
				@RequestParam(required=false) MultipartFile h_image_a,
				@RequestParam(required=false) MultipartFile[] h_image_b,
				@RequestParam(value = "h_name" , required = false) String h_option,
				@RequestParam(value = "h_name" , required = false) String h_cont,
				HttpServletRequest request
				) {
				
			if(id == 0) { return webHelper.redirect(null, "취미번호가 없습니다. no hobby"); }
			if(h_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요. name1"); }
			if(h_option.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요. name1"); }
			if(h_cont.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요. name1"); }
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			UploadItem item = null;
			
			// 단일 업로드 부분
			try {
		           item = webHelper.saveMultipartFile(h_image_a);
			} catch (NullPointerException e) {
				e.printStackTrace();
				return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
		    } catch (Exception e) {
		    	e.printStackTrace();
		    	return webHelper.redirect(null, "업로드에 실패했습니다.");
		    }
			
			String input_h_image_a = item.getFilePath().replace("/", "");
			input_h_image_a = input_h_image_a.trim();
			
			//다중 업로드 부분
			List<UploadItem> list = null;
			
			try {
				list = webHelper.saveMultipartFile(h_image_b);
			} catch (NullPointerException e) {
				e.printStackTrace();
				return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
		    } catch (Exception e) {
		    	e.printStackTrace();
		    	return webHelper.redirect(null, "업로드에 실패했습니다.");
		    }
			
			String input_h_image_b = "";
			
	        for (int i=0; i<list.size(); i++) {
	            UploadItem item_A = list.get(i);
	            
	            if(i == 0) {
	            	input_h_image_b += item_A.getFilePath().replace("/", "");
	            }else {
	            	input_h_image_b += "," + item_A.getFilePath().replace("/", "");
	            }
	            
	            // 원본 파일의 경로를 웹상에 노출 가능한 형태로 보정
	            String fileUrl = webHelper.getUploadUrl(item_A.getFilePath());
	            item_A.setFileUrl(fileUrl);
	        }
			
			// 취미추가 위한 input
			
			hobby input = new hobby();
			input.setId(id);
			input.setH_name(h_name);
			input.setH_cont(h_cont);
			input.setH_option(h_option);
			input.setH_image_a(input_h_image_a);
			input.setH_image_b(input_h_image_b);
			
			hobby input_one_detail = new hobby();
			input_one_detail.setId(id);
			
			hobby master_output_detail = null;
			
			try {
				
				hobbyService.editHobby(input);
				
				master_output_detail = hobbyService.getHobbyItem(input_one_detail);
				
			} catch (Exception e) {
				
				return webHelper.redirect(null, e.getLocalizedMessage());
				
			}
			
			 model.addAttribute("master_output_detail", master_output_detail);
			
			return new ModelAndView("/master/master_hobby_see");
			
		}
		// 취미 삭제 처리
		@RequestMapping(value = "/master/master_hobby_delete.do", method = RequestMethod.GET)
		public ModelAndView master_hobby_delete(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				HttpServletRequest request
				) {
					
				if(id == 0) { return webHelper.redirect(null, "취미번호가 없습니다. no hobby"); }
					
				HttpSession session  = request.getSession();
				members key = (members) session.getAttribute("key");
				session.setAttribute("key", key);
					
				hobby input = new hobby();
				input.setId(id);
					
				try {
						
					hobbyService.deleteHobby(input);
						
				} catch (Exception e) {
						
					return webHelper.redirect(null, e.getLocalizedMessage());
						
				}
					
				String redirectUrl = contextPath + "/master/master_hobby_main.do";
					
				return webHelper.redirect(redirectUrl, "취미가 삭제되었습니다. master hobby delete sucess");
					
		}
		
		// 공지 관리자 페이지로 이동
		//**************************************************************************************************************
		@RequestMapping(value = "/master/master_notice_main.do", method = RequestMethod.GET)
		public ModelAndView master_notice_main(Model model,
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
					
				notice input = new notice();
				input.setN_admin(keyword);
				input.setN_cont(keyword);
				input.setN_subject(keyword);
					
				List<notice> output = null;
				PageData pageData = null;
				
				try {
						
					totalCount = noticeService.getNoticeCountMaster(input);
						
					pageData = new PageData(nowPage, totalCount, listCount, pageCount);
						
					notice.setOffset(pageData.getOffset());
					notice.setListCount(pageData.getListCount());
						
					output = noticeService.getNoticeAllMaster(input);
								
				} catch (Exception e) {
					return webHelper.redirect(null, e.getLocalizedMessage());
				}
					
				model.addAttribute("keyword",keyword);
				model.addAttribute("pageData",pageData);
				model.addAttribute("output_notice_main",output);
				
				return new ModelAndView("/master/master_notice_main");
				}			
		
		
		@RequestMapping(value = "/master/master_notice_plus.do", method = RequestMethod.GET)
		public ModelAndView master_notice_plus(Model model,
				
				HttpServletRequest request
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			return new ModelAndView("/master/master_notice_plus");
			
		}		
		
		@RequestMapping(value = "/master/master_notice_plus_ok.do", method = RequestMethod.POST)
		public ModelAndView master_notice_plus_ok(Model model,
				@RequestParam(value = "n_subject" , required = false) String n_subject,
				@RequestParam(value = "n_cont" , required = false) String n_cont,
				@RequestParam(value = "n_admin" , required = false) String n_admin,
				HttpServletRequest request
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			if(n_subject.equals("")) 				{ return webHelper.redirect(null, "공지 제목을 입력하세요. notice sub"); }
			if(n_cont.equals("")) 				{ return webHelper.redirect(null, "공지 내용을 입력하세요. notice cont"); }
			if(n_admin.equals("")) 				{ return webHelper.redirect(null, "공지 작성자를 입력하세요. notice admin"); }
			
			notice input = new notice();
			input.setN_admin(n_admin);
			input.setN_cont(n_cont);
			input.setN_subject(n_subject);
			
			notice input_key = new notice();
			
			notice output = null;
			
			try {
				
				noticeService.addNotice(input);
				
				input_key.setId(input.getId());
				
				output = noticeService.getNoticeItem(input_key);
							
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			session.setAttribute("notice_key", output);
			
			String redirectUrl = contextPath + "/master/master_notice_see.do";
			
			return webHelper.redirect(redirectUrl, "공지가 추가 되었습니다. notice add sucess");
			
		}
		
		@RequestMapping(value = "/master/master_notice_see.do", method = RequestMethod.GET)
		public ModelAndView master_notice_see(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				HttpServletRequest request
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			notice notice_key = (notice) session.getAttribute("notice_key");
			
			notice input = new notice();
			
			if(notice_key != null) {
				input.setId(notice_key.getId());
			}else {
				input.setId(id);
			}
			
			notice output_notice_detail = null;
			
			try {
				
				output_notice_detail = noticeService.getNoticeItem(input);
							
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			session.removeAttribute("notice_key");
			
			model.addAttribute("output_notice_detail",output_notice_detail);
			
			return new ModelAndView("/master/master_notice_see");
			
		}		

		@RequestMapping(value = "/master/master_notice_update.do", method = RequestMethod.GET)
		public ModelAndView master_notice_update(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				HttpServletRequest request
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			if(id == 0) { return webHelper.redirect(null, "공지번호가 없습니다. no notice key"); }
			
			notice input = new notice();
			input.setId(id);
			
			notice output_notice_update = null;
			
			try {
				
				output_notice_update = noticeService.getNoticeItem(input);
							
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			model.addAttribute("output_notice_update",output_notice_update);
			
			return new ModelAndView("/master/master_notice_update");
			
		}		
		@RequestMapping(value = "/master/master_notice_update_ok.do", method = RequestMethod.POST)
		public ModelAndView master_notice_update_ok(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				@RequestParam(value = "n_subject" , required = false) String n_subject,
				@RequestParam(value = "n_cont" , required = false) String n_cont,
				@RequestParam(value = "n_admin" , required = false) String n_admin,
				HttpServletRequest request
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			if(id == 0) { return webHelper.redirect(null, "공지번호가 없습니다. no notice key"); }
			if(n_subject.equals("")) 				{ return webHelper.redirect(null, "공지 제목을 입력하세요. notice sub"); }
			if(n_cont.equals("")) 				{ return webHelper.redirect(null, "공지 내용을 입력하세요. notice cont"); }
			if(n_admin.equals("")) 				{ return webHelper.redirect(null, "공지 작성자를 입력하세요. notice admin"); }
			
			notice input = new notice();
			input.setId(id);
			input.setN_admin(n_admin);
			input.setN_cont(n_cont);
			input.setN_subject(n_subject);
			
			notice input_A = new notice();
			input_A.setId(id);
			
			notice output = null;
			
			try {
				
				noticeService.editNotice(input);
				
				output = noticeService.getNoticeItem(input_A);
							
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			session.setAttribute("notice_key", output);
			
			String redirectUrl = contextPath + "/master/master_notice_see.do";
			
			return webHelper.redirect(redirectUrl, "공지가 수정 되었습니다. notice update sucess");
			
		}		
		
		@RequestMapping(value = "/master/master_notice_delete.do", method = RequestMethod.GET)
		public ModelAndView master_notice_delete(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				HttpServletRequest request
				) {
					
				if(id == 0) { return webHelper.redirect(null, "공지번호가 없습니다. no notice key"); }
					
				HttpSession session  = request.getSession();
				members key = (members) session.getAttribute("key");
				session.setAttribute("key", key);
					
				notice input = new notice();
				input.setId(id);
					
				try {
						
					noticeService.deleteNotice(input);
						
				} catch (Exception e) {
						
					return webHelper.redirect(null, e.getLocalizedMessage());
						
				}
					
				String redirectUrl = contextPath + "/master/master_notice_main.do";
					
				return webHelper.redirect(redirectUrl, "공지가 삭제되었습니다. master notice delete sucess");
					
		}		
		
		// 문의 페이지 
		//**************************************************************************************************************
		@RequestMapping(value = "/master/master_qna_main.do", method = RequestMethod.GET)
		public ModelAndView master_qna_main(Model model,
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
					
			qna input = new qna();
			input.setQ_subject(keyword);
			input.setQ_cont(keyword);
			input.setQ_m_id(keyword);
			input.setQ_answer(keyword);
			input.setQ_a_id(keyword);
			
			List<qna> output = null;
			PageData pageData = null;
				
			try {
					
				totalCount = qnaService.getQNACountMaster(input);
						
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
						
				qna.setOffset(pageData.getOffset());
				qna.setListCount(pageData.getListCount());
						
				output = qnaService.getQNAAllMaster(input);
								
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
					
			model.addAttribute("keyword",keyword);
			model.addAttribute("pageData",pageData);
			model.addAttribute("output_qna_main",output);
				
			return new ModelAndView("/master/master_qna_main");
		}				

		@RequestMapping(value = "/master/master_qna_see.do", method = RequestMethod.GET)
		public ModelAndView master_qna_see(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				HttpServletRequest request
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			qna qna_key = (qna) session.getAttribute("qna_key");
			
			qna input = new qna();
			
			if(qna_key != null) {
				input.setId(qna_key.getId());
			}else {
				input.setId(id);
			}
			
			qna output_qna_detail = null;
			
			try {
				
				output_qna_detail = qnaService.getQNAItem(input);
							
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			session.removeAttribute("qna_key");
			
			model.addAttribute("output_qna_detail",output_qna_detail);
			
			return new ModelAndView("/master/master_qna_see");
			
		}		

		@RequestMapping(value = "/master/master_qna_update.do", method = RequestMethod.GET)
		public ModelAndView master_qna_update(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				HttpServletRequest request
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			if(id == 0) { return webHelper.redirect(null, "문의번호가 없습니다. no qna key"); }
			
			qna input = new qna();
			input.setId(id);
			
			qna output_qna_update = null;
			
			try {
				
				output_qna_update = qnaService.getQNAItem(input);
							
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			model.addAttribute("output_qna_update",output_qna_update);
			
			return new ModelAndView("/master/master_qna_update");
			
		}
		
		@RequestMapping(value = "/master/master_qna_answer.do", method = RequestMethod.GET)
		public ModelAndView master_qna_answer(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				HttpServletRequest request
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			if(id == 0) { return webHelper.redirect(null, "문의번호가 없습니다. no qna key"); }
			
			qna input = new qna();
			input.setId(id);
			
			qna output_qna_update = null;
			
			try {
				
				output_qna_update = qnaService.getQNAItem(input);
							
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			model.addAttribute("output_qna_update",output_qna_update);
			
			return new ModelAndView("/master/master_qna_answer");
			
		}
		
		@RequestMapping(value = "/master/master_qna_update_ok.do", method = RequestMethod.POST)
		public ModelAndView master_qna_update_ok(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				@RequestParam(value = "q_subject" , required = false) String q_subject,
				@RequestParam(value = "q_cont" , required = false) String q_cont,
				@RequestParam(value = "q_m_id" , required = false) String q_m_id,
				@RequestParam(value = "q_answer" , required = false) String q_answer,
				@RequestParam(value = "q_a_id" , required = false) String q_a_id,
				@RequestParam(value = "q_m_num" , defaultValue =  "0") int q_m_num,
				HttpServletRequest request
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			if(id == 0) { return webHelper.redirect(null, "공지번호가 없습니다. no notice key"); }
			if(q_subject.equals("")) 				{ return webHelper.redirect(null, "문의 제목을 입력하세요. qna sub"); }
			if(q_cont.equals("")) 				{ return webHelper.redirect(null, "문의 내용을 입력하세요. qna cont"); }
			if(q_m_id.equals("")) 				{ return webHelper.redirect(null, "문의자를 입력하세요. qna m_id"); }
			if(q_a_id.equals("")) 				{ return webHelper.redirect(null, "문의답변 작성자를 입력하세요. qna a_id"); }
			if(q_m_num == 0 ) 				{ return webHelper.redirect(null, "문의답변 작성자의 id값이 없습니다. qna q_m_num"); }
			
			String input_q_answer = "";
			
			if(q_answer.equals("")) {
				input_q_answer = "NULL";
			}
			
			qna input = new qna();
			input.setId(id);
			input.setQ_subject(q_subject);
			input.setQ_cont(q_cont);
			input.setQ_answer(input_q_answer);
			input.setQ_a_id(q_a_id);
			input.setQ_m_id(q_m_id);
			input.setQ_m_num(q_m_num);
			
			qna input_output_key_update = new qna();
			input_output_key_update.setId(id);
			
			qna output = null;
			
			try {
				
				qnaService.editQNA(input);
				
				output = qnaService.getQNAItem(input_output_key_update);
							
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			session.setAttribute("qna_key", output);
			
			String redirectUrl = contextPath + "/master/master_qna_see.do";
			
			return webHelper.redirect(redirectUrl, "문의 수정을 완료했습니다. qna update sucess");
			
		}	
		
		@RequestMapping(value = "/master/master_qna_answer_ok.do", method = RequestMethod.POST)
		public ModelAndView master_qna_answer_ok(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				@RequestParam(value = "q_subject" , required = false) String q_subject,
				@RequestParam(value = "q_cont" , required = false) String q_cont,
				@RequestParam(value = "q_m_id" , required = false) String q_m_id,
				@RequestParam(value = "q_answer" , required = false) String q_answer,
				@RequestParam(value = "q_a_id" , required = false) String q_a_id,
				@RequestParam(value = "q_m_num" , defaultValue =  "0") int q_m_num,
				HttpServletRequest request
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			if(id == 0) { return webHelper.redirect(null, "공지번호가 없습니다. no notice key"); }
			if(q_subject.equals("")) 				{ return webHelper.redirect(null, "문의 제목을 입력하세요. qna sub"); }
			if(q_cont.equals("")) 				{ return webHelper.redirect(null, "문의 내용을 입력하세요. qna cont"); }
			if(q_m_id.equals("")) 				{ return webHelper.redirect(null, "문의자를 입력하세요. qna m_id"); }
			if(q_a_id.equals("")) 				{ return webHelper.redirect(null, "문의답변 작성자를 입력하세요. qna a_id"); }
			if(q_answer.equals("")) 				{ return webHelper.redirect(null, "답변 내용을 입력하세요. qna answer"); }
			if(q_m_num == 0 ) 				{ return webHelper.redirect(null, "문의답변 작성자의 id값이 없습니다. qna q_m_num"); }
			
			qna input = new qna();
			input.setId(id);
			input.setQ_subject(q_subject);
			input.setQ_cont(q_cont);
			input.setQ_answer_ch("Y");
			input.setQ_answer(q_answer);
			input.setQ_a_id(q_a_id);
			input.setQ_m_id(q_m_id);
			input.setQ_m_num(q_m_num);
			
			qna input_key = new qna();
			input_key.setId(id);
			
			qna output = null;
			
			try {
				
				qnaService.editQNA(input);
				
				output = qnaService.getQNAItem(input_key);
							
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			session.setAttribute("qna_key", output);
			
			String redirectUrl = contextPath + "/master/master_qna_see.do";
			
			return webHelper.redirect(redirectUrl, "문의 답변을 작성했습니다. qna answer sucess");
			
		}
		
		@RequestMapping(value = "/master/master_qna_delete.do", method = RequestMethod.GET)
		public ModelAndView master_qna_delete(Model model,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				HttpServletRequest request
				) {
					
				if(id == 0) { return webHelper.redirect(null, "문의번호가 없습니다. no notice key"); }
					
				HttpSession session  = request.getSession();
				members key = (members) session.getAttribute("key");
				session.setAttribute("key", key);
					
				qna input = new qna();
				input.setId(id);
					
				try {
						
					qnaService.deleteQNA(input);
						
				} catch (Exception e) {
						
					return webHelper.redirect(null, e.getLocalizedMessage());
						
				}
					
				String redirectUrl = contextPath + "/master/master_qna_main.do";
					
				return webHelper.redirect(redirectUrl, "문의가 삭제되었습니다. master qna delete sucess");
					
		}
}
