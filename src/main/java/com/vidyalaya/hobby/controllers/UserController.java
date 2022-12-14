package com.vidyalaya.hobby.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vidyalaya.hobby.entities.User;
import com.vidyalaya.hobby.services.ProfileService;
import com.vidyalaya.hobby.services.SecurityService;
import com.vidyalaya.hobby.services.SkillService;
import com.vidyalaya.hobby.util.EmailUtility;

@Controller
public class UserController {

	@Autowired
	ProfileService profileService;

	@Autowired
	SkillService skillService;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Autowired
	private SecurityService securityService;

	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	@RequestMapping("/reset_password")
	public String resetPassword() {
		return "login/reset_password";
	}
	
	@RequestMapping("/support")
	public String userSupport() {
		return "login/support";
	}
	
	@RequestMapping(value = "/handle_reset_password", method = RequestMethod.POST)
		public String handlePasswordReset(ModelMap modelMap) {
		
		String recipient = ""; //Sender Your email 
        String subject = "Your Password has been reset";

        String newPassword="";
 
        String content = "Hi, this is your new password: " + newPassword;
        content += "\nNote: for security reason, "
                + "you must change your password after logging in.";
 
        String message = "";
 
        try {
        	EmailUtility.sendEmail("smtp.gmail.com", "587", "kumar.manish1998@gmail.com", "Manish Kumar ", "kmaish98",
                    recipient, subject, content);
            message = "Your password has been reset. Please check your e-mail.";
        } catch (Exception ex) {
            ex.printStackTrace();
            message = "There were an error: " + ex.getMessage();
        }    
        
        return "success";
	}
	@RequestMapping("/showReg")
	public String showRegistration() {
		return "login/register";
	}
	
	
	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public String register(@ModelAttribute("user") User user) {
		user.setPassword(encoder.encode(user.getPassword()));
		profileService.saveUser(user);
		securityService.assignRoleToUser(user);
		return "redirect:/showLogin";
	}

	@RequestMapping(value = "/performLogin", method = RequestMethod.POST)
	public String login(@RequestParam("email") String email, @RequestParam("password") String password,
			ModelMap modelMap) {
		boolean loginResponse = securityService.login(email, password);
		if (loginResponse) {
			return "redirect:/showDashboard";
		}
		return "redirect:/showLogin?error=true";
	}

	@RequestMapping(value = "/showLogin")
	public String loginPage(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, ModelMap model) {
		String errorMessge = null;
		if (error != null) {
			errorMessge = "Username or Password is incorrect !!";
		}
		if (logout != null) {
			errorMessge = "You have been successfully logged out !!";
		}
		model.addAttribute("msg", errorMessge);
		return "login/login";
	}

	@RequestMapping("/showProfile")
	public String showInstructorProfile(ModelMap modelMap) {
		User user = profileService.fetchUser();
		modelMap.addAttribute("userDetails", user);
		return "profile/showProfile";
	}

	@RequestMapping("/showEditProfile")
	public String showEditProfile(ModelMap modelMap) {
		User user = profileService.fetchUser();
		modelMap.addAttribute("userDetails", user);
		return "profile/editProfile";
	}

	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("user") User user1, ModelMap modelMap) {
		LOGGER.info(user1.toString());
		User user = profileService.fetchUser();
		User updateUser = profileService.updateProfile(user, user1);
		modelMap.addAttribute("userDetails", updateUser);
		return "redirect:/showProfile";
	}

	@RequestMapping("/showDeleteProfile")
	public String showDeleteProfile() {
		return "profile/deleteProfile";
	}

	@RequestMapping("/deleteProfile")
	public String deleteProfile() {
		User user = profileService.fetchUser();
		SecurityContextHolder.getContext().setAuthentication(null);
		profileService.deleteUserById(user.getId());
		return "profile/deletedSuccessfully";
	}

	@RequestMapping("/showDashboard")
	public String showDashboard(ModelMap modelMap) {
		User user = profileService.fetchUser();
		List<String> trendingSkills = skillService.fetchTrendingSkills();
		modelMap.addAttribute("trendingSkills", trendingSkills);
		List<String> mySkills = skillService.fetchMySkills(user.getId());
		modelMap.addAttribute("mySkills", mySkills);
		return "dashboard";
	}

	@RequestMapping("/performLogout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/showLogin?logout=true";

	}

}
