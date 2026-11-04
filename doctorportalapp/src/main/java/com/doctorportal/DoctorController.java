package com.doctorportal;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DoctorController {

	@Autowired
	private DoctorDAO doctorDAO;

	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	// Registration
	@GetMapping("/registerDoctor")
	public String registerDoctor() {
	    return "index";
	}

	// Insert Doctor
    @PostMapping("/insertDoctor")
    public String insertDoctor(@ModelAttribute Doctor doctor) {

        int result = doctorDAO.insertDoctor(doctor);

        if (result > 0) {
            return "redirect:/viewDoctors?inserted=true";
        }

        return "redirect:/?insertError=true";
    }

    // View All Doctors and Search Doctor by ID
    @GetMapping("/viewDoctors")
    public String viewDoctors(
            @RequestParam(value = "doctorId", required = false) Integer doctorId,
            Model model) {

        List<Doctor> doctors = new ArrayList<>();

        if (doctorId != null) {

            Doctor doctor = doctorDAO.getDoctorById(doctorId);

            if (doctor != null) {
                doctors.add(doctor);
            } else {
                model.addAttribute("message",
                        "No Doctor Found With This ID!");
            }

            model.addAttribute("searchedDoctorId", doctorId);

        } else {
            doctors = doctorDAO.getAllDoctors();
        }

        model.addAttribute("doctors", doctors);

        return "doctors";
    }

    // Open Update Page
    @GetMapping("/editDoctor")
    public String editDoctor(
            @RequestParam("doctorId") int doctorId,
            Model model) {

        Doctor doctor = doctorDAO.getDoctorById(doctorId);

        if (doctor != null) {
            model.addAttribute("doctor", doctor);
            return "update-doctor";
        }

        return "redirect:/viewDoctors";
    }

    // Update Doctor Details
    @PostMapping("/updateDoctorDetails")
    public String updateDoctorDetails(
            @ModelAttribute Doctor doctor) {

        int result = doctorDAO.updateDoctor(doctor);

        if (result > 0) {
            return "redirect:/viewDoctors?updated=true";
        }

        return "redirect:/viewDoctors?updateError=true";
    }

    // Delete Doctor
    @PostMapping("/deleteDoctorDetails")
    public String deleteDoctorDetails(
            @RequestParam("doctorId") int doctorId) {

        int result = doctorDAO.deleteDoctor(doctorId);

        if (result > 0) {
            return "redirect:/viewDoctors?deleted=true";
        }

        return "redirect:/viewDoctors?deleteError=true";
    }
}