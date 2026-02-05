<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
    <title>Product Detail - Laptopshop</title>
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
                        <li class="breadcrumb-item active">Detail</li>
                    </ol>
                    <div class="mt-5">
                        <div class="row">
                            <div class="col-12 mx-auto">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h3 class="m-0">Detail Product ${product.id}</h3>
                                </div>
                                <hr />
                                <div class="card" style="width: 60%;">
                                    <div class="card-header">
                                        Featured
                                    </div>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">ID: ${product.id}</li>
                                        <li class="list-group-item">Name: ${product.name}</li>
                                        <li class="list-group-item">Price: ${product.price}</li>
                                        <li class="list-group-item">Short Description: ${product.shortDesc}</li>
                                        <li class="list-group-item">Detail Description: ${product.detailDesc}</li>
                                        <li class="list-group-item">Quantity: ${product.quantity}</li>
                                        <li class="list-group-item">Sold: ${product.sold}</li>
                                        <li class="list-group-item">Factory: ${product.factory}</li>
                                        <li class="list-group-item">Target: ${product.target}</li>
                                        <li class="list-group-item">Image:
                                            <c:if test="${not empty product.image}">
                                                <img src="/images/products/${product.image}" alt="Image"
                                                    style="max-width: 150px; max-height: 150px;" />
                                            </c:if>
                                        </li>
                                    </ul>
                                </div>
                                <a href="/admin/product" class="btn btn-success mt-3">Back</a>
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