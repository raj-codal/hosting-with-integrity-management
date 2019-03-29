<%@page import="foxy_server_manager.ServerFiles"%>
<%@page contentType="APPLICATION/OCTET-STREAM" pageEncoding="UTF-8"%>
<%

    session = request.getSession();

    if(session.getAttribute("user")==null){
        response.sendError(402);
    }
     
  
    
  String user = "user1";
  String filename = request.getParameter("fileName");   
  String filepath = ServerFiles.upload_folder+user+"\\";   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  
  int i;   
  while ((i=fileInputStream.read()) != -1) {  
    out.write(i);   
  }   
  fileInputStream.close();   
%> 