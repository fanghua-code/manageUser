package cn.manageUser.dao;

import cn.manageUser.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserDao {
    public int regist(User user);
    public User login(User user);
}
