package cn.manageUser.controller;

import cn.manageUser.pojo.User;
import cn.manageUser.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/ajax")
public class AjaxController {
    @Autowired
    private AdminService service ;

    @RequestMapping("/userRegist")
    @ResponseBody
    public void userRegistAjax(@RequestBody User user, HttpServletResponse response) throws IOException {
        User registUser = service.findUserByName(user.getUname());
        if (registUser==null){
            //状态码1，表示该用户名不存在
            response.getWriter().print(1);
        }else {
            //状态码0，表示该用户名已存在
            response.getWriter().print(0);
        }
    }
}
