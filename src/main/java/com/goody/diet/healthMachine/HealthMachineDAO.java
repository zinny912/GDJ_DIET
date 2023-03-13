package com.goody.diet.healthMachine;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HealthMachineDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goody.diet.healthMachineDAO.";

	
	
}
