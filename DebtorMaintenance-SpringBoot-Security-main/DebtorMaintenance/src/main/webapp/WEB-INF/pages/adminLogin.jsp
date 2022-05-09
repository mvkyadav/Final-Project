<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Debtor Maintenance</title>
    <%@include file="include/head_tag.html"%>
    <style>
        <%@include file="include/styles.css"%>
    </style>
</head>
<body>
<div class="wrapper">
    <jstl:if test="${param.get(\"loggedOut\") != null}">
    <div class="alert alert-success" role="alert">
        You have been logged out!
    </div>
    </jstl:if>
    <header>
        <article class="col-md-4 mx-auto">
            <h1 class=" text-center text-uppercase text-primary pb-2 pt-2">Admin Login</h1>
        </article>
    </header>

    <%--@elvariable id="user" type="project.bfour.debtormaintenance.model.User"--%>
    <form:form action="/admin/login" method="post" cssClass="form-signin shadow-lg p-3 mb-5  bg-body rounded"
               modelAttribute="user">
    <div class="body">
        <article class="col-md-8 mx-auto">
            <div class="form-group">
                <label>Username</label>
                <form:input path="username" cssClass="form-control"/>
                <br>
                <label>Password</label>
                <form:password path="password" cssClass="form-control"/>
                <jstl:if test="${param.containsKey('error')}">
                    <span style="color: red">Invalid credentials!</span>
                </jstl:if>
                <br>
                <input  class="btn btn-warning" type="submit" value="Login"/>&nbsp;&nbsp;
                <input  class="btn btn-success" type="button" id="debtor" value="Debtor Login"/>
            </div>
        </article>
    </div>
    </form:form>
    <div class="container">
        <hr>
        <span class="text-muted">Debtor Maintenance</span>
        <br><br>
    </div>
    <script>
        document.querySelector("#debtor").addEventListener("click", function (){
            location.href="/"; // todo admin page redirect
        })
    </script>
    <%@include file="include/script_tag.html"%>
</body>
</html>
