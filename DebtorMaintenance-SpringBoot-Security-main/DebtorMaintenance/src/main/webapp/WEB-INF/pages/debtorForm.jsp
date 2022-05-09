<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <%@ include file="include/head_tag.html"%>
    <title>Debtor Form</title>
    <style>
        body{
            background-color:#ededed;
        }
        .debtorform {
            width: 100%;
            max-width: 80%;
            padding: 15px;
            margin: auto;
            border-radius: 10px;
            background-color: whitesmoke;
        }
        .error {
            color: red;
        }
    </style>

</head>
<body>
<%@ include file="include/debtor_nav.html"%>

<div class="container">
    <h3 style="text-align: center">Debtor Form</h3>

    <%--@elvariable id="debtorform" type="project.bfour.debtormaintenance.model.DebtorForm"--%>
    <form:form cssClass="debtorform shadow-lg p-3 mb-5 bg-body rounded" method="post" action="/debtor/transaction"
               modelAttribute="debtorform">
        <h4>Personal Details</h4>
        <hr>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Name<span style="color: red">&nbsp;*</span></label>
            <div class="col-sm-10">
                <form:input path="name" cssClass="form-control"/>
                <form:errors path="name" cssClass="error"/>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Address 1<span style="color: red">&nbsp;*</span></label>
            <div class="col-sm-10">
                <form:input path="address1" cssClass="form-control"/>
                <form:errors path="address1" cssClass="error"/>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Address 2</label>
            <div class="col-sm-10">
                <form:input path="address2" cssClass="form-control"/>
                <form:errors path="address2" cssClass="error"/>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Fax</label>
            <div class="col-sm-10">
                <form:input path="fax" cssClass="form-control"/>
                <form:errors path="fax" cssClass="error"/>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Phone<span style="color: red">&nbsp;*</span></label>
            <div class="col-sm-10">
                <form:input path="phone" cssClass="form-control"/>
                <form:errors path="phone" cssClass="error"/>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Email<span style="color: red">&nbsp;*</span></label>
            <div class="col-sm-10">
                <form:input path="email" cssClass="form-control"/>
                <form:errors path="email" cssClass="error"/>
            </div>
        </div>
        <h4>Bank Details</h4>
        <hr>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Account Number<span style="color: red">&nbsp;*</span></label>
            <div class="col-sm-10">
                <form:input path="bankAccount.number" cssClass="form-control"/>
                <form:errors path="bankAccount.number" cssClass="error"/>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Bank Name<span style="color: red">&nbsp;*</span></label>
            <div class="col-sm-10">
                <form:input path="bankAccount.bankName" cssClass="form-control"/>
                <form:errors path="bankAccount.bankName" cssClass="error"/>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Branch Name<span style="color: red">&nbsp;*</span></label>
            <div class="col-sm-10">
                <form:input path="bankAccount.branchName" cssClass="form-control"/>
                <form:errors path="bankAccount.branchName" cssClass="error"/>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">IFSC<span style="color: red">&nbsp;*</span></label>
            <div class="col-sm-10">
                <form:input path="bankAccount.swiftAddress" cssClass="form-control"/>
                <form:errors path="bankAccount.swiftAddress" cssClass="error"/>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Currency<span style="color: red">&nbsp;*</span></label>
            <div class="col-sm-10">
                <form:select path="bankAccount.accountCurrency" cssClass="form-select">
                    <form:option value="INR">&#8377;</form:option>
                    <form:option value="EURO">&euro;</form:option>
                    <form:option value="USD">&#36;</form:option>
                </form:select>
                <form:errors path="bankAccount.accountCurrency" cssClass="error"/>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="reset" class="btn btn-secondary">Clear</button>
    </form:form>

    <hr>
    <span class="text-muted">Debtor Maintenance</span>
    <br><br>
</div>

<%@ include file="include/script_tag.html"%>
</body>
</html>
