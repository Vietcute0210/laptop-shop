<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en">

<head>
    <title>Create User - Laptopshop</title>
    <jsp:include page="../layout/head.jsp" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({
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
                    <h1 class="mt-4">Users</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="/admin/user">Users</a></li>
                        <li class="breadcrumb-item active">Create</li>
                    </ol>
                    <div class="mt-5">
                        <div class="row">
                            <div class="col-md-6 col-12 mx-auto">
                                <h3>Create a user</h3>
                                <hr />
                                <form:form method="post" action="/admin/user/create" modelAttribute="newUser"
                                    enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <label class="form-label">Email:</label>
                                        <form:input type="email" class="form-control" path="email" />
                                        <div id="emailHelp" class="form-text">
                                            We'll never share your email with anyone else.
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Password:</label>
                                        <form:input type="password" class="form-control" path="password" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Phone number:</label>
                                        <form:input type="tel" class="form-control" path="phone" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Full name:</label>
                                        <form:input type="text" class="form-control" path="fullName" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Address:</label>
                                        <form:input type="text" class="form-control" path="address" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="avatarFile" class="form-label">Avatar:</label>
                                        <input class="form-control" type="file" id="avatarFile" name="avatarFile"
                                            accept=".png, .jpg, .jpeg" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="avatarFile" class="form-label">Avatar:</label>
                                        <img id="avatarPreview" class="form-control" style="display: none;" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Role:</label>
                                        <form:select path="role.id" class="form-select">
                                            <form:option value="1">USER</form:option>
                                            <form:option value="2">ADMIN</form:option>
                                        </form:select>
                                    </div>
                                    <br />
                                    <button type="submit" class="btn btn-primary">Create</button>
                                    <a href="/admin/user" class="btn btn-secondary">Back</a>
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