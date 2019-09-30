package cn.manageUser.service;

import cn.manageUser.pojo.Admin;
import cn.manageUser.pojo.User;

import java.util.List;

public interface AdminService {
    public Admin login(Admin admin);
    public User findUserByName(String uname);
    public List<User> findAllUser(User user);
    public User findById(int uid);
    public int updateUser(User user);
    public int deleteUser(int uid);
    public void delselect(String[] uids);
}
