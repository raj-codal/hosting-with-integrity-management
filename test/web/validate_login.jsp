
<%@page import="foxy_server_manager.*"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Database.connect();
    
    session = request.getSession();
    String email;
    String pswd;
    email = request.getParameter("uname").trim();
    pswd = request.getParameter("pswd").trim();
    String dbres = Database.login(email, pswd);
    if(dbres.equals("Invalid password")){
        out.println("INVALID PASSWORD."); 
        session.setAttribute("logvar","invalid password");
        response.sendRedirect("login.jsp");
    }
    else if(dbres.equals("Not a registered user")){
        out.println("INVALID EMAIL."); 
        session.setAttribute("logvar","invalid email");
        response.sendRedirect("login.jsp");
    }
    else{
        session.setAttribute("user", dbres);
        String ids=Database.getId(email);
//        int id = Integer.parseInt(ids);
        session.setAttribute("userId", ids);
        response.sendRedirect("index.jsp");
        System.out.println("LOGGED IN");
        out.println("LOGGED IN");
    }
    
%>