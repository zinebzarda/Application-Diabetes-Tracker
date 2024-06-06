package com.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "glycemiaReading")
public class Glycemia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idGlycemia")
    private long idGlycemia;

    @Column(name = "date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;

    @Column(name = "time")
    @DateTimeFormat(pattern = "HH:MM")
    private LocalTime time;

    @Column(name = "level")
    private float level;

    @Column(name = "name_patient")
    private String name_patient;

    public LocalDate getDate() {
        return date;
    }

    public long getIdGlycemia() {
        return idGlycemia;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public float getLevel() {
        return level;
    }

    public void setLevel(float level) {
        this.level = level;
    }

    public void setName_patient(String name_patient) {
        this.name_patient = name_patient;
    }

    public String getName_patient() {
        return name_patient;
    }
}