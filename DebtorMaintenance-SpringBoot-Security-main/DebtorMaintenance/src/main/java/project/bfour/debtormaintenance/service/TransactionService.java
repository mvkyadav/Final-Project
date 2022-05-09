package project.bfour.debtormaintenance.service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import project.bfour.debtormaintenance.model.Transaction;
import project.bfour.debtormaintenance.repository.TransactionRepository;

import java.util.Optional;
import java.util.UUID;

@Service
public class TransactionService {

    @Autowired
    TransactionRepository repository;

    final static Logger logger = LogManager.getLogger(TransactionService.class);

    public void updateTransaction(Transaction transaction) {
        logger.info("Updating the status of the transaction.");
        repository.save(transaction);
    }

    public Transaction getById(UUID uuid) {
        logger.info("Finding transaction object with reference to uuid: " + uuid);
        Optional<Transaction> optional = repository.findById(uuid);
        if (!optional.isPresent()) {
            logger.info("No transaction object with reference to uuid: " + uuid + " is found!");
            throw new ResponseStatusException(HttpStatus.NOT_FOUND,
                    "TransactionId not found");
        }
        return optional.get();
    }
}
