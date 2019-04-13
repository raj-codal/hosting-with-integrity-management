<%@page import="foxy_server_manager.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session = request.getSession();
//  if(session.isNew()){
    System.out.println("---dash.jsp---");
    System.out.println(">>"+session.getAttribute("user"));
      if(session.getAttribute("user") == null){
          response.sendRedirect("login.jsp");
      }
      else{
          String user = session.getAttribute("user").toString().trim();
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>dash</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-md" style="background-color:#ffffff;">
        <div class="container-fluid"><a class="navbar-brand" href="#"><strong>R3S HOSTING</strong></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link text-uppercase text-dark" href="index.jsp"><strong>HOME</strong></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link text-uppercase text-white active" style="background-color:#0019ff;" href="#"><strong>Dashboard</strong></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link text-uppercase text-dark" href="logout.jsp"><strong>log out</strong></a></li>
                </ul>
        </div>
        </div>
    </nav>
    <section>
        <div class="row">
            <!--<div class="col col-4" id="search_box" style="background-color:#adcdf2;padding:20px;">-->
            <div class="col col-12" id="upload" style="background-color:#adcdf2;padding:20px;">
                <p><strong>UPLOAD YOUR FILES FROM HERE</strong></p>
                <form name="fileinfo" id="form_1" method = "post" enctype = "multipart/form-data">
                    <!--<input type="file" name="file" id="files">-->
                    <input class="btn btn-light" type = "file" name = "file" size = "50" />
                <input type = "submit" class="btn btn-light" value = "Upload File" required>
                </form>
            </div>
        </div>
    </section>
    <input style="border:none; border-bottom: thick solid blue;background-color: rgba(0,0,0,0);position: relative; margin-bottom: 15px; margin-top: 15px; margin-left: 25px; padding: 10px;" type="search" id="search" onkeypress="searchFiles();" placeholder="enter file name"><button style="margin-left: 25px;font-size: 1.5em" class="btn btn-primary" onclick="searchFiles();" type="button"><i class="fa fa-search" id="search_icon"></i></button>
    <div id="table_of_files">
        <div class="table-responsive">
            <table class="table" style="min-height: 400px;">
                <thead>
                    <tr>
                        <th>FILES <button class = "btn btn-danger" onclick="LOCKER()" id = "l">
                                <%
                                    if(FLAG.under_watch.get(user) != null && FLAG.under_watch.get(user)  == true){
                                        out.println("UNLOCK");
                                    }
                                    else{
                                        out.println("LOCK");
                                    }
                                %>
                            </button>
                        </th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id = "res">
                    <!--<i class="fa fa-spinner fa-spin"></i>-->
                </tbody>
            </table>
            <div id="response" class="alert">
                
            </div>
        </div>
    </div>
    <div class="footer-basic" style="background-color:rgb(4,0,0);">
        <footer>
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-github"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright">R3S WEB HOSTING © 2019</p>
        </footer>
    </div>
    <script type="text/javascript" src ="./js/main.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script>
        AJAX_BOOM();
    </script>
</body>

</html>

<%}%>