package cn.manageUser.listener;

import cn.manageUser.pojo.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.util.ArrayList;
import java.util.List;

@WebListener()
public class UserListener implements ServletContextListener,
        HttpSessionListener, HttpSessionAttributeListener {
    private ServletContext application = null;

    // Public constructor is required by servlet spec
    public UserListener() {
    }

    // -------------------------------------------------------
    // ServletContextListener implementation
    // -------------------------------------------------------
    public void contextInitialized(ServletContextEvent sce) {
      /* This method is called when the servlet context is
         initialized(when the Web application is deployed). 
         You can initialize servlet context related data here.
      */
        application = sce.getServletContext();
        //将在线用户保存到List集合中
        this.application.setAttribute("online", new ArrayList<User>());
    }

    public void contextDestroyed(ServletContextEvent sce) {
      /* This method is invoked when the Servlet Context 
         (the Web application) is undeployed or 
         Application Server shuts down.
      */
    }

    // -------------------------------------------------------
    // HttpSessionListener implementation
    // -------------------------------------------------------
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
        //获取在线用户列表
        List<User> onlines = (List<User>) this.application.getAttribute("online");
        //获取当前用户
        User loginUser = (User) se.getSession().getAttribute("user");
        //将此用户从列表中删除
        onlines.remove(loginUser);
        //将删除后的List集合设置到application中
        this.application.setAttribute("online", onlines);
    }

    // -------------------------------------------------------
    // HttpSessionAttributeListener implementation
    // -------------------------------------------------------

    public void attributeAdded(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute 
         is added to a session.
      */
      //获取在线用户名单
        List<User> onlines = (List<User>) this.application.getAttribute("online");
        if ("user".equals(sbe.getName())) {
            if (null == onlines){
                onlines = new ArrayList<User>();
            }
            onlines.add((User)sbe.getValue());
        }
        this.application.setAttribute("online", onlines);
    }

    public void attributeRemoved(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute
         is removed from a session.
      */
    }

    public void attributeReplaced(HttpSessionBindingEvent sbe) {
      /* This method is invoked when an attibute
         is replaced in a session.
      */
        //获取在线用户名单
        List<User> onlines = (List<User>) this.application.getAttribute("online");
        if ("user".equals(sbe.getName())) {
            if (null == onlines){
                onlines = new ArrayList<User>();
            }
            onlines.add((User) sbe.getValue());
        }
        this.application.setAttribute("online", onlines);
    }
}
