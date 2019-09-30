package cn.manageUser.service.impl;

import cn.manageUser.dao.UserDao;
import cn.manageUser.pojo.User;
import cn.manageUser.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao dao;

    @Override
    public int regist(User user) {
        return dao.regist(user);
    }

    @Override
    public User login(User user) {
        return dao.login(user);
    }
}
