<%@page import="foxy_server_manager.ServerFiles"%>
<%@page contentType="APPLICATION/OCTET-STREAM" pageEncoding="UTF-8"%>
<%

    session = request.getSession();

    if(session.getAttribute("user")==null){
        response.sendError(402);
    }
     
    
  String user = session.getAttribute("user").toString().trim();
  String filename = request.getParameter("fileName");   
  String filepath = ServerFiles.upload_folder+user+"\\A\\";   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  java.io.File x = new java.io.File (filepath + filename);
  if(!x.exists()){
      System.out.println(filepath + filename);
      out.println("file not found");
      return;
  }
  java.io.FileInputStream fileInputStream=new java.io.FileInputStream (filepath + filename);  
  System.out.println("user downloading:" + filename);
  int i;   
  while ((i = fileInputStream.read()) != -1) {  
    out.write(i);   
  }   
  fileInputStream.close();   
%> 