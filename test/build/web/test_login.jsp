<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession();
    System.out.println("--------------login.jsp------------------");
    String name = "raj";
    String password = "raj";
    Enumeration x = request.getParameterNames();
    while(x.hasMoreElements()){
        Object temp = x.nextElement();
        System.out.println(">>"+temp+">>"+session.getAttribute(temp.toString()));
    }
//    System.out.println("<>--<>"+session.getAttribute("name"));
    if(session.getAttribute("name") == null){
        if(request.getParameter("ok") == null){
            System.out.println("NOT SUBMITTED");
        }
        else {
            if(request.getParameter("uname").equals(name)){
                if(request.getParameter("pswd").equals(password)){
                    session.setAttribute("name", name);
                    response.sendRedirect("index.jsp");
                }
            }
//            else session.setAttribute("name", null);
        }
    }
    else{
        response.sendRedirect("index.jsp");
    }
%>
<!--
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login.jsp" method="post">
            <input type="text" name="name" id="name" placeholder="name"/>
            <input type="password" name="password" id="password" placeholder="password"/>
            <input type="submit" name="submit" id="submit" value="login"/>
        </form>
    </body>
</html>-->
