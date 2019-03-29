<%@page import="java.io.File"%>
<%@page import="java.lang.String"%>
<%@page import="foxy_server_manager.*"%>
<%@page import="java.util.*"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%
  Scanner in = new Scanner(request.getInputStream());
  Database db = new Database();
  db.connect();
  String name = in.nextLine();
  String email = in.nextLine();
  String password = in.nextLine();
//  String name = in.nextLine();
  int r = db.registerUser(name, email, email, password);
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
        out.println("registered Successfully"); 
  }
  else {
      out.println("ID not Available");
  }
%>
