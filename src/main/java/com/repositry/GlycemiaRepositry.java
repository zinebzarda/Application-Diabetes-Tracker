package com.repositry;

import com.model.Glycemia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GlycemiaRepositry extends JpaRepository<Glycemia,Long> {
}
