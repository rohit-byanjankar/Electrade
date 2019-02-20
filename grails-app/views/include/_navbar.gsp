 <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><i class="fa fa-phone"></i> +01-5555753</li>
                <li><i class="fa fa-envelope-o"></i> Electrade@gmail.com</li>
                <li><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</li>
            </ul>
            <ul class="header-links pull-right">
                <li><g:link action="home" controller="user"><i class="fa fa-user-o"></i> Login/Register</g:link></li>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <g:link controller="user" action="dashboard">
                            <h1 style="margin-top: 10px; color: antiquewhite">Electrade.</h1>
                        </g:link>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <g:form controller="user" action="searchResult">
                            <g:select id="category" name="categoryId" from="${ec_grails.Category.list()}" optionKey="id" required=""
                                      value="${productInstance?.category?.id}" class="many-to-one input-select"/>
                            <input class="input" placeholder="Search here"name="search">
                            <button class="search-btn">Search</button>
                        </g:form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

%{--                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <g:form controller="user" action="searchResult">
                            <g:select id="category" name="categoryId" from="${ec_grails.Category.list()}" optionKey="id" required=""
                                      value="${productInstance?.category?.id}" class="many-to-one input-select"/>
                            <input class="input" placeholder="Search here" name="search" id="search">
                            <ul class="list-group" id="result"></ul>
                            <button class="search-btn">Search</button>
                        </g:form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->--}%

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Cart -->
                        <div class="dropdown">
                            <g:if test="${session.cartMap}">
                                  <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                      <i class="fa fa-shopping-cart"></i>
                                      <span>Your Cart</span>
                                      <div class="qty">${session.cartMap.size()} </div>
                                  </a>
                                  <div class="cart-dropdown">
                                      <div class="cart-list">
                                          <div class="product-widget" style="margin: 10px 10px">
                                              <g:each in="${session.cartMap.keySet()}" var="key">
                                                  <g:set var="product" value="${ec_grails.Product.get(key)}" />
                                                  <div class="product-img">
                                                      <img src="${resource(file: 'product/images/'+product.image , absolute: true)}">
                                                  </div>
                                                  <div class="product-body">
                                                      <h3 class="product-name">${product.productName}</h3>
                                                      <h4 class="product-price"><span class="qty">${session.cartMap.get(key)}x</span>Rs. ${product.price}</h4>
                                                  </div>
                                             </g:each>
                                          </div>
                                      </div>
                                      <div class="cart-summary">
                                          <small>${session.cartMap.size()} Item(s) selected</small>
                                          <h5>SUBTOTAL:
                                              <g:set var="sumTotal" value="${0}"/>
                                          <g:each in="${session.cartMap.keySet()}" var="key">
                                              <g:set var="product" value="${ec_grails.Product.get(key)}" />
                                                      <g:set var="sumTotal" value="${sumTotal+(product.price.toInteger() * session.cartMap.get(key).toInteger())}"/>
                                              </g:each>
                                                      Rs. ${sumTotal}
                                          </h5>
                                      </div>
                                      <div class="cart-btns">
                                          <g:link controller="product" action="viewCart">View Cart</g:link>
                                <g:link controller="product" action="checkout">Checkout  <i class="fa fa-arrow-circle-right"></i></g:link>
                                      </div>
                                  </div>
                              </g:if>
                                <g:else>
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <div class="qty">0</div>
                                    </a>
                                    <div class="cart-dropdown" style="width: 150px">
                                            <h5 class="text-danger" style="margin-left: 10px">Empty Cart</h5>
                                    </div>
                                </g:else>
                        </div>
                        <!-- /Cart -->

                 %{--       <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>

                        <!-- /Menu Toogle -->--}%
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
    <!-- NAVIGATION -->
    <nav id="navigation">
        <!-- container -->
        <div class="container">
            <!-- responsive-nav -->
            <div id="responsive-nav">
                <!-- NAV -->
                <ul class="main-nav nav navbar-nav">
                    <li class="active"><g:link controller="user" action="dashboard">Home</g:link></li>
                    <li class="dropdown">
                        <g:link class="dropdown-toggle " data-toggle="dropdown" aria-expanded="true">
                            Categories
                        </g:link>
                        <div class="dropdown-menu">
                            <g:set var="category" value="${ec_grails.Category.list()}"/>
                            <g:each in="${category}" var="categoryList">
                                <div style="margin: 20px"><g:link controller="product" action="categoryItems" id="${categoryList.id}">${categoryList.categoryName}</g:link></div>
                            </g:each>
                        </div>
                    </li>
                    %{--<li><g:link controller="user" action="aboutUs">About Us</g:link></li>--}%
                </ul>
                <!-- /NAV -->
            </div>
            <!-- /responsive-nav -->
        </div>
        <!-- /container -->
    </nav>
    <!-- /NAVIGATION -->
