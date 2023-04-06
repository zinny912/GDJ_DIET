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
	
//	민지	
	public List<CartDTO> getCartList(CartDTO cartDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCartList", cartDTO);
	}
	
	public List<CartDTO> getPaymentList(CartDTO cartDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getPaymentList", cartDTO);
	}
	
	public int setCartStudyAdd(CartDTO cartDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCartStudyAdd", cartDTO);
	}
	
	public int setCartCheckUpdate(Long item) throws Exception{
		return sqlSession.update(NAMESPACE+"setCartCheckUpdate", item);
	}
	
	public int setCartCheckDefaultUpdate(CartDTO cartDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setCartCheckDefaultUpdate", cartDTO);
	}
//	태현
	public List<CartDTO> getCartMachineList(CartDTO cartDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCartMachineList", cartDTO);
	}
	
	public int setCartMachineAdd(CartDTO cartDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setCartMachineAdd",cartDTO);
	}
	public int setCartMachineCount(CartDTO cartDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setCartMachineCount", cartDTO);
	}
	
	
	public int setCartDelete(Long item) throws Exception{
		return sqlSession.delete(NAMESPACE+"setCartDelete", item);
	}

}
