package project.bfour.debtormaintenance.model;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Table(name = "transaction")
public class Transaction {

    @Id
    @Column(columnDefinition = "BINARY(16)")
    private UUID id; // BLOB->Binary Long Object (255)
    private String dateTime;
    private char status; // P/R/A
    private String information;

    @OneToOne(mappedBy = "transaction")
    private DebtorForm debtorForm;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public char getStatus() {
        return status;
    }

    public void setStatus(char status) {
        this.status = status;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

}

