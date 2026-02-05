<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">

<head>
    <title>Update Product - Laptopshop</title>
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
                        <li class="breadcrumb-item active">Update</li>
                    </ol>
                    <div class="mt-5">
                        <div class="row">
                            <div class="col-md-6 col-12 mx-auto">
                                <h3>Update Product ${product.id}</h3>
                                <hr />
                                <form:form action="/admin/product/update" method="POST" modelAttribute="product"
                                    enctype="multipart/form-data">

                                    <div class="mb-3" style="display: none">
                                        <form:input type="text" class="form-control" path="id" />
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Name:</label>
                                        <c:set var="errorName">
                                            <form:errors path="name" />
                                        </c:set>
                                        <form:input type="text"
                                            class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                            path="name" />
                                        <form:errors path="name" cssClass="invalid-feedback" />
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Price:</label>
                                        <c:set var="errorPrice">
                                            <form:errors path="price" />
                                        </c:set>
                                        <form:input type="number" step="0.1"
                                            class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                            path="price" />
                                        <form:errors path="price" cssClass="invalid-feedback" />
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Quantity:</label>
                                        <c:set var="errorQuantity">
                                            <form:errors path="quantity" />
                                        </c:set>
                                        <form:input type="number"
                                            class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                            path="quantity" />
                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Detail Description:</label>
                                        <c:set var="errorDetail">
                                            <form:errors path="detailDesc" />
                                        </c:set>
                                        <form:textarea
                                            class="form-control ${not empty errorDetail ? 'is-invalid' : ''}"
                                            path="detailDesc" rows="5"></form:textarea>
                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Short Description:</label>
                                        <c:set var="errorShort">
                                            <form:errors path="shortDesc" />
                                        </c:set>
                                        <form:input type="text"
                                            class="form-control ${not empty errorShort ? 'is-invalid' : ''}"
                                            path="shortDesc" />
                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
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
                                        <label for="productFile" class="form-label">Product Image</label>
                                        <input type="file" class="form-control" id="productFile" name="productFile"
                                            accept=".png, .jpg, .jpeg" />
                                    </div>
                                    <div class="mb-3">
                                        <%-- Image Display and Preview --%>
                                        <c:if test="${not empty product.image}">
                                            <div id="currentProductImage">
                                                <p>Current Image:</p>
                                                <img src="/images/products/${product.image}"
                                                    style="max-width: 150px; margin-bottom: 10px; border-radius: 5px; display: block;" />
                                            </div>
                                        </c:if>
                                        <label class="form-label">New Preview:</label>
                                        <img id="productPreview"
                                            style="display: none; max-width: 150px; border-radius: 5px; border: 2px dashed #ccc; padding: 5px;" />
                                    </div>

                                    <button type="submit" class="btn btn-warning">Update</button>
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