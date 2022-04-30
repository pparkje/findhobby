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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.findhobby.helper.RegexHelper;
import study.spring.findhobby.helper.WebHelper;
import study.spring.findhobby.model.hobby;
import study.spring.findhobby.model.members;
import study.spring.findhobby.model.notice;
import study.spring.findhobby.model.qna;
import study.spring.findhobby.service.HobbyService;
import study.spring.findhobby.service.MembersService;
import study.spring.findhobby.service.NoticeService;
import study.spring.findhobby.service.QNAService;
import study.spring.findhobby.helper.PageData;





@Controller
public class NoticeCompanyController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	HobbyService hobbyService;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	QNAService qnaService;
	
	@Autowired
	MembersService membersService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	//회사개요
	@RequestMapping(value = "/noticecompany.do", method = RequestMethod.GET)
	public ModelAndView noticecompany(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		return new ModelAndView("noticecompany");
	}
	
	
	//이용안내
	@RequestMapping(value = "/usefindhobby.do", method = RequestMethod.GET)
	public ModelAndView usefindhobby(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		return new ModelAndView("usefindhobby");
	}
	
	//고객센터
	@RequestMapping(value = "/usercenter.do", method = RequestMethod.GET)
	public ModelAndView usercenter(Model model,
			HttpServletRequest request
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		notice input_A = new notice();
		qna input_B = new qna();
		
		List<notice> output_A = null;
		List<qna> output_B = null;
		
		try {
			
			output_A = noticeService.getNoticeAll(input_A);
			output_B = qnaService.getQNAAll(input_B);
					
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output_A",output_A);
		model.addAttribute("output_B",output_B);
		
		
		return new ModelAndView("usercenter");
	}
	
	//공지사항
	@RequestMapping(value = "/usercenter_detail.do", method = RequestMethod.GET)
	public ModelAndView usercenter_detail(Model model, HttpServletRequest request,
			@RequestParam(value="keyword" ,required = false) String keyword,
			@RequestParam(value="page" ,defaultValue = "1") int nowPage
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		int totalCount = 0;
		int listCount = 6;
		int pageCount = 5;
		
		notice input = new notice();
		input.setN_cont(keyword);
		
		List<notice> output_notice_detail = null;
		PageData pageData = null;
		
		try {
			
			totalCount = noticeService.getNoticeCount(input);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			notice.setOffset(pageData.getOffset());
			notice.setListCount(pageData.getListCount());
			
			output_notice_detail = noticeService.getNoticeAllDESC(input);
					
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("keyword",keyword);
		model.addAttribute("pageData",pageData);
		model.addAttribute("output_notice_detail",output_notice_detail);
		
		
		return new ModelAndView("usercenter_detail");
	}
	
	//공지사항 세부
	@RequestMapping(value = "/usercenter_detail_detail.do", method = RequestMethod.GET)
	public ModelAndView usercenter_detail_detail(Model model, HttpServletRequest request,
			@RequestParam(value = "id" , defaultValue =  "0") int id
			) {
		
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		if(id == 0) {
			return webHelper.redirect(null, "관리자에게 문의 하세요.");
		}
		
		notice input = new notice();
		input.setId(id);
		
		notice output_notice_detail_detail = null;
		
		try {
			
			output_notice_detail_detail = noticeService.getNoticeItem(input);
					
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output_notice_detail_detail",output_notice_detail_detail);
		
		
		return new ModelAndView("usercenter_detail_detail");
	}
	
	// 문의사항 페이지
	@RequestMapping(value = "/usercenter_detail_qna.do", method = RequestMethod.GET)
	public ModelAndView usercenter_detail_qna(Model model, HttpServletRequest request,
			@RequestParam(value="keyword" ,required = false) String keyword,
			@RequestParam(value="page" ,defaultValue = "1") int nowPage
			) {
			
		HttpSession session  = request.getSession();
		members key = (members) session.getAttribute("key");
		session.setAttribute("key", key);
		
		int totalCount = 0;
		int listCount = 6;
		int pageCount = 5;
		
		qna input = new qna();
		input.setQ_cont(keyword);
		
		List<qna> output_qna = null;
		PageData pageData = null;
			
		try {
				
			totalCount = qnaService.getQNACount(input);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			qna.setOffset(pageData.getOffset());
			qna.setListCount(pageData.getListCount());
			
			output_qna = qnaService.getQNAAllDESC(input);
					
			} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			model.addAttribute("keyword",keyword);
			model.addAttribute("pageData",pageData);
			model.addAttribute("output_qna",output_qna);
			
			
			return new ModelAndView("usercenter_detail_qna");
		}
	
	//문의사항 세부
		@RequestMapping(value = "/usercenter_detail_detail_qna.do", method = RequestMethod.GET)
		public ModelAndView usercenter_detail_detail_qna(Model model, HttpServletRequest request,
				@RequestParam(value = "id" , defaultValue =  "0") int id
				) {
			
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			session.setAttribute("key", key);
			
			if(id == 0) {
				return webHelper.redirect(null, "관리자에게 문의 하세요.");
			}
			
			qna input = new qna();
			input.setId(id);
			
			qna output_qna_detail_detail = null;
			
			String output_check = "";
			
			try {
				
				output_qna_detail_detail = qnaService.getQNAItem(input);
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			model.addAttribute("output_qna_detail_detail",output_qna_detail_detail);
			
			return new ModelAndView("usercenter_detail_detail_qna");
		}
	
		
	// 1:1 문의 로그인 페이지로 이동
	@RequestMapping(value = "/qna_login.do", method = RequestMethod.GET)
	public ModelAndView qna_login(Model model, HttpServletRequest request
			) {
					
			String redirectUrl = contextPath + "/qna_login_ok.do";
			
			return webHelper.redirect(redirectUrl, "로그인이 필요한 컨텐츠입니다. 로그인 페이지로 이동합니다. login please");
	}
	
	// 1:1 문의 로그인 페이지로 이동
	@RequestMapping(value = "/qna_login_ok.do", method = RequestMethod.GET)
	public ModelAndView qna_login_ok(Model model, HttpServletRequest request
			) {
						
			model.addAttribute("qna","qna");
			
			return new ModelAndView("login");
	}
	
	// 1:1 문의 로그인 페이지로 이동
	@RequestMapping(value = "/usercenter_question.do", method = RequestMethod.GET)
	public ModelAndView usercenter_question(Model model, HttpServletRequest request
			) {
						
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			int A = key.getId();
			
			if(A == 0) {
				return webHelper.redirect(null, "개발자에게 문의하세요. AHAH coming");
			}
			
			members input = new members();
			input.setId(A);
			
			members output_members_something = null;
			
			try {
				
				output_members_something = membersService.getMembersItem(input);
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			
			model.addAttribute("output_members_something",output_members_something);
			session.setAttribute("key", key);
			
			return new ModelAndView("usercenter_question");
	}
	
	// 1:1 문의 로그인 페이지로 이동
	@RequestMapping(value = "/usercenter_question_ok.do", method = RequestMethod.POST)
	public ModelAndView usercenter_question_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "q_m_num" , defaultValue =  "0") int q_m_num,
			@RequestParam(value="q_m_id" ,required = false) String q_m_id,
			@RequestParam(value="q_subject" ,required = false) String q_subject,
			@RequestParam(value="q_cont" ,required = false) String q_cont
			) {
							
			HttpSession session  = request.getSession();
			members key = (members) session.getAttribute("key");
			int A = key.getId();
			
			if(A == 0) {
				return webHelper.redirect(null, "개발자에게 문의하세요. AHAH coming");
			}
			
			if(q_m_num == 0) {
				return webHelper.redirect(null, "개발자에게 문의하세요. member id no");
			}
			
			if(q_m_id == null) {
				return webHelper.redirect(null, "개발자에게 문의하세요. member mid no");
			}
			
			if(q_subject == null) {
				return webHelper.redirect(null, "개발자에게 문의하세요. qna sub no");
			}
			
			if(q_cont == null) {
				return webHelper.redirect(null, "개발자에게 문의하세요. qna cont no");
			}
			
			
			qna input = new qna();
			input.setQ_cont(q_cont);
			input.setQ_m_id(q_m_id);
			input.setQ_m_num(q_m_num);
			input.setQ_subject(q_subject);
				
			try {
					
				 qnaService.addQNA(input);
					
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
				
				
			session.setAttribute("key", key);
			
			String redirectUrl = contextPath + "/usercenter_detail_qna.do";
			
			return webHelper.redirect(redirectUrl, "문의사항이 접수 되었습니다. qna complete");
			
			
	}
	
	
	
	
	
	
	
	
	
}
