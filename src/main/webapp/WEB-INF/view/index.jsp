<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta charset="utf-8">
    <title>vikop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Footer-Clean.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Navigation-with-Button.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
        <div class="container"><a class="navbar-brand" href="#">vikop.ru</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1">
                <ul class="nav navbar-nav mr-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="#">Wykopalisko</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="mikroblog.jsp">Mikroblog</a></li>
                </ul><span class="navbar-text actions"> <a class="login" href="#">Log In</a><a class="btn btn-light action-button" role="button" href="#">Sign Up</a></span></div>
        </div>
    </nav>
    <c:forEach var="wykopalisko" items="${wykopaliska}">
    <div class="row" style="margin: 0px;padding: 20px;height: 230px;">
        <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4" style="padding:0px;">
            <div style="background-image: url('${pageContext.request.contextPath}/resources/img/mac.jpeg');height: 100%;background-repeat: no-repeat;background-size: cover;background-position: center;"></div>
        </div>
        <div class="w-100 d-sm-block d-md-none d-lg-none d-xl-none"></div>
        <div class="col" style="padding: 0px;">
            <div class="card" style="height: 100%;">
                <div class="card-body">
                    <h4 class="card-title">${wykopalisko.title}</h4>
                    <p class="card-text">${wykopalisko.description}</p>
                    <a class="card-link" href="${wykopalisko.sourceUrl}">Źródło</a>
                    <a class="card-link" href="#">Wykop(${wykopalisko.ratingPlus})</a>
                    <a class="card-link" href="#">Zakop(${wykopalisko.ratingMinus})</a>
                    <h6 class="text-muted card-text mb-2">Dodano: ${wykopalisko.timestamp}</h6>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
    <div class="footer-clean">
        <footer>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-sm-4 col-md-3 item">
                        <h3>Services</h3>
                        <ul>
                            <li><a href="#">Web design</a></li>
                            <li><a href="#">Development</a></li>
                            <li><a href="#">Hosting</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-4 col-md-3 item">
                        <h3>About</h3>
                        <ul>
                            <li><a href="#">Company</a></li>
                            <li><a href="#">Team</a></li>
                            <li><a href="#">Legacy</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-4 col-md-3 item">
                        <h3>Careers</h3>
                        <ul>
                            <li><a href="#">Job openings</a></li>
                            <li><a href="#">Employee success</a></li>
                            <li><a href="#">Benefits</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3 item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a>
                        <p class="copyright">Dominik Przytuła © 2019</p>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>