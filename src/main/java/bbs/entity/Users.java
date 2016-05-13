package bbs.entity;

import lombok.Data;

@Data
public class Users {
	private int id;
	private String loginId;
	private String password;
	private String confirmationPassword;
	private String name;
	private int branchId;
	private String branchName;
	private int departmentId;
	private String departmentName;
	private int isLocked;
	private String updatedDate;
}