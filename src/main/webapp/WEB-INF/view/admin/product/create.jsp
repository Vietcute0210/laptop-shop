<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en">

<head>
    <title>Create Product - Laptopshop</title>
    <jsp:include page="../layout/head.jsp" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script>
        $(document).ready(() => {
            const productFile = $("#productFile");
            productFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#productPreview").attr("src", imgURL);
                $("#productPreview").css({
                    "display": "block"
                });
            });
        });
    </script>
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
                        <li class="breadcrumb-item active">Create</li>
                    </ol>
                    <div class="mt-5">
                        <div class="row">
                            <div class="col-md-6 col-12 mx-auto">
                                <h3>Create a product</h3>
                                <hr />
                                <form:form method="post" action="/admin/product/create" modelAttribute="newProduct"
                                    enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <label class="form-label">Name:</label>
                                        <form:input type="text" class="form-control is-invalid" path="name" />
                                        <form:errors path="name" style="color: red;" cssClass="invalid-feedback" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Price:</label>
                                        <form:input type="number" class="form-control is-invalid" path="price" />
                                        <form:errors path="price" style="color: red;" cssClass="invalid-feedback" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Quantity:</label>
                                        <form:input type="number" class="form-control is-invalid" path="quantity" />
                                        <form:errors path="quantity" style="color: red;" cssClass="invalid-feedback" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Detail Description:</label>
                                        <form:input type="text" class="form-control" path="detailDesc" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Short Description:</label>
                                        <form:input type="text" class="form-control" path="shortDesc" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Sold:</label>
                                        <form:input type="number" class="form-control is-invalid" path="sold" />
                                        <form:errors path="sold" style="color: red;" cssClass="invalid-feedback" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Factory:</label>
                                        <form:input type="text" class="form-control" path="factory" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Target:</label>
                                        <form:input type="text" class="form-control" path="target" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="productFile" class="form-label">Image:</label>
                                        <input class="form-control" type="file" id="productFile" name="productFile"
                                            accept=".png, .jpg, .jpeg" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="productFile" class="form-label">Image Preview:</label>
                                        <img id="productPreview" class="form-control" style="display: none;" />
                                    </div>
                                    <br />
                                    <button type="submit" class="btn btn-primary">Create</button>
                                    <a href="/admin/product" class="btn btn-secondary">Back</a>
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