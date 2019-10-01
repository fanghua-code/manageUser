package cn.manageUser.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        String uri = request.getRequestURI();
        if (uri.contains("/user/uLogin")) {
            return true;
        }else {
            Object user = request.getSession().getAttribute("user");
            if (user != null) {
                return true;
            }else {
                response.sendRedirect(request.getContextPath()+"/user/login");
            }
        }
        return false;
    }
}
