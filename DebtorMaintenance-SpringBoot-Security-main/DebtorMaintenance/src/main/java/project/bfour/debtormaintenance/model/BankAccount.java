package project.bfour.debtormaintenance.model;

import org.springframework.validation.annotation.Validated;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "bankform")
@Validated
public class BankAccount {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty(message = "Account number cannot be empty.")
    @Pattern(regexp = "[0-9]{12}", message = "Account number must contain 12 digits.")
    private String number; // make string
    @NotEmpty(message = "Bank name cannot be empty.")
    private String bankName;
    @NotEmpty(message = "Branch name cannot be empty.")
    private String branchName;
    @NotEmpty(message = "Swift address cannot be empty.")
    private String swiftAddress;
    @NotEmpty(message = "Account currency cannot be empty.")
    private String accountCurrency;


    @OneToOne(mappedBy = "bankAccount")
    private DebtorForm debtorForm;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public String getSwiftAddress() {
        return swiftAddress;
    }

    public void setSwiftAddress(String swiftAddress) {
        this.swiftAddress = swiftAddress;
    }

    public String getAccountCurrency() {
        return accountCurrency;
    }

    public void setAccountCurrency(String accountCurrency) {
        this.accountCurrency = accountCurrency;
    }

    public DebtorForm getDebtorForm() {
        return debtorForm;
    }

    public void setDebtorForm(DebtorForm debtorForm) {
        this.debtorForm = debtorForm;
    }

}

