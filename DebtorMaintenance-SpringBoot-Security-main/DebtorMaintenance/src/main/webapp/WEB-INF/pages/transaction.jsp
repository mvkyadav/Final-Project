<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%@ include file="include/head_tag.html"%>
    <title>Transaction Details</title>
    <style>
        body{
            background-color:#ededed;
        }
        .debtorform {
            width: 100%;
            max-width: 1000px;
            padding: 15px;
            margin: auto;
            border-radius: 10px;
            border-style: outset;
            background-color: whitesmoke;
        }
    </style>
</head>
<body>
<%@ include file="include/debtor_nav.html"%>

<%--@elvariable id="debtorform" type="project.bfour.debtormaintenance.model.DebtorForm"--%>
<form:form cssClass="debtorform shadow-lg bg-body rounded" action="/debtor/form" method="post"
           modelAttribute="debtorform">
    <h4>Transaction Details</h4>
    <hr>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label"><strong>Transaction ID</strong></label>
        <div class="col-sm-10">
            <form:input path="transaction.id" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Date/Time</label>
        <div class="col-sm-10">
            <form:input path="transaction.dateTime" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Status</label>
        <div class="col-sm-10">
            <form:input path="transaction.status" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Information</label>
        <div class="col-sm-10">
            <form:input path="transaction.information" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <hr>
    <h3 style="text-align: center;">Confirm Details</h3>
    <hr>
    <h5>Personal Details</h5>
    <hr>
<%--    <div class="row mb-3">--%>
<%--        <label class="col-sm-2 col-form-label"><strong>DebtorID</strong></label>--%>
<%--        <div class="col-sm-10">--%>
<%--            <form:input path="id" readonly="true" cssClass="form-control"/>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Name</label>
        <div class="col-sm-10">
            <form:input path="name" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Address 1</label>
        <div class="col-sm-10">
            <form:input path="address1" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Address 2</label>
        <div class="col-sm-10">
            <form:input path="address2" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Fax</label>
        <div class="col-sm-10">
            <form:input path="fax" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Phone</label>
        <div class="col-sm-10">
            <form:input path="phone" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-10">
            <form:input path="email" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <h5>Bank Details</h5>
    <hr>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Account Number</label>
        <div class="col-sm-10">
            <form:input path="bankAccount.number" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Bank Name</label>
        <div class="col-sm-10">
            <form:input path="bankAccount.bankName" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Branch Name</label>
        <div class="col-sm-10">
            <form:input path="bankAccount.branchName" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">IFSC</label>
        <div class="col-sm-10">
            <form:input path="bankAccount.swiftAddress" readonly="true" cssClass="form-control"/>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label">Currency</label>
        <div class="col-sm-10">
            <form:input path="bankAccount.accountCurrency" readonly="true" cssClass="form-control"/>
        </div>
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
    <button type="button" class="btn btn-secondary" onclick="history.back()">Back</button>
    <button type="button" class="btn btn-danger" onclick="myFunc()">Cancel</button>
</form:form>
<script>
    function myFunc() {
        window.location.href = "/debtor/form";
    }
</script>
<%@ include file="include/script_tag.html"%>
</body>
</html>
