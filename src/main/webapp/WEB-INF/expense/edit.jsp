<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table class="table">
	<tr>
		<td><h1>Edit Expense</h1></td>
		<td><a href="/">Go Back</a></td>
	</tr>
</table>
<form:form action="/update_expense" method="post" modelAttribute="expense">
    <p>
        <form:errors path="id"/>
        <form:input type="hidden" path="id" value="${expense.id}"/>
    </p>
    <p>
        <form:label path="name">Expense</form:label>
        <form:errors path="name"/>
        <form:input path="name" value="${expense.name}"/>
    </p>
    <p>
        <form:label path="vendor">Vendor</form:label>
        <form:errors path="vendor"/>
        <form:input path="vendor" value="${expense.vendor}"/>
    </p>
    <p>
        <form:label path="amount">Amount</form:label>
        <form:errors path="amount"/>     
        <form:input type="number" step="any" path="amount" value="${expense.amount}"/>
    </p>
    <p>
        <form:label path="description">Description</form:label>
        <form:errors path="description"/>     
        <form:textarea path="description"/>
    </p> 
    <input type="submit" value="Update"/>
</form:form>    
</body>
</html>