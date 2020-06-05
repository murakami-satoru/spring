package bbs.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bbs.dto.UsersDto;
import bbs.entity.Users;
import bbs.form.LoginForm;
import bbs.form.SearchUsersForm;
import bbs.form.UserForm;
import bbs.mapper.UsersMapper;

@Service
public class UsersService {

    @Autowired
    private UsersMapper usersMapper;

    public Users loginBBS(LoginForm form) {
    	//パスワードの暗号化
    	//String encodedPassword = BBSUtil.encrypt(form.getPassword());
    	form.setPassword(form.getPassword());
        Users entity = usersMapper.loginBBS(form);
        return entity;
    }

    public List<Users> getUsers(SearchUsersForm form) {
        return usersMapper.getUsers(form);
    }

    public List<HashMap> getBranches() {
        return usersMapper.getBranches();
    }

    public List<HashMap> getDepartments() {
        return usersMapper.getDepartments();
    }

    public void addUser(UserForm form) {
    	UsersDto user = new UsersDto();
    	BeanUtils.copyProperties(form, user);
		usersMapper.addUser(user);
    }

    public void deleteUser(UserForm form) {
    	UsersDto user = new UsersDto();
    	BeanUtils.copyProperties(form, user);
    	usersMapper.deleteUser(user);
    }

    public void editUser(UserForm form) {
    	UsersDto user = new UsersDto();
    	BeanUtils.copyProperties(form, user);
    	usersMapper.editUser(user);
    }

}