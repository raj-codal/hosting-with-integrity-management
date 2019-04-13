<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession(true);
    String validation = null;
    System.out.println("---signup.jsp---");
    if (session.getAttribute("user") == null) {
        if (session.getAttribute("regvar") == null) {

        } else {
            validation = session.getAttribute("regvar").toString();
            session.setAttribute("regvar", null);
            if (validation.equals("registered")) {
                response.sendRedirect("login.jsp");
            }
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>dash</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Registration-Form-with-Photo.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-md" style="background-color:#ffffff;">
        <div class="container-fluid"><a class="navbar-brand" href="#"><strong>R3S HOSTING</strong></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link text-uppercase text-dark" href="index.jsp"><strong>HOME</strong></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link text-uppercase text-dark" href="login.jsp"><strong>LOG IN</strong></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link text-uppercase text-white active" href="#" style="background-color:#0019ff;"><strong>SIGN UP</strong></a></li>
                </ul>
        </div>
        </div>
    </nav>
    <div class="register-photo">
        <div class="form-container">
            <div class="image-holder"></div>
            <form action="register.jsp" method="post">
                <h2 class="text-center"><strong>Create</strong> an account.</h2>
                <div class="form-group"><input class="form-control" type="text" name="name" placeholder="name" required></div>
                <div class="form-group"><input class="form-control" type="email" name="email" placeholder="Email" required></div>
                <div class="form-group"><input class="form-control" type="password" name="pswd" placeholder="Password" required></div>
                <div class="form-group"><input class="form-control" type="password" name="cpswd" placeholder="Password (repeat)" required></div>
                <div class="form-group">
                    <div class="form-check"><label class="form-check-label"><input class="form-check-input" type="checkbox" required>I agree to the license terms.</label></div>
                </div>
                                    <%
                                  //action="register.jsp" method="post"
                                        if (validation == null) {

                                        } else {
                                            if (!validation.equals("registered")) {
                                                out.println(validation);
                                            }
                                        }
                                    %>
                <div class="form-group"><button class="btn btn-primary btn-block" type="submit" style="background-color:rgb(0,25,255);">Sign Up</button></div></form>
        </div>
    </div>
    <div class="footer-basic" style="background-color:rgb(0,0,0);">
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
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>