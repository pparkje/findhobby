package study.spring.findhobby.model;

import lombok.Data;

@Data
public class qna {

	private int id;
	private String q_subject;
	private String q_cont;
	// 아이디
	private String q_m_id;
	// 아이디번호
	private int q_m_num;
	private String q_answer_ch;
	private String q_answer;
	// 어드민 아이디
	private String q_a_id;
	private String q_joindate;
	private String q_updatedate;
	
	
	//페이지번호
	private static int offset;
	private static int listCount;
	
	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		qna.listCount = listCount;
	}

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		qna.offset = offset;
	}
	
}
