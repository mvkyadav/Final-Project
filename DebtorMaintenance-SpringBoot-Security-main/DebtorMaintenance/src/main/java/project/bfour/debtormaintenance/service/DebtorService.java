package project.bfour.debtormaintenance.service;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.bfour.debtormaintenance.model.DebtorForm;
import project.bfour.debtormaintenance.repository.DebtorFormRepository;

import java.util.List;
import java.util.UUID;

@Service
public class DebtorService {


    @Autowired
    DebtorFormRepository repository;

    final static Logger logger = LogManager.getLogger(DebtorService.class);

    public DebtorForm getDetailsByTransactionId(UUID txnId) {
        logger.info("Finding and returning, debtor_form where transactionId: " + txnId);
        return repository.findDebtorFormByTransactionId(txnId);
    }

    public List<DebtorForm> getDetailsByUser(String user) {
        logger.info("Finding and returning, debtor_form submittedBy(parameter): " + user);
        return repository.findDebtorFormBySubmittedByOrderByIdDesc(user);
    }

    public void saveDetails(DebtorForm debtorForm) {
        logger.info("Inserting debtor_form into database.");
        repository.save(debtorForm);
    }

    public List<DebtorForm> getAllPendingDetails() {
        logger.info("Finding and returning, the list of pending debtor_forms.");
        return repository.findAllByTransactionStatusOrderByIdDesc('P');
    }

    public int getPendingFormsCount() {
        return repository.countByTransactionStatus('P');
    }

    public int getFormCountWithStatus(char status, String submittedBy) {
        return repository.countByTransactionStatusAndSubmittedBy(status, submittedBy);
    }

    public int getAllFormCount(String submittedBy) {
        return repository.countBySubmittedBy(submittedBy);
    }

}
