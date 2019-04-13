<%@page import="foxy_server_manager.ServerFiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession();

    if(session.getAttribute("user")==null){
        response.sendError(402);
    }
    
  String user = session.getAttribute("user").toString().trim();
  ServerFiles files = new ServerFiles();
  String f[] = files.getFileNames(ServerFiles.upload_folder+user+"\\A\\");
  for(String obj : f){
      if(!obj.startsWith("hash") && !obj.endsWith(".hash")){
        out.print(obj+",");    
      }
  }
%>
