package com.goody.diet.util;


import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	
	//File을 HDD에서 삭제
	public boolean fileDelete(String path, String fileName) throws Exception {
		File file = new File(path, fileName);
		
		return file.delete();
		
	} 
	
	//File을 HDD에 저장
	public String fileSave(MultipartFile multipartFile, String path)throws Exception{
		//1. 어디에 저장할 것인가??
		//   /resources/upload/bankBook/...
		//2. 저장관리는 운영체제가 담당
		File file = new File(path);
	
		//폴더가 존재하지 않으면 폴더 생성
		if(!file.exists()) {
			file.mkdirs();
		}
			
		//3. 중복되지 않는 파일명 생성
		//Calendar ca = Calendar.getInstance();
		//ca.getTimeInMillis();
		String name = UUID.randomUUID().toString();
		
		//4. 확장자 추가
		//OriginalName에서 subString을 이용해서 확장자를 추출
		name = name+"_"+multipartFile.getOriginalFilename();
//		System.out.println(name);
		
		//5. 파일 저장
		file = new File(file, name);
		
		
		//1) multiPartFile객체의 transferTo메서드 사용
		//multipartFile.transferTo(file);
		
		//2) Spring API FileCopyUtis 객체의 copy메서드 사용
		FileCopyUtils.copy(multipartFile.getBytes(), file);
		
			
		//임시 폴더에서 spring 정식 폴더로 이동
//		String springpath = "D://중간프로젝트/GDJ_DIET/src/main/webapp/resources/images/machineDetail";	
//		file = new File(springpath,multipartFile.getOriginalFilename());
//		FileCopyUtils.copy(multipartFile.getBytes(), file);
		//임시폴더에 uuid포함된 파일 및 originalFile이름으로된 파일로 2개가 올라감
		//sts imge폴더엔 original파일 하나만 올라감
		
		return name;
		}

	}
