package study.spring.findhobby.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Email {
	public int id;
	public String e_sub;
	public String e_cont;
	public String e_wdate;
	public String e_sdate;
	public String e_men;
	public String e_passcode;
	
	private static int offset;
	private static int listCount;

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Email.listCount = listCount;
	}

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Email.offset = offset;
	}
}
