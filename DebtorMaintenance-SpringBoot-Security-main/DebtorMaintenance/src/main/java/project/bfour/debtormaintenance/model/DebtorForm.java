package project.bfour.debtormaintenance.model;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.*;

@Entity
@Table(name = "debtorform")
public class DebtorForm {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @NotEmpty(message = "Name cannot be empty.")
    private String name;
    @NotEmpty(message = "Address cannot be empty.")
    private String address1;

    private String address2;
    private long fax;

    @NotEmpty(message = "Phone cannot be empty.")
    @Pattern(regexp = "[6-9][0-9]{9}", message = "Phone number must contain 10 digits and start with 6|7|8|9.")
    private String phone; //  make string

    @NotEmpty(message = "Email cannot be empty.")
    @Email(message = "Please, provide proper email address.")
    private String email;
    private String submittedBy; // username -> vamshi


    @Valid
    @OneToOne(cascade = CascadeType.ALL) //
    @JoinColumn(name = "bank_account_id", referencedColumnName = "id") //
    private BankAccount bankAccount;

//    Foreign key (bank_account_id) references bankAccount.id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "transaction_id", referencedColumnName = "id")
    private Transaction transaction;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public long getFax() {
        return fax;
    }

    public void setFax(long fax) {
        this.fax = fax;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubmittedBy() {
        return submittedBy;
    }

    public void setSubmittedBy(String submittedBy) {
        this.submittedBy = submittedBy;
    }

    public BankAccount getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(BankAccount bankAccount) {
        this.bankAccount = bankAccount;
    }

    public Transaction getTransaction() {
        return transaction;
    }

    public void setTransaction(Transaction transaction) {
        this.transaction = transaction;
    }

}

