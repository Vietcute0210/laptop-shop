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

                                    <div class="mb-3">
                                        <label class="form-label">ID:</label>
                                        <form:input type="text" class="form-control" path="id" disabled="true" />
                                    </div>

                                    <div class="mb-3">
                                        <label for="productFile" class="form-label">Product Image</label>
                                        <input type="file" class="form-control" id="productFile" name="productFile"
                                            accept=".png, .jpg, .jpeg" />
                                    </div>
                                    <div class="mb-3">
                                        <%-- 2. Hiển thị ảnh hiện tại của product nếu có --%>
                                        <c:if test="${not empty product.image}">
                                            <div id="currentProductImage">
                                                <p>Current Product Image:</p>
                                                <img src="/images/products/${product.image}" alt="Product Image"
                                                    style="max-width: 150px; margin-bottom: 10px; border-radius: 5px; display: block;" />
                                            </div>
                                        </c:if>
                                        <label class="form-label">Preview Product Image:</label>
                                        <%-- 3. Nơi hiển thị ảnh mới khi chọn file (Preview) --%>
                                        <img id="productPreview"
                                            style="display: none; max-width: 150px; border-radius: 5px; border: 2px dashed #ccc; padding: 5px;" />

                                    </div>

                                    <div class="mb-3" style="display: none">
                                        <form:input type="text" class="form-control" path="id" />
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Name:</label>
                                        <form:input type="text" class="form-control" path="name" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Price:</label>
                                        <form:input type="number" class="form-control" path="price" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Quantity:</label>
                                        <form:input type="number" class="form-control" path="quantity" />
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
                                        <form:input type="number" class="form-control" path="sold" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Factory:</label>
                                        <form:input type="text" class="form-control" path="factory" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Target:</label>
                                        <form:input type="text" class="form-control" path="target" />
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