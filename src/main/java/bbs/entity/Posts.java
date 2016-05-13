package bbs.entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Posts {

	private int id;
	private String title;
	private String text;
	private String category;
	private int branchId;
	private int departmentId;
	private int userId;
	private String userName;
	private Date createdDate;
	private Date updatedDate;
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日 E曜日 HH:mm:ss");
	private List<Comments> comments;

	public String getCreatedDateString(){
		return dateFormat.format(createdDate);
	}
	public String getUpdatedDateString(){
		return dateFormat.format(updatedDate);
	}
}
