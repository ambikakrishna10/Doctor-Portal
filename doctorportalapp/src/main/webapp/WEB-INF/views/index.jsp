<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Registration</title>

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

.container {
    max-width: 850px;
    width: 100%;
    margin: 0 auto;
    background: #fff;
    padding: 28px 35px;
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

.form-group input,
.form-group select {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid #d5deeb;
    border-radius: 6px;
    font-size: 14px;
    background: #fff;
    color: #333;
    outline: none;
}

.form-group input:focus,
.form-group select:focus {
    border-color: #2457a7;
    box-shadow: 0 0 0 3px rgba(36, 87, 167, 0.10);
}

.form-actions {
    margin-top: 25px;
    display: flex;
    gap: 15px;
}

.form-actions button,
.form-actions a {
    flex: 1;
    padding: 12px;
    border-radius: 6px;
    font-size: 15px;
    font-weight: 600;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
}

.form-actions button {
    background: #2457a7;
    color: white;
    border: none;
}

.form-actions button:hover {
    background: #173d78;
}

.view-btn {
    background: #198754;
    color: white;
}

.view-btn:hover {
    background: #146c43;
}

@media (max-width: 600px) {
    .container {
        padding: 22px 18px;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .form-actions {
        flex-direction: column;
    }

    h2 {
        font-size: 22px;
    }
}
</style>

</head>

<body>

<div class="container">

    <h2>Doctor Registration Form</h2>

    <form action="<%=request.getContextPath()%>/insertDoctor"
          method="post">

        <div class="form-grid">

            <div class="form-group">
                <label>Doctor Name</label>
                <input type="text" name="doctorName" required>
            </div>

            <div class="form-group">
                <label>Doctor Age</label>
                <input type="number" name="doctorAge"
                       min="1" required>
            </div>

            <div class="form-group">
                <label>Doctor Gender</label>
                <select name="doctorGender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="form-group">
                <label>Mobile Number</label>
                <input type="tel"
                       name="doctorMobileNumber"
                       pattern="[0-9]{10}"
                       maxlength="10"
                       placeholder="Enter 10-digit mobile number"
                       required>
            </div>

            <div class="form-group">
                <label>Consultation Fee</label>
                <input type="number"
                       name="doctorConsultationFee"
                       min="0" step="0.01" required>
            </div>

            <div class="form-group">
                <label>Hospital Name</label>
                <input type="text"
                       name="doctorHospitalName" required>
            </div>

            <div class="form-group">
                <label>Department</label>
                <input type="text"
                       name="doctorDepartment" required>
            </div>

            <div class="form-group">
                <label>Availability</label>
                <select name="doctorAvailability" required>
                    <option value="">Select Availability</option>
                    <option value="Available">Available</option>
                    <option value="Not Available">Not Available</option>
                </select>
            </div>

            <div class="form-group">
                <label>Doctor Shift</label>
                <select name="doctorShift" required>
                    <option value="">Select Shift</option>
                    <option value="Morning">Morning</option>
                    <option value="Afternoon">Afternoon</option>
                    <option value="Night">Night</option>
                </select>
            </div>

        </div>

        <div class="form-actions">

            <button type="submit">Register Doctor</button>

            <a class="view-btn"
               href="<%=request.getContextPath()%>/viewDoctors">
                View All Doctors
            </a>

        </div>

    </form>

</div>

</body>
</html>