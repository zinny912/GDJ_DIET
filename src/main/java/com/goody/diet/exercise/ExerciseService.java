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
	@Autowired
	private FileManager fileManager;


	//짧강효확 첫 페이지 부위별 링크 걸기 
	public List<BodyDTO> getBodyList() throws Exception {	
		return exerciseDAO.getBodyList();
	}
	//add페이지 selectbox들 데이터 뿌리기
	public List<HealthMachineDTO> getHealthMachineList()throws Exception{
		return exerciseDAO.getHealthMachineList();
	}
	
	//짧강효확 상세페이지 
	//받은것 = bodyNum
	//얻고싶은것 : bodyNum에 해당하는 exerciseDTO,img, machcineName
	//#machineName은 컬럼에는 
	public List<ExerciseDTO> getExerciseTypeList(BodyDTO bodyDTO) throws Exception{//ExerciseDTO X bodyDTO O
		//이미있음join
		List<ExerciseDTO> ar=exerciseDAO.getExerciseTypeList(bodyDTO);
		
		return ar;
	}

	//detail - 영상출력 페이지 
	public ExerciseDTO getBodyVideo(ExerciseDTO exerciseDTO) throws Exception{
		exerciseDTO=exerciseDAO.getBodyVideo(exerciseDTO);
		return exerciseDTO;
	}

	// 짧강효확 selectOne...
	//1. update에 뿌려줄것 먼저 확인
	//-- exerciseDTO, FileDTO(list)1대1이지만 list로선언, List<BodyDTO>이 셋이다.
	// 그렇기 위해선 update에 필요한detail 에서 이값들을 DTO안에 넣어야함.
	//2. exerciseDTO 에 있는 변수들 타입들 확인
	// -- 현재 있는것 ExerciseDTO > List<BoardFileDTO>, List<BodyDTO> 이 두가지만 필요
	//3. 하나씩 넣는다.
	public ExerciseDTO getExerciseDetail(ExerciseDTO exerciseDTO) throws Exception{
		// exerciseDTO에는 num이 존재하기 때문에 num으로 필요한 값들을 찾아야 함.
		System.out.println(exerciseDTO.getNum()+"service");
		//1. exerciseDTO의 정보들 (list제외)불러오기
		exerciseDTO= exerciseDAO.getExerciseDetail(exerciseDTO);//Mapper을 보니 exerciseDTO, FileDTO를 받아옴
		//2. List<bodyDTO> 얻기
		List<BodyDTO> ar = exerciseDAO.getBodyDetail(exerciseDTO);
		exerciseDTO.setBodyDTO(ar);

		//파츠 완성후 리턴
		return exerciseDTO;
	}

	// add 
	public int setExerciseAdd(HttpSession session, ExerciseDTO exerciseDTO, MultipartFile [] Files,Long [] bodyNums) throws Exception{

		//1.exerciseADD  
		System.out.println(exerciseDTO.getNum());//null
		int result = exerciseDAO.setExerciseAdd(exerciseDTO);//파라미터로 받아온 상태에선 num 널이다 하지만 insert ExerciseAdd를 다녀오면 selectkey 로 인해 num이 생김
		System.out.println(exerciseDTO.getNum());//not null

		//2. bodyRoleAdd : 배열로 받았기 때문에 dto 새로 생성해야함.
		for(Long bodyNum:bodyNums) {// long타입인 num 들 꺼내서 dto 만들어서 대입(file insert 와 방식 동일)
			BodyDTO bodyDTO = new BodyDTO();
			bodyDTO.setBodyNum(bodyNum);//bodyNum대입
			bodyDTO.setNum(exerciseDTO.getNum());//exerciseNum 대입
			exerciseDAO.setExerciseBodyAdd(bodyDTO);
		}
		//		result = exerciseDAO.setExerciseBodyAdd(exerciseDTO);

		//3. fileAdd 하나도안고침 -> 완벽한 코드입니다 굿굿
		String realPath = session.getServletContext().getRealPath("resources/images/");
		//		System.out.println(realPath);
		for(MultipartFile multipartFile : Files) {
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
	//setupdate 구조 설명
	//1. 먼저 바꾸고 싶은 exercise Update하기
	//2. machineUpdate는 exerciseUpdate(exerciseDTO)에 포함!. 이유는 1대1 아니면 1대Null로 바뀌었기 때문에 값이 있으면 하고 없으면 안함.
	//3. file 은 1대1 이지만 Mapper 및 jsp 에 모두 list 로 빼고 넣어놓았기 때문에 그냥 List로 받는다.
	//4. 처음에 fileDELETE를 하는 이유 : jsp에는 삭제버튼을 누르면 파일이 삭제 된 것 처럼 보이지만 사실 삭제되지 않았고 update했을 때 만약 file이 새로 바뀌면 기존에 있던 파일을 삭제 후 새로운 파일로 교체하는 방식
	public int setExerciseUpdate(ExerciseDTO exerciseDTO, MultipartFile[] Files, HttpSession session,Long [] bodyNums) throws Exception{

		//1 exerciseUpdate
		int result = exerciseDAO.setExerciseUpdate(exerciseDTO);

		//2. exercise RoleUpdate => bodyNum 받아서 update 
		// Role 개념은 update가 아닌 delete insert이다. 그렇기 때문에 먼저 num에 해당하는 ExerciseRole들을 지워주고 다시 insert
		//2-1 ExerciseRoleDelete
		result = exerciseDAO.setExerciseRoleDelete(exerciseDTO);

		//2-1 exerciseRoleAdd(setExerciseBodyAdd)
		for(Long bodyNum :bodyNums) {
			BodyDTO bodyDTO= new BodyDTO();
			bodyDTO.setBodyNum(bodyNum);
			bodyDTO.setNum(exerciseDTO.getNum());
			result = exerciseDAO.setExerciseBodyAdd(bodyDTO);
		}

		//3. file을 HDD에 저장
		//file 도 role과 마찬가지로  삭제 후 insert 

		//3-1 경로받기
		String realPath = session.getServletContext().getRealPath("resources/images/");

		//3-2 파일삭제
		if(Files!=null) {//null이면 아무것도 전송되지않음==새로운 파일로 변경되지 않음
						//null이 아니면 새로운 파일을 입력함. 그렇기에 삭제 후 다시 insert
			for(MultipartFile multipartFile:Files) {
				if(multipartFile.isEmpty()) {
					//빈파일만 생성했을 경우 
					//위에서 걸러지지 않는 이유는 배열로 받을땐 주소로 받기 때문에 null이들어있는 주소는 Files에있기 때문에 위에선 null이아님
					break;
				}
				//1.delete img
				exerciseDAO.setFileDelete(exerciseDTO);
				
				//2. insertImg
				String fileName = fileManager.fileSave(multipartFile, realPath);

				//DB에 INSERT
				BoardFileDTO exerciseImgDTO = new BoardFileDTO();
				exerciseImgDTO.setNum(exerciseDTO.getNum());
				exerciseImgDTO.setFileName(fileName);
				exerciseImgDTO.setOriName(multipartFile.getOriginalFilename());
				result = exerciseDAO.setExerciseImg(exerciseImgDTO);
			}//이 코드는 사진과 1대1일때 가능합니다.-> machine은 한num에 여러개의 img


		}

		return result;
	}	
	//delete 해야할 것. 
	//1. exerciseDTO
	//2. exerciseRoleDTO
	//3. FileDTO
	//4. 현재 본인 컴퓨터에 저장되어 있는 사진(file)
	public int setExerciseDelete(ExerciseDTO exerciseDTO, Long fileNum, HttpSession session)throws Exception{
		//1. exerciseDTO delete
		int result = exerciseDAO.setExerciseDelete(exerciseDTO);
		//2. exerciseROLEDTO DELETE
		result = exerciseDAO.setExerciseRoleDelete(exerciseDTO);
		//3. img File Delete하기
			//3-1 imgDTO 가져오기 : 가져오는 이유는 파일의 oriName,FileName을 통해 경로에있는 파일을 제거하기 위함
		List<BoardFileDTO> ar = exerciseDAO.getExerciseFileList(exerciseDTO);//imgDTO 는 같은이름을 사용하는 BOardFIleDTO 사용중
			//3-2 DB먼저 삭제
		result = exerciseDAO.setFileDelete(exerciseDTO);
			//3-3 경로에있는 같은이름의 파일 삭제
		if(result>0) {//만약 db에 삭제된 파일이 있다면
			String realPath = session.getServletContext().getRealPath("/resources/images/");
			for(BoardFileDTO dto : ar) {
				boolean check = fileManager.fileDelete(realPath, dto.getFileName());
			}
		}
		//result 를 배열로 받아서 뭐가 삭제되었는지 확인 가능할수 있긴하지만 생략.
		return result;
	}

}

