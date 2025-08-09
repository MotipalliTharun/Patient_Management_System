package com.pm.analyticsservice.kafka;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;
import patient.events.PatientEvent;

@Service
public class KafkaConsumer {

    private static final Logger log = LoggerFactory.getLogger(KafkaConsumer.class);

    @KafkaListener(topics = "patient", groupId = "analytics-service")
    public void consumeEvent(byte[] event) {
        try {
            PatientEvent patientEvent = PatientEvent.parseFrom(event);
            log.info("Received Patient Event :[PatientID={},PatientName={},PatientEmail={}]",
                    patientEvent.getPatientID(),
                    patientEvent.getName(),
                    patientEvent.getEmail());
            //business logic
        } catch (Exception e) {
            log.error("Error deserializing event {}", e.getMessage());
        }
    }
}
