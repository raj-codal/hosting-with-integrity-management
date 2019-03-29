<%@page import="java.io.File"%>
<%@page import="foxy_server_manager.ServerFiles"%>
<%@page contentType="APPLICATION/JSON" pageEncoding="UTF-8"%>
<%  
  
    session = request.getSession();

    if(session.getAttribute("user")==null){
        response.sendError(402);
    }
      
    
  String user = session.getAttribute("user").toString().trim();
  String filename = request.getParameter("fileName");   
  String filepath = ServerFiles.upload_folder+user+"\\A\\";   
  File file = new File(filepath+filename);
  System.out.println("LOG:"+filepath+filename);
  if(file.exists()){
      if(file.delete()){
          out.println("deleted");
      }
      else{
          out.println("error");
      }
  }
  else{
      out.println("no file");
  }
%> 