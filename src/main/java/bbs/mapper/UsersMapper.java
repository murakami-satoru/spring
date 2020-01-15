package bbs.mapper;

import java.util.List;

import bbs.entity.Users;
import bbs.form.LoginForm;
import bbs.form.SearchUsersForm;

public interface UsersMapper {
    Users loginBBS(LoginForm form);
    List<Users> getUsers(SearchUsersForm form);
    List<String> getBranches();
    List<String> getDepartments();
}