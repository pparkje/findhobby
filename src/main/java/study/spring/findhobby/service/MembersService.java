package study.spring.findhobby.service;

import java.util.List;

import study.spring.findhobby.model.members;



public interface MembersService {
	
	public members getMembersItem(members input) throws Exception;
	
	public List<members> getMembersAll(members input) throws Exception;

	public int getMembersCount(members input) throws Exception;

	public int addMembers(members input) throws Exception;

	public int editMembers(members input) throws Exception;
	
	//회원 탈퇴시 수정으로 교체
	public int editMembers_delete(members input) throws Exception;

	public int deleteMembers(members input) throws Exception;
	
	//비밀번호 변경
	public int editMembers_password(members input) throws Exception;
	public members getMembersItemPassword(members input) throws Exception;
	public int getMembersCountPassword(members input) throws Exception;
	
	//관리자 페이지 회원관리
	public List<members> getMembersAllMaster(members input) throws Exception;
	public int getMembersCountMaster(members input) throws Exception;
	
	//관리자 페이지 회원 정보 수정
	public int editMembersMaster(members input) throws Exception;
	
	// 문의 관리자 페이지 조회
	public members getMembersItemQNAMaster(members input) throws Exception;
}
