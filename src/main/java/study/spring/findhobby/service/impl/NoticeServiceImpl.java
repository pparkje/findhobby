package study.spring.findhobby.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.findhobby.model.notice;
import study.spring.findhobby.service.NoticeService;

@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService{
	
	

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public notice getNoticeItem(notice input) throws Exception {
		notice result = null;
		
		try {
			result = sqlSession.selectOne("NoticeMapper.selectItem", input);
			
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
	public List<notice> getNoticeAll(notice input) throws Exception {
		List<notice> result = null;
		
		try {
			result = sqlSession.selectList("NoticeMapper.selectList" , input);
			
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
	public int getNoticeCount(notice input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("NoticeMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int addNotice(notice input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("NoticeMapper.insertItem", input);

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
	public int editNotice(notice input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("NoticeMapper.updateItem", input);

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
	public int deleteNotice(notice input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("NoticeMapper.deleteItem", input);

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
	
	@Override
	public List<notice> getNoticeAllDESC(notice input) throws Exception {
		List<notice> result = null;
		
		try {
			result = sqlSession.selectList("NoticeMapper.selectList_detail" , input);
			
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
	public List<notice> getNoticeAllMaster(notice input) throws Exception {
		List<notice> result = null;
		
		try {
			result = sqlSession.selectList("NoticeMapper.selectList_master" , input);
			
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
	public int getNoticeCountMaster(notice input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("NoticeMapper.selectCountAll_master", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

}
