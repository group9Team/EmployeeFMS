package com.data;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LimitedRepo extends JpaRepository<LimitedData, Integer> {

	public List<String> findByDepartmentEquals(String department);
}
