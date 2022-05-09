package project.bfour.debtormaintenance.controller;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.bfour.debtormaintenance.model.DebtorForm;
import project.bfour.debtormaintenance.model.Transaction;
import project.bfour.debtormaintenance.service.DebtorService;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;


@Controller
@SessionAttributes({"org.springframework.validation.BindingResult.debtorform", "debtorform"})
@RequestMapping("/debtor")
public class DebtorController {

    @Autowired
    DebtorService debtorService;

    @ModelAttribute("debtorform")
    public DebtorForm getForm() {
        return new DebtorForm();
    }

    final static Logger logger = LogManager.getLogger(DebtorController.class);


    @RequestMapping("/home")
    public String home(Authentication authentication, Model model,
                       @RequestParam(required = false) String loggedIn) {
        if (loggedIn != null && loggedIn.equals("true")) {
            logger.info("User [" + authentication.getName() +"] is logged in at " + LocalDateTime.now() + ".");
        }
        model.addAttribute("totalForms",
                debtorService.getAllFormCount(authentication.getName()));
        model.addAttribute("pendingForms",
                debtorService.getFormCountWithStatus('P', authentication.getName()));
        model.addAttribute("authorizedForms",
                debtorService.getFormCountWithStatus('A', authentication.getName()));
        model.addAttribute("rejectedForms",
                debtorService.getFormCountWithStatus('R', authentication.getName()));
        model.addAttribute("name", authentication.getName());
        return "debtorHome";
    }

    @RequestMapping("/form")
    public String getDebtorForm() {
        return "debtorForm";
    }

    @RequestMapping(value = "/transaction", method = RequestMethod.POST)
    public String getTransactionAndConfirm(@Valid @ModelAttribute("debtorform") final DebtorForm debtorForm,
                                           final BindingResult result, Model model,
                                           final SessionStatus sessionStatus) {
        if (result.hasErrors()) {
            logger.error("Debtor form validation errors are occurred! | Invalid Debtorform.");
            return "redirect:/debtor/form";
        }
        sessionStatus.setComplete();
        logger.info("No debtor_form validation errors are occurred.");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); // sql formatting
        logger.info("New Transaction object is being created!...");
        Transaction transaction = new Transaction();
        transaction.setId(UUID.randomUUID());
        transaction.setDateTime(formatter.format(LocalDateTime.now())); // date time
        transaction.setStatus('P');
        transaction.setInformation("Pending");
        debtorForm.setTransaction(transaction);
        logger.info("New Transaction object is added to debtorform...");
        model.addAttribute("debtorform", debtorForm);
        return "transaction";
    }

    @RequestMapping(value = "/form", method = RequestMethod.POST)
    public String postDebtorForm(DebtorForm debtorForm, Authentication authentication,
                                 RedirectAttributes redirectAttributes) {
        debtorForm.setSubmittedBy(authentication.getName()); // username
        debtorService.saveDetails(debtorForm);
        logger.info("New Debtor form is saved!");
        redirectAttributes.addFlashAttribute("submitted",
                "Form has been submitted successfully");
        return "redirect:/debtor/home";
    }

    @RequestMapping("/updates")
    public String updates(Model model, Authentication authentication, SessionStatus sessionStatus) {
        model.addAttribute("debtorList",
                debtorService.getDetailsByUser(authentication.getName()));
        sessionStatus.setComplete();
        return "debtorUpdates";
    }

    @RequestMapping("/form/details/{txnId}")
    public ModelAndView getFormDetails(@PathVariable UUID txnId, ModelAndView modelAndView) {
        modelAndView.addObject("debtorform",
                debtorService.getDetailsByTransactionId(txnId));
        modelAndView.setViewName("viewDebtorDetails");
        return modelAndView;
    }
}
