<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <%@ include file="include/head_tag.html"%>
    <title>Debtor Details</title>
    <style>
        body{
            background-color:#ededed;
            margin-top: 2rem;
        }
        .debtorform {
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
<form class="debtorform shadow-lg p-3 md-5 bg-body rounded">
    <button type="button" class="btn btn-secondary" onclick="history.back()">Close</button>
        <br>
        <hr>
    <h5>Transaction Details</h5>
    <hr>
    <div class="row mb-3">
        <label for="transactionId" class="col-sm-2 col-form-label"><strong>Transaction ID</strong></label>
        <div class="col-sm-10">
            <p class="form-control" id="transactionId">${debtorform.transaction.id}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="transactionDateTime" class="col-sm-2 col-form-label">Date/Time</label>
        <div class="col-sm-10">
            <p class="form-control" id="transactionDateTime">${debtorform.getTransaction().getDateTime()}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="transactionStatus" class="col-sm-2 col-form-label">Status</label>
        <div class="col-sm-10">
            <p class="form-control" id="transactionStatus">${debtorform.getTransaction().getStatus()}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="transactionInfo" class="col-sm-2 col-form-label">Information</label>
        <div class="col-sm-10">
            <p class="form-control alert-info" id="transactionInfo">${debtorform.getTransaction().getInformation()}</p>
        </div>
    </div>
    <hr>
    <h5>Personal Details</h5>
    <hr>
    <div class="row mb-3">
        <label for="debtorId" class="col-sm-2 col-form-label"><strong>DebtorFormID</strong></label>
        <div class="col-sm-10">
            <p class="form-control" id="debtorId">${debtorform.getId()}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="name" class="col-sm-2 col-form-label">Name</label>
        <div class="col-sm-10">
            <p class="form-control" id="name">${debtorform.getName()}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="address1" class="col-sm-2 col-form-label">Address 1</label>
        <div class="col-sm-10">
            <p class="form-control" id="address1" >${debtorform.getAddress1()}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="address2" class="col-sm-2 col-form-label">Address 2</label>
        <div class="col-sm-10">
            <p class="form-control" id="address2">${debtorform.getAddress2()}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="fax" class="col-sm-2 col-form-label">Fax</label>
        <div class="col-sm-10">
            <p class="form-control" id="fax">${debtorform.getFax()}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="phone" class="col-sm-2 col-form-label">Phone</label>
        <div class="col-sm-10">
            <p class="form-control" id="phone" >${debtorform.getPhone()}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="email" class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-10">
            <p class="form-control" id="email" >${debtorform.getEmail()}</p>
        </div>
    </div>
        <hr>
    <h5>Bank Details</h5>
    <hr>
    <div class="row mb-3">
        <label for="accountNumber" class="col-sm-2 col-form-label"><strong>Account Number</strong></label>
        <div class="col-sm-10">
            <p class="form-control" id="accountNumber">${debtorform.getBankAccount().getNumber()}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="bankName" class="col-sm-2 col-form-label">Bank Name</label>
        <div class="col-sm-10">
            <p class="form-control" id="bankName">${debtorform.getBankAccount().getBankName()}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="branchName" class="col-sm-2 col-form-label">Branch Name</label>
        <div class="col-sm-10">
            <p class="form-control" id="branchName">${debtorform.getBankAccount().getBranchName()}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="ifsc" class="col-sm-2 col-form-label">IFSC</label>
        <div class="col-sm-10">
            <p class="form-control" id="ifsc">${debtorform.getBankAccount().getSwiftAddress()}</p>
        </div>
    </div>
    <div class="row mb-3">
        <label for="currency" class="col-sm-2 col-form-label">Currency</label>
        <div class="col-sm-10">
            <p class="form-control" id="currency">${debtorform.getBankAccount().getAccountCurrency()}</p>
        </div>
    </div>

    <button type="button" class="btn btn-secondary" onclick="history.back()">Close</button>

</form>

    <hr>
    <span class="text-muted">Debtor Maintenance</span>
    <br><br>

</div>
<%@ include file="include/script_tag.html"%>
<script>
    let stat = document.getElementById("transactionStatus").innerText;
    console.log(stat);
    if (stat==='P') {
        document.getElementById("transactionStatus").className = "form-control alert-warning";
    } else if (stat==='R') {
        document.getElementById("transactionStatus").className = "form-control alert-danger";
    } else {
        document.getElementById("transactionStatus").className = "form-control alert-success";
    }
</script>
</body>
</html>
