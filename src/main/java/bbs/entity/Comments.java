package bbs.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class Comments {

	private int id;
	private String text;
	private int postId;
	private int branchId;
	private int departmentId;
	private int userId;
	private String userName;
	private Date createdDate;
	private Date updatedDate;
	private SimpleDateFormat dateFormat = new SimpleDateFormat("d/M/y E HH:mm:ss");

	public String getCreatedDateString(){
		return dateFormat.format(createdDate);
	}
	public String getUpdatedDateString(){
		return dateFormat.format(updatedDate);
	}
}
