 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Doctors</title>

<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f6fc;
    padding: 25px;
}

.container {
    width: 95%;
    margin: auto;
    background-color: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 0 10px #ccc;
    overflow-x: auto;
}

h2 {
    text-align: center;
    color: #2457a7;
}

.search-box {
    margin-top: 25px;
    margin-bottom: 20px;
    text-align: center;
}

.search-box input {
    padding: 10px;
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button, .btn {
    border: none;
    padding: 9px 14px;
    border-radius: 5px;
    color: white;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
}

.search-btn {
    background-color: #2457a7;
}

.update-btn {
    background-color: #e69b16;
}

.delete-btn {
    background-color: #dc3545;
}

.back-btn {
    background-color: #2457a7;
    margin-top: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 25px;
}

th, td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
    white-space: nowrap;
}

th {
    background-color: #2457a7;
    color: white;
}

tr:nth-child(even) {
    background-color: #f2f6fc;
}

.message {
    text-align: center;
    margin-top: 15px;
    color: #2457a7;
    font-weight: bold;
}

/* Delete confirmation popup */

.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
}

.modal-card {
    background-color: white;
    width: 350px;
    padding: 25px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0 0 15px #555;
}

.modal-card h3 {
    color: #dc3545;
}

.cancel-btn {
    background-color: gray;
}

.confirm-btn {
    background-color: #dc3545;
}

.modal-actions {
    margin-top: 25px;
    display: flex;
    justify-content: center;
    gap: 15px;
}
</style>

</head>

<body>

<div class="container">

    <h2>Registered Doctors</h2>

    <!-- Search Doctor by ID -->

    <div class="search-box">

        <form action="<%=request.getContextPath()%>/viewDoctors"
              method="get">

            <input type="number" name="doctorId"
                   placeholder="Enter Doctor ID"
                   min="1" required>

            <button type="submit" class="search-btn">
                Find Doctor
            </button>

            <a href="<%=request.getContextPath()%>/viewDoctors"
               class="btn search-btn">
                View All
            </a>

        </form>

    </div>

    <!-- Messages -->

    <c:if test="${not empty message}">
        <h3 class="message">
            <c:out value="${message}"/>
        </h3>
    </c:if>

    <c:if test="${param.deleted == 'true'}">
        <h3 class="message">
            Doctor Deleted Successfully!
        </h3>
    </c:if>

    <c:if test="${param.deleteError == 'true'}">
        <h3 class="message">
            Unable to delete doctor!
        </h3>
    </c:if>

    <!-- Doctors Table -->

    <!-- Doctors Table -->
	<table>
	    <tr>
	        <th>Doctor ID</th>
	        <th>Name</th>
	        <th>Age</th>
	        <th>Gender</th>
	        <th>Mobile Number</th>
	        <th>Consultation Fee</th>
	        <th>Hospital</th>
	        <th>Department</th>
	        <th>Availability</th>
	        <th>Shift</th>
	        <th>Actions</th>
	    </tr>
	
	    <c:forEach var="doctor" items="${doctors}">
	        <tr>
	            <td>${doctor.doctorId}</td>
	            <td><c:out value="${doctor.doctorName}"/></td>
	            <td>${doctor.doctorAge}</td>
	            <td><c:out value="${doctor.doctorGender}"/></td>
	            <td><c:out value="${doctor.doctorMobileNumber}"/></td>
	            <td>${doctor.doctorConsultationFee}</td>
	            <td><c:out value="${doctor.doctorHospitalName}"/></td>
	            <td><c:out value="${doctor.doctorDepartment}"/></td>
	            <td><c:out value="${doctor.doctorAvailability}"/></td>
	            <td><c:out value="${doctor.doctorShift}"/></td>
	
	            <td>
	                <!-- Update Button -->
	                <a class="btn update-btn"
	                   href="<%=request.getContextPath()%>/editDoctor?doctorId=${doctor.doctorId}">
	                    Update
	                </a>
	
	                <!-- Delete Button -->
	                <button type="button"
	                        class="delete-btn"
	                        onclick="openDeletePopup('${doctor.doctorId}')">
	                    Delete
	                </button>
	            </td>
	        </tr>
	    </c:forEach>
	</table>

    <c:if test="${empty doctors}">
        <h3 style="text-align:center; color:gray;">
            No doctors found!
        </h3>
    </c:if>

    <a href="<%=request.getContextPath()%>/"
       class="btn back-btn">
        Back to Home
    </a>

</div>

<!-- Delete Confirmation Popup -->

<div id="deleteModal" class="modal">

    <div class="modal-card">

        <h3>Confirm Delete</h3>

        <p>Are you sure you want to delete this record?</p>

        <form action="<%=request.getContextPath()%>/deleteDoctorDetails"
              method="post">

            <input type="hidden" name="doctorId" id="deleteDoctorId">

            <div class="modal-actions">

                <button type="button"
                        class="cancel-btn"
                        onclick="closeDeletePopup()">
                    Cancel
                </button>

                <button type="submit" class="confirm-btn">
                    Yes, Delete
                </button>

            </div>

        </form>

    </div>

</div>

<script>

function openDeletePopup(doctorId) {

    document.getElementById("deleteDoctorId").value = doctorId;

    document.getElementById("deleteModal").style.display = "flex";

}

function closeDeletePopup() {

    document.getElementById("deleteModal").style.display = "none";

}

</script>

</body>
</html>