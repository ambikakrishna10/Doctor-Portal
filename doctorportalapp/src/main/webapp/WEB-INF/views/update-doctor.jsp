<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor Details</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: #f2f6fc;
    min-height: 100vh;
    padding: 25px 15px;
    color: #333;
}

.update-container {
    max-width: 850px;
    width: 100%;
    margin: 0 auto;
    padding: 28px 35px;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 5px 25px rgba(36, 87, 167, 0.10);
}

h2 {
    text-align: center;
    color: #2457a7;
    font-size: 26px;
    margin-bottom: 25px;
}

.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    column-gap: 25px;
    row-gap: 13px;
}

.form-group label {
    display: block;
    margin-bottom: 6px;
    font-size: 14px;
    font-weight: 600;
    color: #344563;
}

.form-group input {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid #d5deeb;
    border-radius: 6px;
    font-size: 14px;
    background: #fff;
    color: #333;
}

.form-group input:focus {
    outline: none;
    border-color: #2457a7;
    box-shadow: 0 0 0 3px rgba(36, 87, 167, 0.10);
}

.form-group input[readonly] {
    background: #f0f2f5;
    cursor: not-allowed;
}

.form-actions {
    margin-top: 25px;
}

.form-actions button {
    width: 100%;
    padding: 12px;
    background: #2457a7;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s ease;
}

.form-actions button:hover {
    background: #173d78;
}

@media (max-width: 600px) {
    .update-container {
        padding: 22px 18px;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    h2 {
        font-size: 22px;
    }
}
</style>

</head>

<body>

<div class="update-container">

    <h2>Edit Doctor Details</h2>

    <form action="<%=request.getContextPath()%>/updateDoctorDetails"
          method="post">

        <div class="form-grid">

            <div class="form-group">
                <label>Doctor ID</label>
                <input type="text"
                       name="doctorId"
                       value="${doctor.doctorId}"
                       readonly>
            </div>

            <div class="form-group">
                <label>Doctor Name</label>
                <input type="text"
                       name="doctorName"
                       value="${doctor.doctorName}"
                       required>
            </div>

            <div class="form-group">
                <label>Doctor Age</label>
                <input type="number"
                       name="doctorAge"
                       min="1"
                       value="${doctor.doctorAge}"
                       required>
            </div>

            <div class="form-group">
                <label>Doctor Gender</label>
                <input type="text"
                       name="doctorGender"
                       value="${doctor.doctorGender}"
                       required>
            </div>

            <div class="form-group">
                <label>Mobile Number</label>
                <input type="tel"
                       name="doctorMobileNumber"
                       value="${doctor.doctorMobileNumber}"
                       pattern="[0-9]{10}"
                       maxlength="10"
                       required>
            </div>

            <div class="form-group">
                <label>Consultation Fee</label>
                <input type="number"
                       name="doctorConsultationFee"
                       step="0.01"
                       min="0"
                       value="${doctor.doctorConsultationFee}"
                       required>
            </div>

            <div class="form-group">
                <label>Hospital Name</label>
                <input type="text"
                       name="doctorHospitalName"
                       value="${doctor.doctorHospitalName}"
                       required>
            </div>

            <div class="form-group">
                <label>Department</label>
                <input type="text"
                       name="doctorDepartment"
                       value="${doctor.doctorDepartment}"
                       required>
            </div>

            <div class="form-group">
                <label>Availability</label>
                <input type="text"
                       name="doctorAvailability"
                       value="${doctor.doctorAvailability}"
                       required>
            </div>

            <div class="form-group">
                <label>Doctor Shift</label>
                <input type="text"
                       name="doctorShift"
                       value="${doctor.doctorShift}"
                       required>
            </div>

        </div>

        <div class="form-actions">
            <button type="submit">Update Doctor</button>
        </div>

    </form>

</div>

</body>
</html>