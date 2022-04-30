package study.spring.findhobby.service;

import java.util.List;

import study.spring.findhobby.model.notice;


public interface NoticeService {
	
	public notice getNoticeItem(notice input) throws Exception;
	
	public List<notice> getNoticeAll(notice input) throws Exception;

	public int getNoticeCount(notice input) throws Exception;

	public int addNotice(notice input) throws Exception;

	public int editNotice(notice input) throws Exception;

	public int deleteNotice(notice input) throws Exception;
	
	// 최신순 조회
	public List<notice> getNoticeAllDESC(notice input) throws Exception;
	
	// 관리자 페이지
	public List<notice> getNoticeAllMaster(notice input) throws Exception;
	public int getNoticeCountMaster(notice input) throws Exception;
	
}
