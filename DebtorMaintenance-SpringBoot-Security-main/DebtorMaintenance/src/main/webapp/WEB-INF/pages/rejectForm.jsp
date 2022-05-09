<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html>
<head>
<title>
    Reject Reason
</title>
    <%@ include file="include/head_tag.html"%>
    <style>
        body{
            background-color:#ededed;
        }
        .rejectForm {
            width: 100%;
            max-width: 1000px;
            padding: 15px;
            margin: auto;
            border-radius: 10px;
            background-color: whitesmoke;
        }
    </style>
</head>
<body>
<div class="container">

    <%--@elvariable id="transaction" type="project.bfour.debtormaintenance.model.Transaction"--%>
    <form:form cssClass="rejectForm shadow-lg bg-body rounded" action="/admin/debtor/reject"
               method="post" modelAttribute="transaction">
        <form:hidden path="id"/>
        <form:hidden path="dateTime"/>
        <form:hidden path="status"/>
        <div class="form-group">
            <label>Reject Reason<span style="color: red">&nbsp;*</span></label>
            <form:textarea path="information" cssClass="form-control" rows="3"/>
        </div>
        <br>
        <br>
        <input type="submit" value="Reject" class="btn btn-danger">
        <input type="button" value="Cancel" class="btn btn-secondary" onclick="history.back()">
    </form:form>

</div>
<%@ include file="include/script_tag.html"%>
</body>
</html>