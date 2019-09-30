package cn.manageUser.service.impl;

import cn.manageUser.dao.AdminDao;
import cn.manageUser.pojo.Admin;
import cn.manageUser.pojo.User;
import cn.manageUser.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao dao;

    @Override
    public Admin login(Admin admin) {
        return dao.login(admin);
    }

    @Override
    public User findUserByName(String uname) {
        return dao.findUserByName(uname);
    }

    @Override
    public List<User> findAllUser(User user) {
        return dao.findAllUser(user);
    }

    @Override
    public User findById(int uid) {
        return dao.findById(uid);
    }

    @Override
    public int updateUser(User user) {
        return dao.updateUser(user);
    }

    @Override
    public int deleteUser(int uid) {
        return dao.deleteUser(uid);
    }

    @Override
    public void delselect(String[] uids) {
        for (String uid : uids) {
            dao.deleteUser(Integer.parseInt(uid));
        }
    }
}
