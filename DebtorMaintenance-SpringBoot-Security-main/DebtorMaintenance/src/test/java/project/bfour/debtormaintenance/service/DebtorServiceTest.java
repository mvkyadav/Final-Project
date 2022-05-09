package project.bfour.debtormaintenance.service;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import project.bfour.debtormaintenance.model.BankAccount;
import project.bfour.debtormaintenance.model.DebtorForm;
import project.bfour.debtormaintenance.model.Transaction;
import project.bfour.debtormaintenance.repository.DebtorFormRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class DebtorServiceTest {


    static DebtorForm debtorForm;
    static BankAccount bankAccount;
    static Transaction transaction;

    @Autowired
    DebtorFormRepository repository;

    @BeforeAll
    static void beforeAll() {
        debtorForm = new DebtorForm();
        bankAccount = new BankAccount();
        transaction = new Transaction();
        debtorForm.setName("Sanjay");
        debtorForm.setAddress1("address1");
        debtorForm.setPhone("8899887678");
        debtorForm.setEmail("san@mail.com");
        debtorForm.setSubmittedBy("sanjay");

        bankAccount.setBankName("sbi");
        bankAccount.setBranchName("hyd");
        bankAccount.setNumber("889898989898");
        bankAccount.setSwiftAddress("sbin498583");
        bankAccount.setAccountCurrency("INR");

        transaction.setId(UUID.randomUUID());
        transaction.setStatus('P');
        transaction.setDateTime(LocalDateTime.now().toString());
        transaction.setInformation("Pending");

        debtorForm.setBankAccount(bankAccount);
        debtorForm.setTransaction(transaction);
    }

    @AfterAll
    static void afterAll() {

    }

    @Test
    void getDetailsByTransactionId() {

    }

    @Test
    void getDetailsByUser() {
        List<DebtorForm> list = repository.findDebtorFormBySubmittedByOrderByIdDesc("sanjay");
        Assertions.assertNotNull(list);
    }

    @Test
    void saveDetails() {
        repository.save(debtorForm);
        long debId = debtorForm.getId();
        System.out.println(debId);
        Assertions.assertNotNull(debId);
    }

    @Test
    void getAllPendingDetails() {

    }

    @Test
    void getPendingFormsCount() {
        int count = repository.countByTransactionStatus('P');
        System.out.println("count: "  +count);
        Assertions.assertEquals(1, count);

    }
}