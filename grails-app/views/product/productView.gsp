<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Electro - HTML Ecommerce Template</title>
		<g:render template="/include/header"/>

    </head>
	<body>

	<g:render template="/include/navbar"/>
		<!-- BREADCRUMB -->
	<g:each in="${eachProduct}" var="product">
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb-tree">
							<li><g:link controller="user" action="dashboard">Home</g:link></li>
							<li><a href="#">All Categories</a></li>
							<li><g:link controller="product" action="categoryItems" id="${product.categoryId}">${product.category}</g:link></li>
							<li class="active">${product.productName}</li>
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
					<!-- Product main img -->
					<div class="col-md-5 col-md-push-3">
						<div id="product-main-img">
							<div class="product-preview">
								<img src="${resource(file: 'product/images/'+product.image , absolute: true)}">
							</div>

							<div class="product-preview">
								<img src="${resource(file: 'product/images/'+product.image , absolute: true)}">
							</div>

							<div class="product-preview">
								<img src="${resource(file: 'product/images/'+product.image , absolute: true)}">
							</div>
						</div>
					</div>
					<!-- /Product main img -->

					<!-- Product thumb imgs -->
					<div class="col-md-3  col-md-pull-5">
						<div id="product-imgs">
							<div class="product-preview">
								<img src="${resource(file: 'product/images/'+product.image , absolute: true)}" height="150px">
							</div>

							<div class="product-preview">
								<img src="${resource(file: 'product/images/'+product.image , absolute: true)}" height="150px">
							</div>

							<div class="product-preview">
								<img src="${resource(file: 'product/images/'+product.image , absolute: true)}" height="150px">
							</div>
						</div>
					</div>
					<!-- /Product thumb imgs -->

					<!-- Product details -->
					<div class="col-md-4">
						<div class="product-details">
							<h2 class="product-name">${product.productName}</h2>
							<div>
								<h3 class="product-price">Rs. ${product.price}</h3>
							</div>


                        <g:form controller="product" action="userCartItems" method="post">
							<div class="add-to-cart">
								<div class="qty-label">
									Qty
									    <div class="input-number">
                                            <input type="number" name="quantity" min="1" value="1">
                                            <span class="qty-up">+</span>
                                            <span class="qty-down">-</span>
									    </div>
								</div>
                                    <input type="hidden" value="${product.id}" name="product">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
							</div>
                        </g:form>

							<ul class="product-links">
								<li>Category:</li>
								<li><g:link controller="product" action="categoryItems" id="${product.categoryId}">${product.category}</g:link></li>
							</ul>
						</div>
					</div>
	</g:each>

		<!-- Section -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-12">
						<div class="section-title text-center">
							<h3 class="title">Related Products</h3>
						</div>
					</div>

		<g:each in="${productCategory}" var="productCat">
			<div class="product col-md-3">
				<div class="product-img">
					<img src="${resource(file: 'product/images/'+productCat.image , absolute: true)}">
				</div>
				<div class="product-body">
					<p class="product-category">${productCat.category}</p>
					<h3 class="product-name"><a href="#">${productCat.productName}</a></h3>
					<h4 class="product-price">Rs. ${productCat.price}</h4>
				</div>
				<div class="product-btns" style="margin-left: 70px; margin-bottom: 20px">
					<g:form controller="product" action="productView" id="${productCat.id}" method="post">
						<input type="hidden" value="${productCat.categoryId}" name="category">
						<button class="quick-view btn btn-light"><i class="fa fa-eye"></i><span class="tooltipp"> View Product</span></button>
					</g:form>
				</div>
			</div>
		</g:each>
					<!-- /product -->
		</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /Section -->
	</div>

		<!-- FOOTER -->
		<g:render template="/include/footer"/>
		<!-- /FOOTER -->

		<!-- jQuery Plugins -->
		<g:render template="/include/scripts"/>
	</body>
</html>
