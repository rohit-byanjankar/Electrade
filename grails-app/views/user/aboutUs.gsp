<%--
  Created by IntelliJ IDEA.
  User: Red Skull
  Date: 2/12/2019
  Time: 10:31 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:render template="/include/header"/>
</head>
<body>
    <g:render template="/include/navbar"/>
<img src="${resource(file: '/images/background.jpg', absolute: true)}" style="width: 100% ;height: 250px;background-repeat: no-repeat;background-position: center;">
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-9 col-xs-12">
                        <div class="footer">
                            <h3 class="footer-title text-danger">About Us</h3>
                            <p>
                                Welcome to Electro.
                                Starting as a small business in Nepal, we have big dreams.We provide our customers nothing but the highest quality of products, that are guaranteed to meet their needs and keep them satisfied!
                                With a motivated team, we strive to be the creative minds that bring a smile to your face. That’s why we’re always looking for innovative new ways to get the best to you.
                            </p>
                            <ul class="footer-links">
                                <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                                <li><a href="#"><i class="fa fa-phone"></i>+5555753</a></li>
                                <li><a href="#"><i class="fa fa-envelope-o"></i>Electro@gmail.com</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /top footer -->
    </div>
    <g:render template="/include/footer"/>
</body>
</html>