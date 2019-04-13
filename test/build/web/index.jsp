<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession();
//  if(session.isNew()){
    System.out.println("---index.jsp---");
    System.out.println(">>"+session.getAttribute("user"));
    String userName = null;
      if(session.getAttribute("user") == null){
//          response.sendRedirect("login.html");
      }
      else{
          userName = session.getAttribute("user").toString();
      }
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>java</title>
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
                    <li class="nav-item" role="presentation"><a class="nav-link text-uppercase text-white active" href="#" style="background-color:#0019ff;"><strong>HOME</strong></a></li>
                    <%
                        if(userName == null){
                    %>
                    <li class="nav-item" role="presentation"><a class="nav-link text-uppercase text-dark" href="login.jsp"><strong>LOG IN</strong></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link text-uppercase text-dark" href="signup.jsp"><strong>SIgn up</strong></a></li>
                    <%
                    }    
                    else{
                    %>
                        <li class="nav-item" role="presentation"><a class="nav-link text-uppercase text-dark" href="dash.jsp"><strong>DASHBOARD</strong></a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link text-uppercase text-dark" href="logout.jsp"><strong>LOG OUT</strong></a></li>
                    <%}%>
                </ul>
        </div>
        </div>
    </nav>
    <div>
        <div class="jumbotron">
            <h1>&nbsp;<br></h1>
        </div>
    </div>
    <div id="features">
        <h1 id="features_heading">OUR FEATURES</h1>
        <div class="card-group">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title"><i class="fa fa-envira round_border"></i></h4>
                    <p class="card-text">We provide dynamic and easy &nbsp;to use system for all users, computer as well as mobile users.</p>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title"><i class="fa fa-chain round_border"></i></h4>
                    <p class="card-text">We provide integrity management using our algorithm based on chaining of blocks</p>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title"><i class="fa fa-files-o round_border"></i></h4>
                    <p class="card-text">Along with uploading files you can also remove and also change files easily.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-basic" style="background-color:rgb(0,0,0);">
        <footer>
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="https://www.github.com/Raj-Dhanani/"><i class="icon ion-social-github"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="https://www.github.com/Raj-Dhanani">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright">R3S WEB HOSTING © 2019</p>
        </footer>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>