<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Home</title>
    <%@include file="include/head_tag.html"%>
    <style>
        <%@include file="include/styles.css"%>
    </style>
</head>
<body>

<%@ include file="include/admin_nav.html"%>

<div class="container">
    <h2>Welcome, ${name}</h2>
    <hr>
    <p>You are having <strong>${pendingCount}</strong> pending forms for
        <a href="/admin/debtor/details">authorization/rejection</a>.
    </p>
</div>
<%@include file="include/script_tag.html"%>
</body>
</html>
