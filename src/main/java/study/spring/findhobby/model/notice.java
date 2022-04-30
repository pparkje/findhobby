package study.spring.findhobby.model;

import lombok.Data;

@Data
public class notice {

	private int id;
	private String n_subject;
	private String n_cont;
	private String n_admin;
	private String n_joindate;
	private String n_updatedate;
	
	//페이지번호
	private static int offset;
	private static int listCount;
	
	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		notice.listCount = listCount;
	}

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		notice.offset = offset;
	}
}
