package com.goody.diet.healthMachine;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.util.FileManager;

import oracle.net.aso.c;

@Service
public class HealthMachineService {

	@Autowired
	private HealthMachineDAO healthMachineDAO;

	@Autowired
	private FileManager fileManager;

	public List<HealthMachineDTO> getHealthMachineList(CategoryDTO categoryDTO) throws Exception{
		List<HealthMachineDTO> ar=healthMachineDAO.getHealthMachineList();
		if(categoryDTO.getCategoryNum()!=null) {
			ar=healthMachineDAO.getHealthMachineTypeList(categoryDTO);

		}
		return ar;

	}
//	getRealHealthMachineDetailList
	public Long getStock(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		realHealthMachineDTO= healthMachineDAO.getRealHealthMachineDetail(realHealthMachineDTO);
		
		return realHealthMachineDTO.getStock();
	}
	public List<RealHealthMachineDTO> getRealHealthMachineList(RealHealthMachineDTO realHealthMachineDTO)throws Exception {
		return healthMachineDAO.getRealHealthMachineList(realHealthMachineDTO);

	}
	//오버로딩
	public HealthMachineDTO getRealHealthMachineList(HealthMachineDTO healthMachineDTO)throws Exception {
		RealHealthMachineDTO realHealthMachineDTO = new RealHealthMachineDTO();
		realHealthMachineDTO.setMachineNum(healthMachineDTO.getMachineNum());
		healthMachineDTO=healthMachineDAO.getHealthMachineDetail(healthMachineDTO);
		healthMachineDTO.setRealHealthMachineDTOs(healthMachineDAO.getRealHealthMachineList(realHealthMachineDTO));
		
		return healthMachineDTO;
	}

	public HealthMachineDTO getHealthMachineDetail(HealthMachineDTO healthMachineDTO) throws Exception{
		healthMachineDTO= healthMachineDAO.getHealthMachineDetail(healthMachineDTO);// healthmachine정보 및 img정보
		healthMachineDTO.setCategoryDTO(healthMachineDAO.getCategoryDetail(healthMachineDTO));// 해당 머신의 카테고리 리스트

		return healthMachineDTO;
	}

	//option
	public List<RealHealthMachineDTO> getOption1(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return healthMachineDAO.getOption1(realHealthMachineDTO);
	}

	public List<RealHealthMachineDTO> getOption2(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return healthMachineDAO.getOption2(realHealthMachineDTO);
	}
	public List<RealHealthMachineDTO> getOption3(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return healthMachineDAO.getOption3(realHealthMachineDTO);
	}
	public List<RealHealthMachineDTO> getOption4(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return healthMachineDAO.getOption4(realHealthMachineDTO);
	}
	//
	public int setHealthMachineAdd(HealthMachineDTO healthMachineDTO, MultipartFile [] multipartFiles, HttpSession httpSession,Long [] categoryDTOs)throws Exception{


		int result = healthMachineDAO.setHealthMachineAdd(healthMachineDTO);
		//중복제거
		HashSet<Long> hashSet = new HashSet<Long>(Arrays.asList(categoryDTOs));//배열 -> 리스트  파라미터로 받는 것들은 리스트로 받지못함.
		categoryDTOs=hashSet.toArray(new Long[0]);

		for(Long categoryNum : categoryDTOs) {
			CategoryDTO categoryDTO = new CategoryDTO();
			categoryDTO.setCategoryNum(categoryNum);
			categoryDTO.setMachineNum(healthMachineDTO.getMachineNum());
			result = healthMachineDAO.setCategoryType(categoryDTO);
			//			System.out.println(categoryNum);
		}
		//		---------------------------
		//		System.out.println(healthMachineDTO.getMachineNum());
		String realPath = httpSession.getServletContext().getRealPath("resources/images");
		//	System.out.println(realPath);
		for(MultipartFile multipartFile : multipartFiles) {
			if(multipartFile.isEmpty()) {
				System.out.println("실패");
				continue;
			}
			String fileName= fileManager.fileSave(multipartFile, realPath);
			HealthMachineImgDTO healthMachineImgDTO = new HealthMachineImgDTO();
			healthMachineImgDTO.setMachineNum(healthMachineDTO.getMachineNum());
			healthMachineImgDTO.setFileName(fileName);
			healthMachineImgDTO.setOriName(multipartFile.getOriginalFilename());
			//			System.out.println("filename : "+healthMachineImgDTO.getFileName());
			//			System.out.println("oriname : "+healthMachineImgDTO.getOriName());
			//			
			result = healthMachineDAO.setMachineImg(healthMachineImgDTO);
		}
		return result;
	}

