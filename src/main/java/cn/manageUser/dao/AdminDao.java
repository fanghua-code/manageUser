package cn.manageUser.dao;

import cn.manageUser.pojo.Admin;
import cn.manageUser.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AdminDao {
    public Admin login(Admin admin);
    public User findUserByName(String uname);
    public List<User> findAllUser(User user);
    public User findById(int uid);
    public int updateUser(User user);
    public int deleteUser(int uid);
}
