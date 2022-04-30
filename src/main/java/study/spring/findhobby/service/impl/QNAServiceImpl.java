package study.spring.findhobby.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.findhobby.model.qna;
import study.spring.findhobby.service.QNAService;

@Slf4j
@Service
public class QNAServiceImpl implements QNAService{
	
	

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public qna getQNAItem(qna input) throws Exception {
		qna result = null;
		
		try {
			result = sqlSession.selectOne("QNAMapper.selectItem", input);
			
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
	public List<qna> getQNAAll(qna input) throws Exception {
		List<qna> result = null;
		
		try {
			result = sqlSession.selectList("QNAMapper.selectList" , input);
			
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
	public int getQNACount(qna input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("QNAMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int addQNA(qna input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("QNAMapper.insertItem", input);

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
	public int editQNA(qna input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("QNAMapper.updateItem", input);

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
	public int deleteQNA(qna input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("QNAMapper.deleteItem", input);

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
	
	//문의 사항 페이지 거꾸로
	@Override
	public List<qna> getQNAAllDESC(qna input) throws Exception {
		List<qna> result = null;
		
		try {
			result = sqlSession.selectList("QNAMapper.selectList_DESC" , input);
			
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
	
	// 관리자 페이지
	@Override
	public List<qna> getQNAAllMaster(qna input) throws Exception {
		List<qna> result = null;
		
		try {
			result = sqlSession.selectList("QNAMapper.selectList_master" , input);
			
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
	public int getQNACountMaster(qna input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("QNAMapper.selectCountAll_master", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

}