	public int setOptionAdd(RealHealthMachineDTO realHealthMachineDTO, MultipartFile [] multipartFiles, HttpSession session)throws Exception{
		int result = healthMachineDAO.setOptionAdd(realHealthMachineDTO);
		String realPath = session.getServletContext().getRealPath("resources/images");//임시저장소
		for(MultipartFile multipartFile : multipartFiles) {
			if(multipartFile.isEmpty()) {
				System.out.println("실패");
				continue;
			}
			String fileName= fileManager.fileSave(multipartFile, realPath);
			HealthMachineImgDTO healthMachineImgDTO = new HealthMachineImgDTO();
			healthMachineImgDTO.setMachineNum(realHealthMachineDTO.getMachineNum());
			healthMachineImgDTO.setFileName(fileName);
			healthMachineImgDTO.setOriName(multipartFile.getOriginalFilename());

			result = healthMachineDAO.setMachineImg(healthMachineImgDTO);
		}
		return result;
	}

	//카테고리
	public List<CategoryDTO>getCategoryList()throws Exception{
		return healthMachineDAO.getCategoryList();
	}
	public int setcategoryTypeDelete(CategoryDTO categoryDTO)throws Exception{
		return healthMachineDAO.setCategoryTypeDelete(categoryDTO);
	}
	//delete
	public int setHealthMachineDelete(HealthMachineDTO healthMachineDTO,HttpSession session)throws Exception{
		Long machineNum= healthMachineDTO.getMachineNum();
		int result = healthMachineDAO.setHealthMachineDelete(healthMachineDTO);
		//delete realHealthMachine
		if(result >0) {
			RealHealthMachineDTO realHealthMachineDTO = new RealHealthMachineDTO();
			realHealthMachineDTO.setMachineNum(machineNum);
			result = healthMachineDAO.setRealMachineDelete(realHealthMachineDTO);
			System.out.println("realHealthMachine : "+result);
		}
		//deleteCategoryType

		CategoryDTO categoryDTO = new CategoryDTO();
		categoryDTO.setMachineNum(machineNum);
		result = healthMachineDAO.setCategoryTypeDelete(categoryDTO);
		System.out.println("categoryType : "+result);

		//delete MachineImg File

		HealthMachineImgDTO healthMachineImgDTO = new HealthMachineImgDTO();
		healthMachineImgDTO.setMachineNum(machineNum);

		List<HealthMachineImgDTO> ar = healthMachineDAO.getMachineImgList(healthMachineImgDTO);
		result=healthMachineDAO.setMachineImgDelete(healthMachineImgDTO);
		System.out.println("imgDelete : "+result);
		if(result>0) {
			String realPath = session.getServletContext().getRealPath("/resources/images/");
			for(HealthMachineImgDTO dto : ar) {
				boolean check = fileManager.fileDelete(realPath, dto.getFileName());
			}
		}

		return 1;
	}

	//옵션 1개만 삭제
	public int setRealHealthMachineDelete(RealHealthMachineDTO realHealthMachineDTO)throws Exception{

//		realHealthMachineDTO = healthMachineDAO.getRealHealthMachineDetail(realHealthMachineDTO);

		//		System.out.println("HealthMachineNum : "+realHealthMachineDTO.getMachineNum());
		return healthMachineDAO.setRealMachineDelete(realHealthMachineDTO);
	}
	
