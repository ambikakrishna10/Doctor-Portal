<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Registration Successful</title>

<style>

body {
    font-family: Arial;
    background-color: #f2f6fc;
    text-align: center;
    padding-top: 100px;
}

.container {
    width: 450px;
    margin: auto;
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 10px #ccc;
}

h2 {
    color: green;
}

a {
    display: inline-block;
    margin-top: 20px;
    text-decoration: none;
    background-color: #2457a7;
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
}

</style>

</head>

<body>

<div class="container">

    <h2>Doctor Registered Successfully!</h2>

    <h3>Welcome, ${doctor.doctorName}</h3>

    <p>Doctor details have been inserted into the database.</p>

    <a href="${pageContext.request.contextPath}/">
        Register Another Doctor
    </a>

</div>

</body>
</html>