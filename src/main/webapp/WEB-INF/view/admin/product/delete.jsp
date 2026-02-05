<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
    <head>
        <title>Delete Product - Laptopshop</title>
        <jsp:include page="../layout/head.jsp" />
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="../layout/header.jsp" />
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <jsp:include page="../layout/sidebar.jsp" />
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Products</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item"><a href="/admin/product">Products</a></li>
                            <li class="breadcrumb-item active">Delete</li>
                        </ol>
                        <div class="mt-5">
                            <div class="row">
                                <div class="col-md-6 col-12 mx-auto">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h3 class="m-0">Delete Product</h3>
                                    </div>
                                    <hr />
                                    <div class="alert alert-danger">    
                                        Are you sure to delete this product: <b>${product.name}</b> (ID: ${product.id})?
                                    </div>
                                    <form:form action="/admin/product/delete" method="POST" modelAttribute="newProduct">
                                        <div class="mb-3" style="display: none">
                                            <label for="id" class="form-label">ID</label>
                                            <form:input
                                                type="text"
                                                class="form-control"
                                                path="id"
                                                readonly="true"
                                            />
                                        </div>
                                        <button class="btn btn-danger">Confirm Delete</button>
                                        <a href="/admin/product" class="btn btn-secondary">Cancel</a>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>
    </body>
</html>