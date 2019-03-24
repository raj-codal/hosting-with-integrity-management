<%@page import="java.io.InputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
<%@page import="foxy_server_manager.*"%>
<%@page contentType="APPLICATION/JSON" pageEncoding="UTF-8"%>

<%
    String user = "user1";
    InputStream inStream = request.getInputStream();
    Scanner in = new Scanner(inStream);
    String flag = in.nextLine().trim();
    String filepath = ServerFiles.upload_folder + user + "\\A\\";
    File folder = new File(filepath);
    if (flag.equals("START")) {
        String files[] = folder.list();
        for (String x : files) {
            if (!x.contains("hash")) {
                if (var.possible(x)) {
                    new R3Sa(x);
                } else {
                    System.out.println("Aint gonna make it! for" + x);
                }
            }
        }
    }
    if (flag.equals("START")) {
        FLAG.under_watch = true;
        System.out.println("SYSTEM STARTED");
        out.println("STOP");
    } else if (flag.equals("STOP")) {
        FLAG.under_watch = false;
        System.out.println("SYSTEM ON HALT");
        out.println("START");
    }

%> 