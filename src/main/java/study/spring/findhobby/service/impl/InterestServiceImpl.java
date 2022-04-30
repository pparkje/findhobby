package study.spring.findhobby.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.findhobby.model.interest;
import study.spring.findhobby.service.InterestService;

@Slf4j
@Service
public class InterestServiceImpl implements InterestService{
	
	

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public interest getInterestItem(interest input) throws Exception {
		interest result = null;
		
		try {
			result = sqlSession.selectOne("InterestMapper.selectItem", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		
		return result;
		
		
	}

	@Override
	public List<interest> getInterestAll(interest input) throws Exception {
		List<interest> result = null;
		
		try {
			result = sqlSession.selectList("InterestMapper.selectList" , input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		
		return result;
	}
	
	@Override
	public int getInterestCount(interest input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("InterestMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int addInterest(interest input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("InterestMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int editInterest(interest input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("InterestMapper.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int deleteInterest(interest input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("InterestMapper.deleteItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}
	
	
	
	// 관심취미 실패한 부분
	
	  @Override public List<interest> getInterestAllFavPage(interest input) throws
	  Exception { List<interest> result = null;
	  
	  try { result = sqlSession.selectList("InterestMapper.selectList_favpage" ,
	  input);
	  
	  if (result == null) { throw new NullPointerException("result=null"); } }
	  catch(NullPointerException e) { log.error(e.getLocalizedMessage()); throw new
	  Exception("조회된 데이터가 없습니다."); } catch(Exception e) {
	  log.error(e.getLocalizedMessage()); throw new Exception("데이터 조회에 실패했습니다."); }
	  
	  
	  return result; }
	 
	
}
