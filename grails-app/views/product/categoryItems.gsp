<%--
  Created by IntelliJ IDEA.
  User: Red Skull
  Date: 1/22/2019
  Time: 4:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <g:render template="/include/header"/>
</head>

<body>
    <g:render template="/include/navbar"/>
    <div class="row">
        <div class="col-md-12">
        <g:each in="${products}" var="product">
                <div class="product col-md-3" style="margin: 50px 30px">
                    <div class="product-img">
                        <img src="${resource(file: 'product/images/'+product.image , absolute: true)}">
                    </div>
                    <div class="product-body">
                        <p class="product-category">${product.category}</p>
                        <h3 class="product-name"><a href="#">${product.productName}</a></h3>
                        <h4 class="product-price">Rs. ${product.price}</h4>
                        <g:form controller="product" action="productView" id="${product.id}" method="post">
                            <input type="hidden" value="${product.categoryId}" name="category">
                            <button class="quick-view btn btn-light"><i class="fa fa-eye"></i><span class="tooltipp"> View Product</span></button>
                        </g:form>
                    </div>
                    <div class="add-to-cart">
                        <g:form controller="product" action="userCartItems" method="post">
                            <input type="hidden" value="${product.id}" name="product">
                            <input type="hidden" value="1" name="quantity">
                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                        </g:form>
                    </div>
                </div>
        </g:each>
        </div>
    </div>
    <g:render template="/include/footer"/>
    <g:render template="/include/scripts"/>
</body>
</html>