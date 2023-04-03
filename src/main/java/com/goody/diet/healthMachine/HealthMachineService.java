package com.goody.diet.healthMachine;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goody.diet.util.FileManager;

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
	//getRealHealthMachineDetailList
	public List<RealHealthMachineDTO> getRealHealthMachineList(RealHealthMachineDTO realHealthMachineDTO)throws Exception {
		return healthMachineDAO.getRealHealthMachineList(realHealthMachineDTO);
		
	}
	//오버로딩
	public List<RealHealthMachineDTO> getRealHealthMachineList(HealthMachineDTO healthMachineDTO)throws Exception {
		RealHealthMachineDTO realHealthMachineDTO = new RealHealthMachineDTO();
		realHealthMachineDTO.setMachineNum(healthMachineDTO.getMachineNum());
		return healthMachineDAO.getRealHealthMachineList(realHealthMachineDTO);
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

		return result;
	}
	//옵션 1개만 삭제
	public int setRealHealthMachineDelete(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
	
		realHealthMachineDTO = healthMachineDAO.getRealHealthMachineDetail(realHealthMachineDTO);
		
//		System.out.println("HealthMachineNum : "+realHealthMachineDTO.getMachineNum());
		return healthMachineDAO.setRealMachineDelete(realHealthMachineDTO);
	}




}
