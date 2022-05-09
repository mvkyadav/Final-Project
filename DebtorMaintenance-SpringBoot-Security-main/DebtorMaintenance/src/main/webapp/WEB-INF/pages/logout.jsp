<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <%@ include file="include/head_tag.html"%>
    <style>
        <%@ include file="include/styles.css"%>
    </style>
</head>
<body>
<div class="container">
    <%if (request.isUserInRole("DEBTOR")) {%>
    <jstl:set var="logoutURL" value="/debtor/logout" scope="page"/>
    <%} else {%>
    <jstl:set var="logoutURL" value="/admin/logout" scope="page"/>
    <%}%>
    <form:form method="post" action="${logoutURL}">
        <h1>Are you sure, you want to log out?</h1>
        <p>
            <button type="submit" class="btn btn-danger">Yes</button>
            <button type="button" onclick="history.back()" class="btn btn-secondary">No</button>
        </p>
    </form:form>
</div>

<%@ include file="include/script_tag.html"%>
</body>
</html>