package cn.manageUser.controller;

import cn.manageUser.pojo.Admin;
import cn.manageUser.pojo.User;
import cn.manageUser.service.AdminService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService service;

    @RequestMapping("/adLogin")
    public String login(@ModelAttribute Admin admin, HttpServletRequest request, Model model) {
        Admin loginAdmin = service.login(admin);
        if (loginAdmin == null) {
            model.addAttribute("login_msg", "用户名或密码错误！");
            return "admin/login";
        }else {
            request.getSession().setAttribute("admin", admin);
            //获取在线用户列表List集合
            List<User> onlines = (List<User>) request.getServletContext().getAttribute("online");
            request.getSession().setAttribute("onlines", onlines);
            return "redirect:home";
        }
    }

    @RequestMapping("/home")
    public String toHome() { return "admin/home"; }

    @RequestMapping("/login")
    public String toLogin() { return "admin/login"; }

    @RequestMapping("/allUser")
    public String findAllUser(@RequestParam(value = "page", defaultValue = "1") Integer page,
                              @RequestParam(value = "rows", defaultValue = "5") int rows,
                              User user, Model model) {
        PageHelper.startPage(page, rows);
        List<User> allUser = service.findAllUser(user);
        PageInfo<User> pageInfo = new PageInfo<User>(allUser);
        model.addAttribute("allUser", pageInfo);
        return "admin/users";
    }

    @RequestMapping("/update")
    public String findUserById(@RequestParam int uid, Model model) {
        User user = service.findById(uid);
        model.addAttribute("user", user);
        return "admin/update";
    }

    @RequestMapping("/updateUser")
    public String updateUser(User user, Model model) {
        int count = service.updateUser(user);
        if (count == 1){
            return "redirect:allUser";
        }else {
            model.addAttribute("update_msg", "修改内容不能为空！");
            return "redirect:update";
        }
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(@RequestParam int uid) {
        int count = service.deleteUser(uid);
        return "redirect:allUser";
    }

    @RequestMapping("/delselected")
    public String delselected(HttpServletRequest request) {
        String[] uids = request.getParameterValues("uid");
        service.delselect(uids);
        return "redirect:allUser";
    }

    @RequestMapping("/top")
    public String top(){ return "admin/top"; }

    @RequestMapping("/left")
    public String left(){ return "admin/left"; }

    @RequestMapping("/exit")
    public String eixt(HttpServletRequest request){
        request.getSession().removeAttribute("admin");
        return "redirect:login";
    }

    @RequestMapping("/admin")
    public String admin() { return "admin/admin"; }
}
