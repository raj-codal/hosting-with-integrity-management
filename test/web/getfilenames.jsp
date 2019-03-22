<%@page import="foxy_server_manager.ServerFiles"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%
  String user = "user1";
  ServerFiles files = new ServerFiles();
  String f[] = files.getFileNames(ServerFiles.upload_folder+user+"\\");
  for(String obj : f){
      out.print(obj+",");
  }
%>
