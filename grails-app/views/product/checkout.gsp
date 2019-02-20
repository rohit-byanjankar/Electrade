<%--
  Created by IntelliJ IDEA.
  User: Red Skull
  Date: 1/31/2019
  Time: 2:06 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <g:render template="/include/header"/>
</head>
<body>
    <g:render template="/include/navbar"/>
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Checkout</h3>
                <ul class="breadcrumb-tree">
                    <li><g:link controller="user" action="dashboard">Home</g:link></li>
                    <li class="active">Checkout</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-7">
                <!-- Billing Details -->
                <div class="billing-details">
                    <div class="section-title">
                        <h3 class="title">Billing address</h3>
                    </div>
    <g:form controller="user" action="sendingMail" method="post">
                    <div class="form-group">
                        <input class="input" type="text" name="fname" placeholder="First Name" required>
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="lname" placeholder="Last Name" required>
                    </div>
                    <div class="form-group">
                        <input class="input" type="email" name="email" placeholder="Email" required>
                    </div>
                </div>
                <!-- /Billing Details -->

                <!-- Order notes -->
                <div class="order-notes">
                    <textarea class="input" placeholder="Order Notes"></textarea>
                </div>
                <!-- /Order notes -->
            </div>

            <!-- Order Details -->
            <div class="col-md-5 order-details">
                <div class="section-title text-center">
                    <h3 class="title">Your Order</h3>
                </div>
                <div class="order-summary">
                    <div class="order-col">
                        <div><strong>PRODUCT</strong></div>
                        <div><strong>TOTAL</strong></div>
                    </div>
                    <div class="order-products">
                        <g:each in="${session.cartMap.keySet()}" var="key">
                            <g:set var="product" value="${ec_grails.Product.get(key)}" />
                        <div class="order-col">
                            <div>${session.cartMap.get(key)}x ${product.productName}</div>
                            <div><g:set var="sumTotal" value="${0}"/>
                            <g:set var="product" value="${ec_grails.Product.get(key)}" />
                            <g:set var="sumTotal" value="${sumTotal+(product.price.toInteger() * session.cartMap.get(key).toInteger())}"/>
                            Rs. ${sumTotal}</div>
                        </div>
                        </g:each>
                    </div>
                    <div class="order-col">
                        <div>Shiping</div>
                        <div><strong>FREE</strong></div>
                    </div>
                    <div class="order-col">
                        <div><strong>SUM TOTAL</strong></div>
                        <div><strong class="order-total"> <g:set var="sumTotal" value="${0}"/>
                        <g:each in="${session.cartMap.keySet()}" var="key">
                            <g:set var="product" value="${ec_grails.Product.get(key)}" />
                            <g:set var="sumTotal" value="${sumTotal+(product.price.toInteger() * session.cartMap.get(key).toInteger())}"/>
                        </g:each>
                        Rs. ${sumTotal}</strong></div>
                    </div>
                </div>
                    <button class="btn primary-btn order-submit">Place order</button>
                </g:form>
            </div>
            <!-- /Order Details -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
    <g:render template="/include/footer"/>
    <g:render template="/include/scripts"/>
</body>
</html>