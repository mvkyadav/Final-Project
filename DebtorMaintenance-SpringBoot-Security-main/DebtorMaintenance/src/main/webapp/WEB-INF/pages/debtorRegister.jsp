<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Debtor Registration</title>
    <%@ include file="include/head_tag.html"%>
    <style>
        <%@ include file="include/styles.css"%>
        .error {
            color: red;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <header>
        <article class="col-md-8 mx-auto">
            <h1 class=" text-center text-uppercase text-primary pb-2 pt-2">Create Your Account</h1>
        </article>
    </header>

    <%--@elvariable id="user" type="project.bfour.debtormaintenance.model.User"--%>
    <form:form cssClass="form-signin shadow-lg p-3 mb-5  bg-body rounded" method="post" modelAttribute="user"
               action="/debtor/register">
    <div class="body">
        <article class="col-md-8 mx-auto">
            <div class="form-group">
                <label>Username</label>
                <form:input path="username" cssClass="form-control"/>
                <jstl:forEach items="${nameErrors}" var="error">
                    <span class="error">${error}</span>
                </jstl:forEach>
                <br>
                <label>Password</label>
                <form:password path="password" cssClass="form-control"/>
                <jstl:forEach items="${pwdErrors}" var="error">
                    <span class="error">${error}</span><br>
                </jstl:forEach>
                <label>Confirm Password</label>
                <input type="password" name="confirmPassword" class="form-control">
                <jstl:forEach items="${cnfErrors}" var="error">
                    <span class="error">${error}</span>
                </jstl:forEach>
                <br>
                <input class="btn btn-primary" type="submit" value="Submit">

                <br><br>
                <p class="text-muted">Already have an account? <a href="/" class="link-success">Login here</a></p>
            </div>
        </article>
    </div>
    </form:form>

    <div class="container">
        <hr>
        <span class="text-muted">Debtor Maintenance</span>
        <br>
    </div>
<%@ include file="include/script_tag.html"%>
</body>
</html>