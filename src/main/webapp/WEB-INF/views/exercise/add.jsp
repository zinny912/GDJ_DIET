<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>루틴등록-관리자페이지</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <c:import url="../template/common_css.jsp"></c:import>
    <c:import url="../template/header.jsp"></c:import>
    <link rel="stylesheet" href="/resources/css/selectbox.css">
  
<!-- radio box style -->				

<style>

.l1 {
  font-size: 18px;
  line-height: 2rem;
  padding: 0.2em 0.4em;
  
}

.l2 {
  font-size: 15px;
  line-height: 1.5rem;
  padding: 0.2em 0.4em;
}

.s1 {
  vertical-align: middle;
  color: #3d435c;
}

.s3 {
  vertical-align: middle;
  color: tomato;
}

.ty1 {
  vertical-align: middle;
  appearance: none;
  border: max(1px, 0.1em) solid gray;
  border-radius: 50%;
  width: 1em;
  height: 1em;
  transition: border 0.5s ease-in-out;
}

.ty1:checked {
  border: 0.3em solid tomato;
}

.ty1:focus-visible {
  outline-offset: max(2px, 0.1em);
  outline: max(2px, 0.1em) dotted tomato;
}

.ty1:hover {
  box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
  cursor: pointer;
}

.ty1:disabled {
  background-color: lightgray;
  box-shadow: none;
  opacity: 0.7;
  cursor: not-allowed;
}

.ty1:disabled + .s1 {
  opacity: 0.7;
  cursor: not-allowed;
}

/* Global CSS */
.f1 {
  display: flex;
  justify-content: center;
  border: none;
  background: #e6e6e6;
  margin: 0px;
  padding: 20px 10px;
}

.h1 {
  display: flex;
  justify-content: center;
  border: none;
  background: #e6e6e6;
  margin: 0px;
  padding: 20px 10px;
}

*,
*::before,
*::after {
  box-sizing: border-box;
}

</style>  
  </head>
  <body>  
	<div class="container-fluid">
		<div class="row mb-4 mt-4 md-7">
			<h1 class="h1">이달의 루틴 등록 페이지</h1>
		</div>
	 <script type="text/javascript">
		$(function(){
		    $("#selboxDirect").hide();
		    $("#selbox").change(function() {
		        if($("#selbox").val() == "direct") {
		            $("#selboxDirect").show();
		            }  else {
		            $("#selboxDirect").hide();
		        }
		    })
		});
		</script>
		<div class="row col-md-7 mx-auto">
			<form action="./add" method="POST" enctype="multipart/form-data">
				
			<label for="machineNum" class="form-label">운동기구</label>
			   <div class="selectbox"></div>			
				<div class="row" id="machineSelect" data-machineNum="${machineList.machineNum}">
					<div id="opt1" data-optName="${machineList.machineName}">
						<select class="form-select mb-3" id="optSelect1">
							<option class="option" id="default">${machineList.machineName}선택</option>
						</select>
					</div>
					
				</div>
					<div class="selectbox__arrow"></div>
				

						
						
					   	<%--  <option value="">-선택-</option>
					    	<c:forEach items="${healthMachineList}" var="healthMachineDTO">
					      	  <option value="${healthMachineDTOs[0].machineNum}">
					         	   ${healthMachineDTOs[0].machineName}
					       	 </option>
					   		 </c:forEach> 
						</select>--%>
			      
	
			   	<label for="machineNum" class="form-label">운동기구</label>
			    <div class="selectbox">
			      <select id="machineNum" name="machinNum">
			        <option value="">-선택-</option>
			        <option value="1">덤벨</option>
			        <option value="2">폼롤러</option>
			      </select>
			      	<div class="selectbox__arrow"></div>
				</div>
			
			
			    <label for="title" class="form-label">루틴이름</label>
			    <div class="selectbox">
			      <select id="selbox" name="selbox">
			        <option value="">선택</option>
			        <option value="1">승마살 싹뚝루틴</option>
			        <option value="2">허벅지 잘라내기</option>
			        <option value="direct">직접입력</option>
			      </select>
			      	<div class="selectbox__arrow"></div>
						<input  type="text" id="selboxDirect" name="selboxDirect" placeholder="루틴제목 입력"/>
			    	</div>
			
