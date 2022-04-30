package study.spring.findhobby.service;

import java.util.List;

import study.spring.findhobby.model.qna;


public interface QNAService {
	
	public qna getQNAItem(qna input) throws Exception;
	
	public List<qna> getQNAAll(qna input) throws Exception;

	public int getQNACount(qna input) throws Exception;

	public int addQNA(qna input) throws Exception;

	public int editQNA(qna input) throws Exception;

	public int deleteQNA(qna input) throws Exception;
	
	//문의사항 페이지 거꾸로
	public List<qna> getQNAAllDESC(qna input) throws Exception;
	
	//관리자 페이지
	public List<qna> getQNAAllMaster(qna input) throws Exception;

	public int getQNACountMaster(qna input) throws Exception;
	
}
