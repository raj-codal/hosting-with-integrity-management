<%@page import="java.io.File"%>
<%@page import="java.lang.String"%>
<%@page import="foxy_server_manager.*"%>
<%@page import="java.util.*"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%
  session = request.getSession();
  if(session.getAttribute("user") != null){
      response.sendRedirect("index.jsp");
  }
  else{

        Scanner in = new Scanner(request.getInputStream());
        Database db = new Database();
        db.connect();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("pswd");
        String cpassword = request.getParameter("cpswd");
        if(!password.equals(cpassword)){
              session.setAttribute("regvar", "password does not match with confirm password!");
              return;
        }
      //  String name = in.nextLine();
        int r = db.registerUser(name, email, password);
        out.println("name:"+name);
        out.println("email:"+email);
        out.println("password:"+password);
        if(r == 1){
              String filePath = ServerFiles.upload_folder+name+"\\A\\";
              File temp = new File(filePath);
              if(!temp.exists()){
                  temp.mkdirs();
              }
              filePath = ServerFiles.upload_folder+name+"\\B\\";
              temp = new File(filePath);
              if(!temp.exists()){
                  temp.mkdirs();
              }
              filePath = ServerFiles.upload_folder+name+"\\C\\";
              temp = new File(filePath);
              if(!temp.exists()){
                  temp.mkdirs();
              }
//              out.println("registered Successfully"); 
              session.setAttribute("regvar", "registered");
        }
        else {
//            out.println("ID not Available");
            session.setAttribute("regvar","ID not Available");
        }
}       

response.sendRedirect("signup.jsp");

%>
