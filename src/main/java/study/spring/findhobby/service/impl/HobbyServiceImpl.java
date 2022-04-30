package study.spring.findhobby.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.findhobby.model.hobby;
import study.spring.findhobby.service.HobbyService;

@Slf4j
@Service
public class HobbyServiceImpl implements HobbyService{
	
	

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public hobby getHobbyItem(hobby input) throws Exception {
		hobby result = null;
		
		try {
			result = sqlSession.selectOne("HobbyMapper.selectItem", input);
			
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
	public List<hobby> getHobbyAll(hobby input) throws Exception {
		List<hobby> result = null;
		
		try {
			result = sqlSession.selectList("HobbyMapper.selectList" , input);
			
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
	public int getHobbyCount(hobby input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("HobbyMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int addHobby(hobby input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("HobbyMapper.insertItem", input);

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
	public int editHobby(hobby input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("HobbyMapper.updateItem", input);

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
	public int deleteHobby(hobby input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("HobbyMapper.deleteItem", input);

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
	
	// 인기취미 부분
	@Override
	public List<hobby> getPopulHobbyAll() throws Exception {
		
		List<hobby> result = null;
		
		try {
			result = sqlSession.selectList("HobbyMapper.selectList_populhobby");
			
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
		
	// 취미상세 페이지 => 비슷한 취미검색 부분
	@Override
	public List<hobby> getHobbyAllSimilar(hobby input) throws Exception {
		
		List<hobby> result = null;
		
		try {
			result = sqlSession.selectList("HobbyMapper.selectList_similar_hobby" , input);
			
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
	// 취미 검색 페이지
	@Override
	public List<hobby> getHobbyAllFindDetail(hobby input) throws Exception {
		
		List<hobby> result = null;
			
		try {
			result = sqlSession.selectList("HobbyMapper.selectList_find_detail" , input);
			
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
		
	// 조회수 처리
	@Override
	public int editHobbyCount(hobby input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("HobbyMapper.updateItem_count", input);

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
	public List<hobby> getHobbyAllMaster(hobby input) throws Exception {
		List<hobby> result = null;
		
		try {
			result = sqlSession.selectList("HobbyMapper.selectList_master" , input);
			
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
	public int getHobbyCountMaster(hobby input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("HobbyMapper.selectCountAll_master", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
		
}
