package bbs.mapper;

import java.util.HashMap;
import java.util.List;

import bbs.dto.UsersDto;
import bbs.entity.Users;
import bbs.form.LoginForm;
import bbs.form.SearchUsersForm;

public interface UsersMapper {
    Users loginBBS(LoginForm form);
    List<Users> getUsers(SearchUsersForm form);
    List<HashMap> getBranches();
    List<HashMap> getDepartments();
    void addUser(UsersDto post);
    void deleteUser(UsersDto post);
    void editUser(UsersDto post);
}