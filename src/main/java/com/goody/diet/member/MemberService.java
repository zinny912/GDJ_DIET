package com.goody.diet.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goody.diet.util.Pager;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO memberDAO;
	

	public List<MemberDTO> getMemberList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(memberDAO.getTotalCount(pager));//totalcountDAO만드어,,
		
		return memberDAO.getMemberList(pager);
	}
	
	public MemberDTO getKakaoLogin (MemberDTO memberDTO) throws Exception {
		System.out.println("서비스카카오로긴1");
		MemberDTO result = memberDAO.getMemberLogin(memberDTO);
		System.out.println("서비스카카오로긴2");
		System.out.println("로그인타입: "+memberDTO.getLoginType());
		//정보가 없으면 회원가입
		if(result==null) {
			memberDTO.setLoginType("kakao"); //회원가입 시 kakao로그인 부여
			memberDAO.setKakaoJoin(memberDTO);
			memberDAO.setMemberRole(memberDTO);
		}
		memberDTO=memberDAO.getMemberLogin(memberDTO);
		System.out.println("로그인타입: "+memberDTO.getLoginType());
		System.out.println("------------카카오로그인-------------");
		return memberDTO;
	}
	
	//카카오끝
	
	public int setMemberDelete(MemberDTO memberDTO) throws Exception {
		System.out.println("member del id 옴?: "+memberDTO.getId());
		int roleresult = memberDAO.setMemberRoleDelete(memberDTO);
		System.out.println("member del 삭제 후: "+memberDTO.getId());
		int result = memberDAO.setMemberDelete(memberDTO);
		System.out.println(roleresult+":"+result);
		int total = roleresult+result;
		return total;
	}

	public String getIdCheck (MemberDTO memberDTO) throws Exception {
		String result = "사용불가";
		if(memberDTO.getId()!=null&&memberDTO.getId()!=""&&memberDAO.getMemberLogin(memberDTO)==null) {
			result = "사용가능";
		}
		if(memberDTO.getId()=="") {
			result = "필수정보";
		}
		if(memberDAO.getMemberLogin(memberDTO)!=null) {
			result = "중복아이디";
		}
		return result;
	}
	
	//0410 이메일 중복허용
//	public String getEmailCheck (MemberDTO memberDTO) throws Exception {
//		String result = "사용불가";
//		if(memberDTO.getEmail()!=null&&memberDTO.getEmail()!=""&&memberDAO.getEmailCheck(memberDTO)==null) {
//			result = "사용가능";
//		}
//		if(memberDTO.getEmail()=="") {
//			result = "필수정보";
//		}
//		if(memberDAO.getEmailCheck(memberDTO)!=null) {
//			result = "중복";
//		}
//		return result;
//	}
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception {
//		System.out.println("서비스왔니..?");
//		System.out.println("서비스 check: "+memberDTO.getPw());
		
		//---------------id검사---------------------
//		memberDTO.getId()
		
		//---------------pw검사---------------------
		if(memberDTO.getPw()!=null||memberDTO.getPw()!="") {	//최소 pw는 입력해야댐.
			MemberDTO result=memberDAO.getMemberLogin(memberDTO);	//id: 일치 or null
			System.out.println("result(id불일치 시 null): "+result);
			if(result!=null && result.getPw().equals(memberDTO.getPw())) { //로그인 정보 일치 시
				System.out.println("서비스아이디일치하나2");
				result.setPw(null);
				memberDTO = result;
			}else { //DB와 pw가 안맞을 때
				memberDTO=null;
			}
		}else { //web에서 pw입력을 안했을 때
			memberDTO=null;
		}//비번 null이면 null받음
		return memberDTO;
	}

	public MemberDTO getMyPage(MemberDTO memberDTO) throws Exception {
		
		if(memberDTO.getLoginType().equals("kakao")) {
			memberDTO = memberDAO.getMemberLogin(memberDTO);

		}else if(memberDTO.getLoginType().equals("general")) {
			memberDTO = memberDAO.getMemberLogin(memberDTO);
//			memberDTO.setPw(null); //일반 로그인은 getMemberLogin로 해... pw필요해..
			
		}

		return memberDTO;
		
	}
	
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		memberDTO.setLoginType("general"); 
		memberDAO.setMemberRole(memberDTO);
		return memberDAO.setMemberJoin(memberDTO);
	}
	
	public int setPasswordUpdate(MemberDTO memberDTO) throws Exception {
		return memberDAO.setPasswordUpdate(memberDTO);
	}
	
	//주소설정
	public DeliveryDTO getDeliveryDetail(DeliveryDTO deliveryDTO) throws Exception {
		return memberDAO.getDeliveryDetail(deliveryDTO);
	}	
	public int setEmailUpdate(MemberDTO memberDTO) throws Exception {
		return memberDAO.setEmailUpdate(memberDTO);
	}
	public MemberDTO setMemberAddressUpdate(MemberDTO memberDTO) throws Exception {
		memberDAO.setMemberAddressUpdate(memberDTO);
		
		//대표주소에 쓰는 세션업데이트 해줘야댐
		memberDTO=memberDAO.getMemberLogin(memberDTO);
		memberDTO.setPw(null);
		return memberDTO;
	}
	public int setDeliveryAdd(DeliveryDTO deliveryDTO) throws Exception {
		return memberDAO.setDeliveryAdd(deliveryDTO);
	}
	public int setDeliveryDelete(DeliveryDTO deliveryDTO) throws Exception {
		return memberDAO.setDeliveryDelete(deliveryDTO);
	}
	public int setdeliveryUpdate(DeliveryDTO deliveryDTO) throws Exception {
		return memberDAO.setdeliveryUpdate(deliveryDTO);
	}


	
	public List<DeliveryDTO> getDeliveryPage (MemberDTO memberDTO) throws Exception {
		return memberDAO.getDeliveryPage(memberDTO);
	}

	public int setDeleteOnMemberDelete (MemberDTO memberDTO) throws Exception {
		memberDAO.setDeliveryDeleteOnMemberDelete(memberDTO);
		memberDAO.setOrderDetailDeleteOnMemberDelete(memberDTO);
		memberDAO.setCartDeleteOnMemberDelete(memberDTO);
		memberDAO.setOrderDeleteOnMemberDelete(memberDTO);
		return 0;
	}
}
