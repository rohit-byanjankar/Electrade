<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Electrade</title>

		<!--HEADER-->

		<g:render template="/include/header"/>
    </head>
	<body>
	<!--NAVBAR-->
	<g:render template="/include/navbar"/>
		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container" >
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" style="height: 400px">
						<div class="item active">
							<asset:image src="rsz_2keyboard.png"/>
						</div>

						<div class="item">
							<asset:image src="caraousel1.png"/>
						</div>

						<div class="item">
							<asset:image src="caraousel3.png"/>
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" data-slide="prev">
					<span class="fa fa-angle-left" style="margin-top: 150px"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next">
						<span class="fa fa-angle-right" style="margin-top: 150px"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title text-center">
							<h3 class="title">New Products</h3>
					</div>
					<!-- /section title -->

					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab1" class="tab-pane active">
									<div class="products-slick" data-nav="#slick-nav-1">
										<!-- product -->
										<g:each in="${productList}" var="product1">
										<div class="product">
											<div class="product-img">
												<img src="${resource(file: 'product/images/'+product1.image , absolute: true)}">
												<div class="product-label">
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">${product1.category}</p>
												<h3 class="product-name"><a href="#">${product1.productName}</a></h3>
												<h4 class="product-price">Rs. ${product1.price}</h4>
												<div class="product-btns">
											<g:form controller="product" action="productView" id="${product1.id}" method="post">
												<input type="hidden" value="${product1.categoryId}" name="category">
												<button class="quick-view btn btn-light"><i class="fa fa-eye"></i><span class="tooltipp"> View Product</span></button>
											</g:form>
												</div>
											</div>
											<div class="add-to-cart">
												<g:form controller="product" action="userCartItems" method="post">
													<input type="hidden" value="${product1.id}" name="product">
													<input type="hidden" value="1" name="quantity">
													<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
												</g:form>
											</div>
										</div>
										</g:each>
									</div>
									<div id="slick-nav-1" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
	</div>

	<!-- HOT DEAL SECTION -->
	<div id="hot-deal" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="hot-deal">
						<ul class="hot-deal-countdown">
							<li>
								<div>
									<h3>02</h3>
									<span>Days</span>
								</div>
							</li>
							<li>
								<div>
									<h3>10</h3>
									<span>Hours</span>
								</div>
							</li>
							<li>
								<div>
									<h3>34</h3>
									<span>Mins</span>
								</div>
							</li>
							<li>
								<div>
									<h3>60</h3>
									<span>Secs</span>
								</div>
							</li>
						</ul>
						<h2 class="text-uppercase">hot deal this week</h2>
						<p>New Collection Up to 50% OFF</p>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOT DEAL SECTION -->

		<!-- FOOTER -->
		<g:render template="/include/footer"/>

		<!-- jQuery Plugins -->
		<g:render template="/include/scripts"/>
	</body>
</html>
