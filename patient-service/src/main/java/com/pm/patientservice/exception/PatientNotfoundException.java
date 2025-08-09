package com.pm.patientservice.exception;

public class PatientNotfoundException extends RuntimeException {
    public PatientNotfoundException(String message) {
        super(message);
    }
}
