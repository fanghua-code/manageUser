package cn.manageUser.service;

import cn.manageUser.pojo.User;

public interface UserService {
    public int regist(User user);
    public User login(User user);
}
