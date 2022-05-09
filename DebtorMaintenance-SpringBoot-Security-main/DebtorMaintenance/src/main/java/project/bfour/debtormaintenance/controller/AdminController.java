package project.bfour.debtormaintenance.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.bfour.debtormaintenance.model.Transaction;
import project.bfour.debtormaintenance.service.DebtorService;
import project.bfour.debtormaintenance.service.TransactionService;

import java.time.LocalDateTime;
import java.util.UUID;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    DebtorService debtorService;

    @Autowired
    TransactionService transactionService;

    final static Logger logger = LogManager.getLogger(AdminController.class);

    @RequestMapping("/home")
    public String home(Authentication authentication, Model model,
                       @RequestParam(required = false) String loggedIn) {
        if (loggedIn != null && loggedIn.equals("true")) {
            logger.info("Admin [" + authentication.getName() + "] is logged in at " + LocalDateTime.now() + ".");
        }
        model.addAttribute("name", authentication.getName());
        model.addAttribute("pendingCount", debtorService.getPendingFormsCount());
        return "adminHome";
    }

    @RequestMapping("/debtor/details")
    public ModelAndView getAllDebtorDetails() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("debtorList",
                debtorService.getAllPendingDetails());
        modelAndView.setViewName("debtorDetailsList");
        return modelAndView;
    }

    @RequestMapping("/debtor/form/details/{txnId}")
    public ModelAndView getFormDetails(@PathVariable UUID txnId, ModelAndView modelAndView) {
        modelAndView.addObject("debtorform", debtorService.getDetailsByTransactionId(txnId));
        modelAndView.setViewName("viewDebtorDetails");
        return modelAndView;
    }

    @RequestMapping("/debtor/authorize/{txnId}")
    public String authorizeDebtor(@PathVariable UUID txnId, RedirectAttributes redirectAttributes) {
        logger.info("Authorizing debtor_form with reference to transactionId: " + txnId);
        Transaction transaction = transactionService.getById(txnId);
        transaction.setStatus('A');
        transaction.setInformation("Authorized");
        transactionService.updateTransaction(transaction);
        redirectAttributes.addFlashAttribute("authorized",
                "Form has been authorized successfully!");
        return "redirect:/admin/debtor/details";
    }

    @RequestMapping("/debtor/reject-form/{uuid}")
    public String rejectFormDebtor(@PathVariable UUID uuid, Model model) {
        Transaction transaction = transactionService.getById(uuid);
        model.addAttribute("transaction", transaction);
        return "rejectForm";
    }

    @RequestMapping(value = "/debtor/reject", method = RequestMethod.POST)
    public String rejectDebtor(Transaction transaction, RedirectAttributes redirectAttributes) {
        logger.info("Rejecting debtor_form with reference to transactionId: " + transaction.getId());
        transaction.setStatus('R');
        transactionService.updateTransaction(transaction);
        redirectAttributes.addFlashAttribute("rejected",
                "Form has been rejected successfully!");
        return "redirect:/admin/debtor/details";
    }

}
