package project.bfour.debtormaintenance.controller;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.bfour.debtormaintenance.model.User;
import project.bfour.debtormaintenance.repository.UserRepository;

import javax.validation.Valid;
import javax.websocket.server.PathParam;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder encoder;

    final static Logger logger = LogManager.getLogger(LoginController.class);

    @RequestMapping("/debtor/register")
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "debtorRegister";
    }

    @RequestMapping(value = "/debtor/register", method = RequestMethod.POST)
    public String registerUser(User user, @RequestParam String confirmPassword,
                               RedirectAttributes redirectAttributes) {
        Map<String, List<String>> errors = checkUserErrors(user, confirmPassword);
        if (errors.isEmpty()) {
            logger.info("No validation errors are found.");
            user.setPassword(encoder.encode(user.getPassword()));
            user.setRoles("ROLE_DEBTOR");
            userRepository.save(user);
            logger.info("New user registered!");
            redirectAttributes.addFlashAttribute("registered", "User registered successfully!");
            return "redirect:/";
        } else {
            logger.warn("Validation errors are occurred for user registration.");
            redirectAttributes.addFlashAttribute("nameErrors", errors.get("username"));
            redirectAttributes.addFlashAttribute("pwdErrors", errors.get("password"));
            redirectAttributes.addFlashAttribute("cnfErrors", errors.get("confirmPassword"));
            return "redirect:/debtor/register";
        }
    }

    @RequestMapping("/") //debtor login
    public String login(Model model, @RequestParam(required = false) String loggedOut) {
        if (loggedOut != null && loggedOut.equals("true")) {
            logger.info("User has been logged out, at " + LocalDateTime.now() + ".");
        }
        model.addAttribute("user", new User());
        return "index";
    }

    @RequestMapping("/debtor/logout")
    public String logout() {
        return "logout"; //
    }

    @RequestMapping("/admin/login") // admin login
    public String adminLogin(Model model, @RequestParam(required = false) String loggedOut) {
        if (loggedOut != null && loggedOut.equals("true")) {
            logger.info("Admin has been logged out at " + LocalDateTime.now() + ".");
        }
        model.addAttribute("user", new User());
        return "adminLogin";
    }

    @RequestMapping("/admin/logout") // get
    public String adminLogout() {
        return "logout";
    }
    
//    Custom validator
    private Map<String, List<String>> checkUserErrors(User user, String confirmPassword) {
        Map<String, List<String>> errors = new HashMap<>();
        List<String> usernameErrorList = new ArrayList<>();
        List<String> passwordErrorList = new ArrayList<>();
        List<String> confirmPasswordErrorList = new ArrayList<>();
        logger.info("Checking for validation errors...");
        if (user.getUsername().matches("")) {
            usernameErrorList.add("username cannot be empty");
        }
        if (userRepository.findByUsername(user.getUsername()).isPresent()) {
            usernameErrorList.add("Username "+user.getUsername()+" is already taken!");
        }
        if (user.getPassword().matches("")) {
            passwordErrorList.add("Password cannot be empty");
        }
        if (user.getPassword().length()<8) {
            passwordErrorList.add("Password must contain at-least 8 characters.");
        }
        if (confirmPassword.matches("")) {
            confirmPasswordErrorList.add("Confirm Password field cannot be empty");
        }
        if (!confirmPassword.matches("") && !confirmPassword.equals(user.getPassword())) {
            passwordErrorList.add("Password Mismatched");
        }

        if (!usernameErrorList.isEmpty()) {
            errors.put("username", usernameErrorList);
        }
        if (!passwordErrorList.isEmpty()) {
            errors.put("password", passwordErrorList);
        }
        if (!confirmPasswordErrorList.isEmpty()) {
            errors.put("confirmPassword", confirmPasswordErrorList);
        }
        return errors;
    }
}
