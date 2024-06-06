package com.services;

import com.model.Glycemia;
import com.repositry.GlycemiaRepositry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GlycemiaServices {

@Autowired
    private GlycemiaRepositry repositry;

    public void addGlycemia(Glycemia reading) {
        repositry.save(reading);
    }

    public void deleteGlycemia(long id) {
        repositry.deleteById(id);
    }

    public Optional<Glycemia> findById(long id) {
        return repositry.findById(id);
    }


    public List<Glycemia> getAllGlycemia() {
        return repositry.findAll();
    }
}

