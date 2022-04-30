package study.spring.findhobby.service;

import java.util.List;

import study.spring.findhobby.model.interest;


public interface InterestService {
	
	public interest getInterestItem(interest input) throws Exception;
	
	public List<interest> getInterestAll(interest input) throws Exception;

	public int getInterestCount(interest input) throws Exception;

	public int addInterest(interest input) throws Exception;

	public int editInterest(interest input) throws Exception;

	public int deleteInterest(interest input) throws Exception;
	
	//관심 페이지를 위한 조회 
	public List<interest> getInterestAllFavPage(interest input) throws Exception;
	
}
