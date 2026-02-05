<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
    <head>
        <title>Manage Products - Laptopshop</title>
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
                        <h1 class="mt-4">Manage Products</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item active">Products</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <h3>${message}</h3>
                                <button class="btn btn-primary">Click Me</button>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>
    </body>
</html>
