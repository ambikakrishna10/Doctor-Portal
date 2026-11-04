
package com.doctorportal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

public class DoctorDAO {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Insert Doctor
    public int insertDoctor(Doctor d) {

        String sql = "INSERT INTO doctor "
                + "(doctor_name, doctor_age, doctor_mobile_number, "
                + "doctor_gender, doctor_consultation_fee, "
                + "doctor_hospital_name, doctor_department, "
                + "doctor_availability, doctor_shift) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        return jdbcTemplate.update(sql,
                d.getDoctorName(),
                d.getDoctorAge(),
                d.getDoctorMobileNumber(),
                d.getDoctorGender(),
                d.getDoctorConsultationFee(),
                d.getDoctorHospitalName(),
                d.getDoctorDepartment(),
                d.getDoctorAvailability(),
                d.getDoctorShift()
        );
    }

    // Get All Doctors
    public List<Doctor> getAllDoctors() {

        List<Doctor> doctors = new ArrayList<>();

        String sql = "SELECT * FROM doctor";

        try (Connection con = jdbcTemplate.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Doctor d = new Doctor();

                d.setDoctorId(rs.getInt("doctor_id"));
                d.setDoctorName(rs.getString("doctor_name"));
                d.setDoctorAge(rs.getInt("doctor_age"));
                d.setDoctorMobileNumber(rs.getString("doctor_mobile_number"));
                d.setDoctorGender(rs.getString("doctor_gender"));
                d.setDoctorConsultationFee(rs.getDouble("doctor_consultation_fee"));
                d.setDoctorHospitalName(rs.getString("doctor_hospital_name"));
                d.setDoctorDepartment(rs.getString("doctor_department"));
                d.setDoctorAvailability(rs.getString("doctor_availability"));
                d.setDoctorShift(rs.getString("doctor_shift"));

                doctors.add(d);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return doctors;
    }

    // Get Doctor By ID
    public Doctor getDoctorById(int doctorId) {

        Doctor doctor = null;

        String sql = "SELECT * FROM doctor WHERE doctor_id = ?";

        try (Connection con = jdbcTemplate.getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, doctorId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    doctor = new Doctor();

                    doctor.setDoctorId(rs.getInt("doctor_id"));
                    doctor.setDoctorName(rs.getString("doctor_name"));
                    doctor.setDoctorAge(rs.getInt("doctor_age"));
                    doctor.setDoctorMobileNumber(rs.getString("doctor_mobile_number"));
                    doctor.setDoctorGender(rs.getString("doctor_gender"));
                    doctor.setDoctorConsultationFee(rs.getDouble("doctor_consultation_fee"));
                    doctor.setDoctorHospitalName(rs.getString("doctor_hospital_name"));
                    doctor.setDoctorDepartment(rs.getString("doctor_department"));
                    doctor.setDoctorAvailability(rs.getString("doctor_availability"));
                    doctor.setDoctorShift(rs.getString("doctor_shift"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return doctor;
    }

    // Update Doctor
    public int updateDoctor(Doctor d) {

        String sql = "UPDATE doctor SET "
                + "doctor_name = ?, "
                + "doctor_age = ?, "
                + "doctor_mobile_number = ?, "
                + "doctor_gender = ?, "
                + "doctor_consultation_fee = ?, "
                + "doctor_hospital_name = ?, "
                + "doctor_department = ?, "
                + "doctor_availability = ?, "
                + "doctor_shift = ? "
                + "WHERE doctor_id = ?";

        return jdbcTemplate.update(sql,
                d.getDoctorName(),
                d.getDoctorAge(),
                d.getDoctorMobileNumber(),
                d.getDoctorGender(),
                d.getDoctorConsultationFee(),
                d.getDoctorHospitalName(),
                d.getDoctorDepartment(),
                d.getDoctorAvailability(),
                d.getDoctorShift(),
                d.getDoctorId()
        );
    }

    // Delete Doctor
    public int deleteDoctor(int doctorId) {

        String sql = "DELETE FROM doctor WHERE doctor_id = ?";

        return jdbcTemplate.update(sql, doctorId);
    }
}
