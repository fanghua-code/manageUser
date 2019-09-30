package cn.manageUser.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        String url = request.getRequestURI();
        if (url.contains("admin/adLogin")) {
            return true;
        }else {
            HttpSession session = request.getSession();
            Object admin = session.getAttribute("admin");
            if (admin == null){
                //未登录
                response.sendRedirect(request.getContextPath()+"/admin/login");
            }else {
                return true;
            }
        }
        return false;
    }
}
