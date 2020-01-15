package bbs.form;

import bbs.entity.Users;
import lombok.Data;

@Data
public class SearchUsersForm extends Users {
	private String createdDate;
}