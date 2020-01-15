package bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bbs.entity.Users;
import bbs.form.LoginForm;
import bbs.form.SearchUsersForm;
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

    public List<String> getBranches() {
        List<String> bra = usersMapper.getBranches();
		bra.add(0, "");
        return bra;
    }

    public List<String> getDepartments() {
        List<String> dep = usersMapper.getDepartments();
		dep.add(0, "");
        return dep;
    }

}