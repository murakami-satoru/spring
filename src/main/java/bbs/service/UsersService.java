package bbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bbs.entity.Users;
import bbs.form.LoginForm;
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

}