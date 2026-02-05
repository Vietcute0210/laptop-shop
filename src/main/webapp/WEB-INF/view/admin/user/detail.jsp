<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
    <head>
        <title>Manage Users - Laptopshop</title>
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
                            <li class="breadcrumb-item active">Users</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Table Users
                                <a href="/admin/user/create" class="btn btn-primary btn-sm float-end">Create New User</a>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Email</th>
                                            <th>Role</th>
                                            <th>Full Name</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" items="${users}" varStatus="status">
                                            <tr>
                                                <th>${user.id}</th>
                                                <td>${user.email}</td>
                                                <td>${user.role.name}</td>
                                                <td>${user.fullName}</td>
                                                <td>
                                                    <a href="/admin/user/${user.id}" class="btn btn-sm btn-warning">View</a>
                                                    <a href="/admin/user/update/${user.id}" class="btn btn-sm btn-info">Update</a>
                                                    <a href="/admin/user/delete/${user.id}" class="btn btn-sm btn-danger">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>
    </body>
</html>
