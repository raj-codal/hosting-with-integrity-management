<%@page import="foxy_server_manager.Database"%>
<%@page import="foxy_server_manager.ServerFiles"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<%@page contentType="application/json" pageEncoding="UTF-8"%>


<%
   session = request.getSession();

    if(session.getAttribute("user")==null){
        response.sendError(402);
    }
   int id = Integer.parseInt(session.getAttribute("userId").toString());
    
   File file, temp;
   String user = session.getAttribute("user").toString().trim();
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = ServerFiles.upload_folder+user+"\\A\\";
   temp = new File(filePath);
   if(!temp.exists()){
       temp.mkdirs();
   }
   // Verify the content type
   String contentType = request.getContentType();
   
   Database db = new Database();
   db.connect();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();
         
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               // Write the file
               if( fileName.lastIndexOf("\\") >= 0 ) {
                  file = new File( filePath + 
                  fileName.substring( fileName.lastIndexOf("\\"))) ;
               } else {
                  file = new File( filePath + 
                  fileName.substring(fileName.lastIndexOf("\\")+1)) ;
               }
               fi.write( file ) ;
               db.uploadFile(file.getName(), id);
               out.println("200:"+fileName);
            }
         }
      } catch(Exception ex) {
         System.out.println(ex);
      }
   } else {
      out.println("none");
   }
%>