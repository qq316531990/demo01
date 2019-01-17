package com.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter  {

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
          System.out.println("进入了doFilter！！！！！");
        HttpServletRequest request=(HttpServletRequest)servletRequest;//如果没有进行转换 那么无法获取session
        HttpServletResponse response=(HttpServletResponse)servletResponse;
        String ip=request.getRemoteAddr();//获取客户端的IP地址;
        String[] str={"/demo01/login.jsp","/demo01/register.jsp","/demo01/user/login",
                "/demo01/user/register","/demo01/user/register","/demo01/second/getTypesForUser"};
        String page=request.getRequestURI();
        System.out.println(page);
        if(page.contains("/js/")||page.contains("/css/")||page.contains("/images/")){
            System.out.println("放行！");
            filterChain.doFilter(request, response);//如果是允许访问的资源  直接放行
            return ;
        }
        for (String string : str) {
            if(string.equals(page)){
                System.out.println("放行！");
                filterChain.doFilter(request, response);//如果是允许访问的资源  直接放行

                return ;
            }
        }

        Object isLogin=request.getSession().getAttribute("adminIsLogin");

        if(isLogin!=null&&"OK".equals(isLogin.toString())){//避免空指针异常
            //登陆成功  可以访问其他任何资源  可以放行
            System.out.println("adminIsLogin"+isLogin.toString());
            filterChain.doFilter(request, response);
            return ;
        }
        else{//如果没有进行登陆   跳转到登陆界面

            response.sendRedirect("/demo01/login.jsp");//如果没有登陆成功 跳转到登陆页面
            return ;
        }

    }

    public void destroy() {

    }
}
