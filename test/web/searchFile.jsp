<%@page import="foxy_server_manager.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="foxy_server_manager.ServerFiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession();

    if(session.getAttribute("user")==null){
        response.sendError(402);
    }
    
  String user = session.getAttribute("user").toString().trim();
  int id = Integer.parseInt(session.getAttribute("userId").toString());
  ResultSet r = Database.searchFiles(id);
  String query = request.getParameter("query");
  
  
  if(r != null){
      while(r.next()){
          String fileName = r.getString("files");
          if(!fileName.startsWith("hash") && !fileName.endsWith(".hash") && fileName.contains(query)){
            out.print(fileName+",");    
          }
      }
  }
  
//  ServerFiles files = new ServerFiles();
//  String f[] = files.getFileNames(ServerFiles.upload_folder+user+"\\A\\");
//  for(String obj : f){
//      if(!obj.startsWith("hash") && !obj.endsWith(".hash")){
//        out.print(obj+",");    
//      }
//  }
%>
