<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">

<head>
    <title>Update User - Laptopshop</title>
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
                        <li class="breadcrumb-item active">Update</li>
                    </ol>
                    <div class="mt-5">
                        <div class="row">
                            <div class="col-md-6 col-12 mx-auto">
                                <h3>Update User ${user.id}</h3>
                                <hr />
                                <form:form action="/admin/user/update" method="POST" modelAttribute="user"
                                    enctype="multipart/form-data">
                                    <div class="mb-3" style="display: none">
                                        <label for="id" class="form-label">ID</label>
                                        <form:input type="text" class="form-control" path="id" readonly="true" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="avatarFile" class="form-label">Avatar</label>
                                        <input type="file" class="form-control" id="avatarFile" name="avatarFile"
                                            accept=".png, .jpg, .jpeg" />
                                    </div>
                                    <div class="mb-3">
                                        <%-- 2. Hiển thị ảnh hiện tại của user nếu có --%>
                                        <c:if test="${not empty user.avatar}">
                                            <div id="currentAvatar">
                                                <p>Current Avatar:</p>
                                                <img src="/images/avatars/${user.avatar}"
                                                    style="max-width: 150px; margin-bottom: 10px; border-radius: 5px; display: block;" />
                                            </div>
                                        </c:if>
                                        <label class="form-label">Preview Avatar:</label>
                                        <%-- 3. Nơi hiển thị ảnh mới khi chọn file (Preview) --%>
                                        <img id="avatarPreview"
                                            style="display: none; max-width: 150px; border-radius: 5px; border: 2px dashed #ccc; padding: 5px;" />

                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <form:input type="email" class="form-control" path="email" required="true"
                                            disabled="true" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Role:</label>
                                        <form:select path="role.id" class="form-select" disabled="true">
                                            <form:option value="1">USER</form:option>
                                            <form:option value="2">ADMIN</form:option>
                                        </form:select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="fullName" class="form-label">Full Name</label>
                                        <form:input type="text" class="form-control is-invalid" path="fullName"
                                            required="true" />
                                        <form:errors path="fullName" style="color: red;" cssClass="invalid-feedback" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="address" class="form-label">Address</label>
                                        <form:input type="text" class="form-control" path="address" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="phone" class="form-label">Phone Number</label>
                                        <form:input type="text" class="form-control" path="phone" />
                                    </div>


                                    <button type="submit" class="btn btn-warning">Update</button>
                                    <a href="/admin/user" class="btn btn-secondary">Cancel</a>
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