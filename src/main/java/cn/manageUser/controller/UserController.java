package cn.manageUser.controller;

import cn.manageUser.pojo.User;
import cn.manageUser.service.AdminService;
import cn.manageUser.service.UserService;
import cn.manageUser.service.impl.AdminServiceImpl;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService service;
    @Autowired
    private AdminService adService;

    @RequestMapping("/uLogin")
    public String login(HttpServletRequest request, Model model) {
        Map<String, String[]> map = request.getParameterMap();
        User user = new User();
        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        User loginUser = service.login(user);
        if (loginUser == null){
            model.addAttribute("login_msg", "用户名或密码错误！请重试");
            return "user/login";
        }else {
            request.getSession().setAttribute("user", loginUser);
            return "user/home";
        }
    }

    @RequestMapping("/uRegist")
    public String regist(@ModelAttribute("user") @Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()){
            return "user/regist";
        }else {
            int count = service.regist(user);
            if (count == 1){
                return "user/login";
            }else {
                model.addAttribute("regist_msg", "内容不能为空！");
                return "user/regist";
            }
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        String uid = request.getParameter("uid");
        User user = adService.findById(Integer.parseInt(uid));
        ServletContext application = request.getServletContext();
        List<User> onlines = (List<User>) application.getAttribute("online");
        onlines.remove(user);
        application.setAttribute("online", onlines);
        return "redirect:login";
    }

    @RequestMapping("/regist")
    public String toRegist( User user) {
        return "user/regist";
    }

    @RequestMapping("/login")
    public String toLogin() {
        return "user/login";
    }
}
