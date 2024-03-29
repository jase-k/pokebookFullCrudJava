<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>PokeBook</title>
</head>
<body>
<h1>PokeBook</h1>
<table class="table">
	<thead>
		<tr>
			<th>Expense</th>
			<th>Vendor</th>
			<th>Amount</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="expense" items="${expenses}" >
		<tr>
			<td><c:out value="${expense.name}" ></c:out></td>
			<td><c:out value="${expense.vendor }"></c:out></td>
			<td>$<c:out value="${expense.amount }"></c:out></td>
			<td><a href="/expense/${expense.id}/edit">Edit</a></td>
		</tr>
		
		</c:forEach>
	</tbody>
</table>
<h2>Track an expense</h2>
<form:form action="/new_expense" method="post" modelAttribute="expense">
    <p>
        <form:label path="name">Expense</form:label>
        <form:errors path="name"/>
        <form:input path="name"/>
    </p>
    <p>
        <form:label path="vendor">Vendor</form:label>
        <form:errors path="vendor"/>
        <form:input path="vendor"/>
    </p>
    <p>
        <form:label path="amount">Amount</form:label>
        <form:errors path="amount"/>     
        <form:input type="number" step="any" path="amount"/>
    </p>  
    <p>
        <form:label path="description">Description</form:label>
        <form:errors path="description"/>     
        <form:textarea path="description"/>
    </p>    
    <input type="submit" value="Submit"/>
</form:form>    

</body>
</html>