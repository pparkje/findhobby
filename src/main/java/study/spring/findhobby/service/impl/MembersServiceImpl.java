package study.spring.findhobby.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.findhobby.model.members;
import study.spring.findhobby.service.MembersService;

@Slf4j
@Service
public class MembersServiceImpl implements MembersService{
	
	

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public members getMembersItem(members input) throws Exception {
		members result = null;
		
		try {
			result = sqlSession.selectOne("MembersMapper.selectItem", input);
			
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
	public List<members> getMembersAll(members input) throws Exception {
		List<members> result = null;
		
		try {
			result = sqlSession.selectList("MembersMapper.selectList" , input);
			
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
	public int getMembersCount(members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MembersMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int addMembers(members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("MembersMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다. fail1");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다. fail2");
		}

		return result;
	}

	@Override
	public int editMembers(members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MembersMapper.updateItem", input);

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
	
	//회원 탈퇴시 수정으로 교체
	@Override
	public int editMembers_delete(members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MembersMapper.updateItem_delete", input);

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
	public int deleteMembers(members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("MembersMapper.deleteItem", input);

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
	
	// 비밀번호 변경
	@Override
	public int editMembers_password(members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MembersMapper.updateItem_password", input);

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
	public members getMembersItemPassword(members input) throws Exception {
		members result = null;
		
		try {
			result = sqlSession.selectOne("MembersMapper.selectItem_password", input);
			
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
	public int getMembersCountPassword(members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MembersMapper.selectCountAll_password", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	
	//관리자페이지 회원관리
	@Override
	public List<members> getMembersAllMaster(members input) throws Exception {
		List<members> result = null;
		
		try {
			result = sqlSession.selectList("MembersMapper.selectList_master" , input);
			
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
	public int getMembersCountMaster(members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MembersMapper.selectCountAll_master", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	// 관리자 페이지 수정
	@Override
	public int editMembersMaster(members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MembersMapper.updateItem_master", input);

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
	
	// 문의 관리자 페이지 조회
	@Override
	public members getMembersItemQNAMaster(members input) throws Exception {
		members result = null;
		
		try {
			result = sqlSession.selectOne("MembersMapper.selectItem_qna_master", input);
			
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
}
