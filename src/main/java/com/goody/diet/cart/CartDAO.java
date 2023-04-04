package com.goody.diet.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.goody.diet.cart.CartDAO.";
	
	public List<CartDTO> getCartList(CartDTO cartDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCartList", cartDTO);
	}
	
	public int setCartStudyAdd(CartDTO cartDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCartStudyAdd", cartDTO);
	}
	
	public int setCartDelete(Long item) throws Exception{
		return sqlSession.delete(NAMESPACE+"setCartDelete", item);
	}

}
