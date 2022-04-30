package study.spring.findhobby.model;

import lombok.Data;

@Data
public class hobby {

	private int id;
	private String h_name;
	private String h_image_a;
	private String h_image_b;
	private String h_option;
	private String h_cont;
	private String h_joindate;
	private String h_modifydate;
	private int h_count;
	
	//페이지번호
	private static int offset;
	private static int listCount;
			
	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		hobby.listCount = listCount;
	}

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		hobby.offset = offset;
	}
}
