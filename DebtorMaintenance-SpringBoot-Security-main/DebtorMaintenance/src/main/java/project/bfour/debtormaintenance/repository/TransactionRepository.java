package project.bfour.debtormaintenance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.bfour.debtormaintenance.model.Transaction;

import java.util.Optional;
import java.util.UUID;

public interface TransactionRepository extends JpaRepository<Transaction, UUID> {
    Optional<Transaction> findById(UUID uuid);
}
