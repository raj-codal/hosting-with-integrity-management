
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
    out.println("<br>name:"+email);
    out.println("<br>pswd:"+pswd);
    String dbres = Database.login(email, pswd);
    if(dbres.equals("Invalid password")){
        out.println("INVALID PASSWORD."); 
    }
    else if(dbres.equals("Not a registered user")){
        out.println("INVALID EMAIL."); 
    }
    else{
        session.setAttribute("user", dbres);
        response.sendRedirect("index.jsp");
    }
    
%>