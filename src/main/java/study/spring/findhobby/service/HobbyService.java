package study.spring.findhobby.service;

import java.util.List;

import study.spring.findhobby.model.hobby;

public interface HobbyService {
	
	public hobby getHobbyItem(hobby input) throws Exception;
	
	public List<hobby> getHobbyAll(hobby input) throws Exception;

	public int getHobbyCount(hobby input) throws Exception;

	public int addHobby(hobby input) throws Exception;

	public int editHobby(hobby input) throws Exception;

	public int deleteHobby(hobby input) throws Exception;
	
	// 인기취미 부분
	public List<hobby> getPopulHobbyAll() throws Exception;
	
	// 취미상세 페이지 => 비슷한 취미검색 부분
	public List<hobby> getHobbyAllSimilar(hobby input) throws Exception;
	
	// 취미 검색 페이지
	public List<hobby> getHobbyAllFindDetail(hobby input) throws Exception;
	
	// 취미 조회수 처리
	public int editHobbyCount(hobby input) throws Exception;
	
	//관리자 페이지 조회
	public List<hobby> getHobbyAllMaster(hobby input) throws Exception;
	public int getHobbyCountMaster(hobby input) throws Exception;
	
}
