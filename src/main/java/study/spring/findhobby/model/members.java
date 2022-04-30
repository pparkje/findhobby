package study.spring.findhobby.model;

import lombok.Data;

@Data
public class members {

	private int id;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_username;
	private String m_email;
	private String m_phone;
	private String m_birthday;
	private String m_modifydate;
	private String m_joindate;
	private String m_enddate;
	private String m_end;
	private String m_gender;
	
	//페이지번호
	private static int offset;
	private static int listCount;
		
	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		members.listCount = listCount;
	}

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		members.offset = offset;
	}
}
