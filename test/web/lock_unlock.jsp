<%@page import="java.io.InputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
<%@page import="foxy_server_manager.*"%>
<%@page contentType="APPLICATION/JSON" pageEncoding="UTF-8"%>

<%
    session = request.getSession();

    if(session.getAttribute("user")==null){
        response.sendError(402);
    }
    
    
    String user = session.getAttribute("user").toString().trim();
    InputStream inStream = request.getInputStream();
    Scanner in = new Scanner(inStream);
    String flag = in.nextLine().trim();
    String filepath = ServerFiles.upload_folder + user + "\\A\\";
    File folder = new File(filepath);
    if (flag.equals("LOCK")) {
        String files[] = folder.list();
        for (String x : files) {
            if (!x.contains("hash")) {
                if (var.possible(x,user)) {
                    new R3Sa(x,user);
                } else {
                    System.out.println("Aint gonna make it! for" + x);
                }
            }
        }
    }
    if (flag.equals("LOCK")) {
//        FLAG.under_watch = true;
        FLAG.under_watch.put(user, true);
        System.out.println("SYSTEM STARTED FOR "+user);
        out.println("UNLOCK");
    } else if (flag.equals("UNLOCK")) {
//        FLAG.under_watch = false;
        FLAG.under_watch.put(user, false);
//        File rdx = new File(ServerFiles.upload_folder + user + "\\B\\");
//        rdx.delete();
//        rdx = new File(ServerFiles.upload_folder + user + "\\C\\");
//        rdx.delete();
        System.out.println(user+"'s SYSTEM ON HALT");
        out.println("LOCK");
    }

%> 