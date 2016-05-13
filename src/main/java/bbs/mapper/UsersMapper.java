package bbs.mapper;

import bbs.entity.Users;
import bbs.form.LoginForm;

public interface UsersMapper {
    Users loginBBS(LoginForm form);
}