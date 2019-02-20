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
<g:if test="${results}">
    <div class="row">
        <h3 align="center" style="margin-top: 25px">Result for '${searchInitial}'</h3>
        <div class="col-md-12">
            <g:each in="${results}" var="result">
                <div class="product col-md-3" style="margin: 40px;">
                    <div class="product-img">
                        <img src="${resource(file: 'product/images/'+result.image , absolute: true)}">
                    </div>
                    <div class="product-body">
                        <p class="product-category">${result.category}</p>
                        <h3 class="product-name"><a href="#">${result.productName}</a></h3>
                        <h4 class="product-price">Rs. ${result.price}</h4>
                        <div class="product-btns">
                            <g:form controller="product" action="productView" id="${result.id}" method="post">
                                <input type="hidden" value="${result.categoryId}" name="category">
                                <button class="quick-view btn btn-light"><i class="fa fa-eye"></i><span class="tooltipp"> View Product</span></button>
                            </g:form>
                        </div>
                    </div>
                    <div class="add-to-cart">
                        <g:form controller="product" action="userCartItems" method="post">
                            <input type="hidden" value="${result.id}" name="product">
                            <input type="hidden" value="1" name="quantity">
                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                        </g:form>
                    </div>
                </div>
            </g:each>
        </div>
    </div>
</g:if>
<g:else>
    <h3 align="center" style="margin: 50px 50px">Result for '${searchInitial}' not found</h3>
</g:else>

    <g:render template="/include/footer"/>
    <g:render template="/include/scripts"/>
</body>
</html>