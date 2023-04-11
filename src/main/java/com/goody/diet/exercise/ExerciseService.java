package com.goody.diet.exercise;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.goody.diet.board.BoardFileDTO;
import com.goody.diet.cart.CartDTO;
import com.goody.diet.healthMachine.CategoryDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.healthMachine.HealthMachineImgDTO;
import com.goody.diet.healthMachine.RealHealthMachineDTO;
import com.goody.diet.study.StudyBoardFileDTO;
import com.goody.diet.study.StudyDTO;
import com.goody.diet.util.FileManager;
import com.goody.diet.util.Pager;

@Service
public class ExerciseService {

	@Autowired
	private ExerciseDAO exerciseDAO;

	//@Autowired
	//private ServletContext servletContext;

	private FileManager fileManager;


	//짧강효확 첫 페이지 부위별 링크 걸기 
	public List<BodyDTO> getBodyList() throws Exception {	
		return exerciseDAO.getBodyList();
	}

	//짧강효확 상세페이지 
	public List<ExerciseDTO> getExerciseTypeList(ExerciseDTO exerciseDTO) throws Exception{
		int i=0;
		List<ExerciseDTO> ar=exerciseDAO.getExerciseTypeList(exerciseDTO);
		for(ExerciseDTO dto:ar) {
			System.out.println("helthmachikneNum : "+dto.getMachineNum());
			dto = exerciseDAO.getMachineName(dto);
//			System.out.println(dto.getMachineName());
			ar.get(i).setMachineName(dto.getMachineName());
			i++;
		}
		
		//		System.out.println(bodyDTO.getBodyName());
		//		System.out.println(bodyDTO.getBodyNum());
		//		System.out.println(bodyDTO.getCoordinate());
		//		if(bodyDTO.getBodyNum()!=null) {
		//			ar=exerciseDAO.getExerciseTypeList(bodyDTO);
		//		}
		return ar;
	}

	//detail - 영상출력 페이지 
	public ExerciseDTO getBodyVideo(ExerciseDTO exerciseDTO) throws Exception{
		exerciseDTO=exerciseDAO.getBodyVideo(exerciseDTO);

		return exerciseDTO;
	}

	// 짧강효확 selectOne...
	public ExerciseDTO getExerciseDetail(ExerciseDTO exerciseDTO) throws Exception{
		return exerciseDAO.getExerciseDetail(exerciseDTO);
	}

	// 머신 이름 리스트 불러오기 
		public List<ExerciseDTO> getExerciseMachine() throws Exception {
			List<ExerciseDTO> exerciseDTOs = exerciseDAO.getExerciseMachine();
			for (ExerciseDTO exerciseDTO : exerciseDTOs) {
				List<HealthMachineDTO> healthMachineDTOs = exerciseDTO.getHealthMachineDTOs();
				if (healthMachineDTOs != null && !healthMachineDTOs.isEmpty()) {
					exerciseDTO.setMachineName(healthMachineDTOs.get(0).getMachineName());
					exerciseDTO.setMachineNum(healthMachineDTOs.get(0).getMachineNum());
					System.out.println("machineNum : " + exerciseDTO.getMachineNum());
					System.out.println("machineName : " + exerciseDTO.getMachineName());

				}
		
			}
			return exerciseDTOs;
		}

	// add 
	public int setExerciseAdd(ExerciseDTO exerciseDTO, MultipartFile [] multipartFiles, HttpSession session, HealthMachineDTO healthMachineDTO) throws Exception{
		int result = exerciseDAO.setExerciseAdd(exerciseDTO);
		result = exerciseDAO.setExerciseBodyAdd(exerciseDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/images/");
		System.out.println(realPath);
		for(MultipartFile multipartFile : multipartFiles) {
						if(multipartFile.isEmpty()) {
							System.out.println("실패");
							continue;
						}
			FileManager fileManager = new FileManager();
			String fileName = fileManager.fileSave(multipartFile, realPath);
			BoardFileDTO exerciseImgDTO = new BoardFileDTO();
			exerciseImgDTO.setNum(exerciseDTO.getNum());
			exerciseImgDTO.setFileName(fileName);
			exerciseImgDTO.setOriName(multipartFile.getOriginalFilename());
			System.out.println("filename : "+exerciseImgDTO.getFileName());
			System.out.println("oriname : "+exerciseImgDTO.getOriName());

			result = exerciseDAO.setExerciseImg(exerciseImgDTO);
		}
			
			return result;

	}
	//update 짧강효확 
	public int setExerciseUpdate(ExerciseDTO exerciseDTO,MultipartFile[] multipartFiles, HttpSession session, Long fileNum) throws Exception{
		
//		int result =  exerciseDAO.setFileDelete(fileNum);
//		System.out.println("fileNummm:" + result);
		int result = exerciseDAO.setExerciseUpdate(exerciseDTO);
		

		//1. exercise Role 추가
		result = exerciseDAO.setBodyUpdate(exerciseDTO);
		//file을 HDD에 저장
		String realPath = session.getServletContext().getRealPath("resources/images/");
		System.out.println(realPath);
		
		for(MultipartFile multipartFile:multipartFiles) {
			if(multipartFile.isEmpty()) {
				//파일 업로드가 안된 게시물은 continue로 처음으로 올라감
				continue;
			}
			String fileName = fileManager.fileSave(multipartFile, realPath);
			
			//DB에 INSERT
			BoardFileDTO exerciseImgDTO = new BoardFileDTO();
			exerciseImgDTO.setNum(exerciseDTO.getNum());
			exerciseImgDTO.setFileName(fileName);
			exerciseImgDTO.setOriName(multipartFile.getOriginalFilename());
			
			result = exerciseDAO.setExerciseImg(exerciseImgDTO);
		}
		
		return result;
	}	

	public int setExerciseDelete(ExerciseDTO exerciseDTO, Long fileNum)throws Exception{
		int result = exerciseDAO.setExerciseDelete(exerciseDTO);
		
		//delete ExerciseRole
		result = exerciseDAO.setExerciseRoleDelete(exerciseDTO);
		System.out.println("ExerciseRole : "+result);

		//delete ExerciseImg File
		
		result=exerciseDAO.setFileDelete(fileNum);
		return result;
	}

}

