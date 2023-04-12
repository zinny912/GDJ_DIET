package com.goody.diet.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import com.goody.diet.healthMachine.HealthMachineDAO;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.healthMachine.RealHealthMachineDTO;
import com.goody.diet.member.MemberDTO;

@Service
public class CartService {

	@Autowired
	CartDAO cartDAO;

	@Autowired
	HealthMachineDAO helHealthMachineDAO;

	//민지
	public List<CartDTO> getCartList(CartDTO cartDTO) throws Exception{
		List<CartDTO> ar = cartDAO.getCartList(cartDTO);
		List<CartDTO> machines = cartDAO.getCartMachineList(cartDTO);
		ar.addAll(machines);
		return ar;
	}

	public int setCartStudyAdd(CartDTO cartDTO) throws Exception{
		return cartDAO.setCartStudyAdd(cartDTO);
	}

	public List<CartDTO> getPaymentList(CartDTO cartDTO) throws Exception{
		List<CartDTO> ar = cartDAO.getCartList(cartDTO);
		List<CartDTO> machines = cartDAO.getPaymentMachineList(cartDTO);
		ar.addAll(machines);
		
		return ar;  
	}

	public List<CartDTO> setCartCheckUpdate(CartDTO cartDTO, Long[] checkedItems,HttpSession session, Long [] cartNum,Long [] count) throws Exception{
		//count update
		//태현------------
		System.out.println();
		if(cartNum!=null) {
			for(int i=0; i<cartNum.length;i++) {
				
				CartDTO dto = new CartDTO();
				dto.setNum(cartNum[i]);
				dto.setCount(count[i]);
				cartDAO.setCartCountUpdate(dto);
			}
		}else {
			return null;
		}
		
		//------------------------
		int error = 0;
		//태현
		//2. setCartCheckDefaultUpdate
		int result = cartDAO.setCartCheckDefaultUpdate(cartDTO);
		//3. setCartCheckUpdate
		for(Long items:checkedItems) {
			result = cartDAO.setCartCheckUpdate(items);
			if(result<1)
				error++;//에러발생 카운트
		}
		if(error>0) {
			System.out.println(error);
		}
		//4. getPaymentList
		List<CartDTO> ar =  this.getPaymentList(cartDTO);
		System.out.println(ar.size());
		return ar;
		
		
		
		
		
		//		int[] result = new int[checkedItems.length];
		//		for(int i=0; i<checkedItems.length; i++) {			
		//			int result2 = cartDAO.setCartCheckUpdate(checkedItems[i]);
		//	        result[i] = result2;
		//		return result;
	}


	public int[] setCartDelete(Long[] checkedItems) throws Exception{
		int[] result = new int[checkedItems.length];
		for(int i=0; i<checkedItems.length; i++) {			
			//	        longArray[i] = Long.parseLong(checkedItems[i]);
			int result2 = cartDAO.setCartDelete(checkedItems[i]);
			result[i] = result2;
		}
		return result;
	}

	//태현
	//		cart에 넣기
	public int setCartMachineAdd(CartDTO cartDTO,RealHealthMachineDTO realHealthMachineDTO, HttpSession session)throws Exception{

		realHealthMachineDTO= helHealthMachineDAO.getRealHealthMachineDetail(realHealthMachineDTO);
		//realMachineNum
		HealthMachineDTO healthMachineDTO= helHealthMachineDAO.getHealthMachineDetail(realHealthMachineDTO);
		//		System.out.println(healthMachineDTO.getPrice());
		cartDTO.setCartPrice(healthMachineDTO.getSalePrice());
		cartDTO.getCartPrice();
		cartDTO.setRealMachineNum(realHealthMachineDTO.getRealMachineNum());

		//중복이면 count+1
		List<CartDTO> dtos = cartDAO.getCartMachineList(cartDTO);
		for(CartDTO dto : dtos) {
			if(cartDTO.getRealMachineNum().equals(dto.getRealMachineNum())) {
				return cartDAO.setCartMachineCount(cartDTO);
			}
		}

		return cartDAO.setCartMachineAdd(cartDTO);
	}

	//	public int[] setCartDelete(String[] checkedItems) throws Exception{
	//		long[] longArray = new long[checkedItems.length];
	//		int i=0;
	//		int[] result = new int[checkedItems.length];
	//		for(String str : checkedItems) {			
	//			longArray[i++] = Long.parseLong(str);
	//		s	int result2 = cartDAO.setCartDelete(longArray[i]);
	//			result[i] = result2;
	//		}
	//		return result;
	//	}


}