	//update
	public int setHealthMachineUpdate(HealthMachineDTO healthMachineDTO,Long []  categoryDTOs, Long thumnailNum, MultipartFile [] Files, Long [] fileNums, HttpSession session) throws Exception{
		int result=0;
		//1. healthMachine update
		healthMachineDAO.setHealthMachineUpdate(healthMachineDTO);
		//2. 카테고리 무결성 검사 후 넣기
		HashSet<Long> hashSet = new HashSet<Long>(Arrays.asList(categoryDTOs));//배열 -> 리스트  파라미터로 받는 것들은 리스트로 받지못함.
		categoryDTOs=hashSet.toArray(new Long[0]);

		ArrayList<Long> array = new ArrayList<Long>(Arrays.asList(categoryDTOs));
		List<CategoryDTO> ar= healthMachineDAO.getCategoryDetail(healthMachineDTO);
		for(int i=0; i<array.size(); i++) {
			for(int j=0; j<ar.size();j++) {
				if(array.get(i)==ar.get(j).getCategoryNum()) {
					array.remove(i);
					break;
				}
			}
		}
		categoryDTOs=array.toArray(new Long[0]);
		for(Long categoryNum : categoryDTOs) {
			CategoryDTO categoryDTO = new CategoryDTO();
			categoryDTO.setCategoryNum(categoryNum);
			categoryDTO.setMachineNum(healthMachineDTO.getMachineNum());
			result = healthMachineDAO.setCategoryType(categoryDTO);
		}
		//3.파일 및 썸네일 넣기
		//3.1 삭제에 선택한 파일 삭제
		boolean thumnailcheck = false;
		if(fileNums!=null) {
			for(Long fileNum : fileNums) {
				result = healthMachineDAO.setMachineFileDelete(fileNum);
				if(fileNum.equals(thumnailNum)){//썸네일이 삭제되면 구분하기
					thumnailcheck=true;
					System.out.println("true");
				}
			}
		}
		
		String realPath = session.getServletContext().getRealPath("/resources/images/");
		for(int i=0; i<Files.length; i++) {
			if(Files[i].isEmpty()) {
				System.out.println("실패");
				continue;
			}

			String fileName = fileManager.fileSave(Files[i], realPath);
			//3-2 db에 저장
			HealthMachineImgDTO healthMachineImgDTO = new HealthMachineImgDTO();
			healthMachineImgDTO.setFileName(fileName);
			healthMachineImgDTO.setMachineNum(healthMachineDTO.getMachineNum());
			healthMachineImgDTO.setOriName(Files[i].getOriginalFilename());
			//3-3 썸네일검사
			if(thumnailcheck==true) {
				healthMachineImgDTO.setFileNum(thumnailNum);
				result = healthMachineDAO.setMachineThumnailAdd(healthMachineImgDTO);
				thumnailcheck=false;
			}
			else {
				result = healthMachineDAO.setMachineImg(healthMachineImgDTO);
			}
		}
		return 1;
	}

	public String setBoardFileAdd(MultipartFile files,HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/upload/machineReviewFile/");
	
			if(files.isEmpty()) {
				//파일 업로드가 안된 게시물은 continue로 처음으로 올라감
				return null;
			}
			String fileName = fileManager.fileSave(files, realPath);
			return "/resources/upload/machineReviewFile/"+fileName;
	}
	
	// qna & review count
	public Long getMachineReviewCount(HealthMachineDTO healthMachineDTO) throws Exception {
		return healthMachineDAO.getMachineReviewCount(healthMachineDTO);
	}
	
	public Long getMachineQnaCount(HealthMachineDTO healthMachineDTO) throws Exception {
		return healthMachineDAO.getMachineQnaCount(healthMachineDTO);
	}
	
	//realhealthMachine stock 갯수 
	public Long getMachineStock(HealthMachineDTO healthMachineDTO) throws Exception {
		return healthMachineDAO.getMachineStock(healthMachineDTO);
	}


}
