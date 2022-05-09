<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Form Updates</title>
  <%@ include file="include/head_tag.html"%>
  <style>
    body{
      background-color:#ededed;
    }
    a{
      text-decoration: none;
    }
    p[about='P'] {
      color:#664d03;
      background-color:#fff3cd;
      border-color:#ffecb5
    }
    p[about="R"] {
      color:#842029;background-color:#f8d7da;border-color:#f5c2c7
    }
    p[about="A"] {
      color:#0f5132;
      background-color:#d1e7dd;
      border-color:#badbcc
    }
  </style>
</head>
<body>
<%@ include file="include/admin_nav.html"%>
<div class="container">
  <jstl:if test="${authorized!=null}">
    <div class="alert alert-success" role="alert">
        ${authorized}
    </div>
  </jstl:if>

  <jstl:if test="${rejected!=null}">
    <div class="alert alert-danger" role="alert">
        ${rejected}
    </div>
  </jstl:if>
  <%if (request.getAttribute("debtorList").toString().equals("[]")){%>
  <h2>No pending forms!</h2>
  <%} else {%>
  <c:forEach items="${debtorList}" var="debtor">
    <div class="row row-cols-1 justify-content-evenly">
      <div class="card col-8 shadow-lg bg-body rounded" style="padding: 0">
        <div class="card-header">
          <strong>Transaction ID:</strong> ${debtor.getTransaction().getId()}
        </div>
        <div class="card-body">
          <div class="row mb-3">
            <label for="debtorName" class="col-sm-5 col-form-label">Debtor Form Id</label>
            <div class="col-sm-7">
              <p class="form-control" id="debtorId" style="margin-bottom: 0">${debtor.getId()}</p>
            </div>
          </div>
          <div class="row mb-3">
            <label for="debtorName" class="col-sm-5 col-form-label">Debtor Name</label>
            <div class="col-sm-7">
              <p class="form-control" id="debtorName" style="margin-bottom: 0">${debtor.getName()}</p>
            </div>
          </div>
          <div class="row mb-3">
            <label for="debtorName" class="col-sm-5 col-form-label">Status</label>
            <div class="col-sm-7">
              <p class="form-control" id="status" about="${debtor.getTransaction().getStatus()}"
                 style="margin-bottom: 0">${debtor.getTransaction().getStatus()}</p>
            </div>
          </div>
          <div class="row mb-3">
            <label for="debtorName" class="col-sm-5 col-form-label">Date</label>
            <div class="col-sm-7">
              <p class="form-control" id="date" style="margin-bottom: 0">${debtor.getTransaction().getDateTime()}</p>
            </div>
          </div>
          <div class="button text-center">
            <button class="btn btn-secondary" id="viewmore">
              <a class="link-light" href="/admin/debtor/form/details/${debtor.getTransaction().getId()}">
                View Details</a></button>
            <button class="btn btn-success" id="authorize">
              <a class="link-light" href="/admin/debtor/authorize/${debtor.getTransaction().getId()}">
                Authorize</a></button>
            <button class="btn btn-danger" id="reject">
              <a class="link-light" href="/admin/debtor/reject-form/${debtor.getTransaction().getId()}">
                Reject</a></button>
          </div>
        </div>
      </div>
    </div><br>
  </c:forEach>
  <%}%>

  <hr>
  <span class="text-muted">Debtor Maintenance</span>
  <br><br>
</div>

<%@ include file="include/script_tag.html"%>
</body>
</html>