<!-- 
					<select id="selbox" name="selbox">
					<option value="">선택</option>			
					<option value="1">하나</option>
					<option value="2">둘</option>
					<option value="3">셋</option>
					<option value="direct">직접입력</option>
				</select> -->

				<label for="days" class="form-label">DAYS</label>
			    <div class="selectbox">
			      <select id="selbox" name="selbox">
			        <option value="">선택</option>
			        <option value="1일차">1일차</option>
			        <option value="2일차">2일차</option>
			        <option value="direct">직접입력</option>
			      </select>
				<div class="selectbox__arrow"></div>
						<input  type="text" id="selboxDirect" name="selboxDirect" placeholder="일차 입력"/>
			    	</div>
			    	
				<label for="days" class="form-label">루틴영상</label>
			    <div class="selectbox">
			      <select id="selbox" name="selbox">
			        <option value="">선택</option>
			        <option value="1일차">1일차</option>
			        <option value="2일차">2일차</option>
			        <option value="direct">직접입력</option>
			      </select>
				<div class="selectbox__arrow"></div>
						<input  type="text" id="selboxDirect" name="selboxDirect" placeholder="http://youtube.com/ /부터 입력"/>
			    	</div>
				
				 <div class="container-fluid">
					<label class="l1" for="power" id="power">운동강도</label>					
					<fieldset class="f1">
						  <label class="l2">
						    <input class="ty1" type="radio" name="power" value="1" checked />
						    <span class="s3">★</span>
						  </label>
						  <label class="l2">
						    <input class="ty1" type="radio" name="power" value="2" />
						    <span class="s3">★★</span>
						  </label>
						  <label class="l2">
						    <input class="ty1" type="radio" name="power" value="3" />
						    <span class="s3">★★★</span>
						  </label>
						  <label class="l2">
						    <input class="ty1" type="radio" name="power" value="4" />
						    <span class="s3">★★★★</span>
						  </label>
						   <label class="l2">
						    <input class="ty1" type="radio" name="power" value="5" />
						    <span class="s3">★★★★★</span>
						  </label>	
					    </fieldset>
					    </div>
					    
					    
				<div class="container-fluid">
				<label class="l1" for="bodyPart" id="bodyPart"> 운동부위 </label>					
				<fieldset class="f1">
					  <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="전신" checked />
					    <span class="s1">전신</span>
					  </label>
					  <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="얼굴" />
					    <span class="s1">얼굴</span>
					  </label>
					  <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="겨드랑이" />
					    <span class="s1">겨드랑이</span>
					  </label>
					  <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="팔뚝살" />
					    <span class="s1">팔뚝살</span>
					  </label>
					   <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="직각어깨" />
					    <span class="s1">직각어깨</span>
					  </label>	
					  <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="등" />
					    <span class="s1">등</span>
					  </label>	
					  <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="허리" />
					    <span class="s1">허리</span>
					  </label>	
					</fieldset>
					<fieldset class="f1">
					  <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="복근&뱃살" />
					    <span class="s1">복근&뱃살</span>
					  </label>	
					  <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="아랫배" />
					    <span class="s1">아랫배</span>
					  </label>	
					  <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="애플힙" />
					    <span class="s1">애플힙</span>
					  </label>	  
					  <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="종아리" />
					    <span class="s1">종아리</span>
					  </label>	
					  <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="앞벅지" />
					    <span class="s1">앞벅지</span>
					  </label>	
					   <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="안쪽허벅지" />
					    <span class="s1">안쪽허벅지</span>
					  </label>	
					   <label class="l2">
					    <input class="ty1" type="radio" name="bodyPart" value="승마살" />
					    <span class="s1">승마살</span>
					  </label>	
				</fieldset>
				</div>	
				
				<div class="container-fluid">
				<label class="l1" for="time" id="time"> 운동시간 </label>					
				<fieldset class="f1">
					  <label class="l2">
					    <input class="ty1" type="radio" name="time" value="5분" checked />
					    <span class="s1">5분</span>
					  </label>
					
					  <label class="l2">
					    <input class="ty1" type="radio" name="time" value="10분" />
					    <span class="s1">10분</span>
					  </label>
					
					  <label class="l2">
					    <input class="ty1" type="radio" name="time" value="15분" />
					    <span class="s1">15분</span>
					  </label>
					
					  <label class="l2">
					    <input class="ty1" type="radio" name="time" value="20분" />
					    <span class="s1">20분</span>
					  </label>
					  <label class="l2">
					    <input class="ty1" type="radio" name="time" value="25분" />
					    <span class="s1">25분</span>
					  </label>
					  <label class="l2">
					    <input class="ty1" type="radio" name="time" value="30분" />
					    <span class="s1">30분</span>
					  </label>	  
				</fieldset>
				</div>
				
				<div id="fileList">
					<button type="button" class="btn btn-primary col-md-2" id="fileAdd">이미지 업로드</button>
				</div>

				<button type="submit"
					class="btn btn-outline-primary col col-md-4 offset-md-10">이달의 루틴 등록
				</button>
			</form>
		</div>
	</div>
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/exerciseAdd.js"></script> 
<c:import url="../template/footer.jsp"></c:import>  
<c:import url="../template/common_js.jsp"></c:import>   
	
	<script>
		setMax(1);
		setParam('Files');
	</script>
</body>
</html>
     

