<g:if test="${session.user}">
    <div id="top-header">
        <div class="container-fluid">
            <ul class="header-links pull-left">
                <li> <g:link action="index" controller="user" >User</g:link></li>
                <li> <g:link action="index" controller="category" >Category</g:link></li>
                <li> <g:link action="index" controller="product" >Product</g:link></li>
            </ul>
            <ul class="header-links pull-right">
                <li class="text-white">${session.user.name}</li>
                <li> <g:link action="logout" controller="user" class="nav-link text-success">Logout</g:link></li>
            </ul>
        </div>
    </div>
</g:if>

