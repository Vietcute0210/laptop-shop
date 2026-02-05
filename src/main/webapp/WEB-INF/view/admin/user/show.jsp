<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
    <title>User Detail - Laptopshop</title>
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
                    <h1 class="mt-4">Users</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="/admin/user">Users</a></li>
                        <li class="breadcrumb-item active">Detail</li>
                    </ol>
                    <div class="mt-5">
                        <div class="row">
                            <div class="col-12 mx-auto">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h3 class="m-0">Detail User ${user.id}</h3>
                                </div>
                                <hr />
                                <div class="card" style="width: 60%;">
                                    <div class="card-header">
                                        Featured
                                    </div>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">ID: ${user.id}</li>
                                        <li class="list-group-item">Email: ${user.email}</li>
                                        <li class="list-group-item">Name: ${user.fullName}</li>
                                        <li class="list-group-item">Address: ${user.address}</li>
                                        <li class="list-group-item">Phone: ${user.phone}</li>
                                        <li class="list-group-item">Role: ${user.role.name}</li>
                                        <li class="list-group-item">Avatar:
                                            <c:if test="${not empty user.avatar}">
                                                <img src="/images/uploads/${user.avatar}" alt="Avatar"
                                                    style="max-width: 150px; max-height: 150px;" />
                                            </c:if>
                                        </li>
                                    </ul>
                                </div>
                                <a href="/admin/user" class="btn btn-success mt-3">Back</a>
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