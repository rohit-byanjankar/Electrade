<%--
  Created by IntelliJ IDEA.
  User: Red Skull
  Date: 1/31/2019
  Time: 2:16 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:render template="/include/header"/>
</head>
    <g:render template="/include/navbar"/>
<div class="container">
    <h2 style="margin-left: 450px;margin-top: 20px">Your Cart Items</h2>
    <g:if test="${session.cartMap}">
        <table class="table">
            <thead>
            <tr class="info">
                <th style="padding: 43px"></th>
                <th style="padding: 43px">Product Name</th>
                <th style="padding: 43px">Price</th>
                <th style="padding: 43px">Quantity</th>
                <th style="padding: 43px">Total</th>
                <th style="padding: 43px"></th>

            </tr>
            </thead>
            <g:each in="${session.cartMap.keySet()}" var="key">
                <g:set var="product" value="${ec_grails.Product.get(key)}" />
                <tbody>
                <tr class="danger">
                    <td><img src="${resource(file: 'product/images/'+product.image , absolute: true)}" width="200px" height="90px"></td>
                    <td style="padding: 40px"><g:link action="productView" id="${product.id}">${product.productName}</g:link></td>
                    <td style="padding: 40px">${product.price}</td>
                    <td style="padding: 40px">${session.cartMap.get(key)}</td>
                    <td style="padding: 40px"> <g:set var="sumTotal" value="${0}"/>
                    <g:set var="product" value="${ec_grails.Product.get(key)}" />
                    <g:set var="sumTotal" value="${sumTotal+(product.price.toInteger() * session.cartMap.get(key).toInteger())}"/>
                    Rs. ${sumTotal}</td>
                    <td style="padding: 40px"><g:link action="removeFromCart" id="${product.id}"><button class="btn btn-success">Remove</button></g:link></td>
                </tr>
                </tbody>
            </g:each>
        </table>
        <g:link action="checkout"><button class="btn btn-success" style="margin-left: 550px;margin-bottom: 20px">CheckOut</button></g:link>
    </g:if>
    <g:else>
        <h3 class="text-danger">Empty cart</h3>
        <g:link controller="user" action="dashboard"><button class="btn btn-success">Go back to Shopping</button></g:link>
    </g:else>
</div>
    <g:render template="/include/footer"/>
    <g:render template="/include/scripts"/>
<body>

</body>
</html>