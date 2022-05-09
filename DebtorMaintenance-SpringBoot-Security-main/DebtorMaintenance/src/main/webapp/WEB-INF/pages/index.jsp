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
        .error {
            color: red;
        }
    </style>
</head>
<body>
<div class="wrapper">
        <jstl:if test="${registered != null}">
            <div class="alert alert-success" role="alert">
                ${registered}
            </div>
        </jstl:if>
        <jstl:if test="${param.get(\"loggedOut\") != null}">
        <div class="alert alert-success" role="alert">
                You have been logged out!
        </div>
        </jstl:if>
    <header>
        <article class="col-md-4 mx-auto">
            <h1 class=" text-center text-uppercase text-success pb-2 pt-2">Login</h1>
        </article>
    </header>

    <%--@elvariable id="user" type="project.bfour.debtormaintenance.model.User"--%>
    <form:form action="/" method="post" cssClass="form-signin shadow-lg p-3 mb-5  bg-body rounded"
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
                        <span class="error">Invalid credentials!</span><br>
                    </jstl:if>
                    <br>
                    <input  class="btn btn-success" type="submit" value="Login"/>&nbsp;&nbsp

                    <input  class="btn btn-warning" type="button" id="admin" value="Admin Login"/>

                    <br><br>
                    <p class="text-muted">Don't have an account?
                        <a href="${pageContext.request.contextPath}/debtor/register"
                           class="link-primary">Register here</a></p>
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
        document.querySelector("#admin").addEventListener("click", function (){
            location.href="/admin/login";
        })
    </script>
<%@include file="include/script_tag.html"%>
</body>
</html>
