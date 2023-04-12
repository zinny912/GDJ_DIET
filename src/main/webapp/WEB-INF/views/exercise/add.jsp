<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>루틴등록-관리자페이지</title>
<meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../resources/css/info.css" rel="stylesheet" type="text/css" />
<c:import url="../template/common_css.jsp"></c:import>
<c:import url="../template/header.jsp"></c:import>
<!-- radio box style -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

*{
font-family: "IBM Plex Sans KR", sans-serif;
}
.l1 {
	font-size: 18px;
	line-height: 2rem;
	padding: 0.2em 0.4em;
	font-weight: 700;
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

.ty1, .ty2 {
	vertical-align: middle;
	appearance: none;
	border: max(1px, 0.1em) solid gray;
	border-radius: 50%;
	width: 1em;
	height: 1em;
	transition: border 0.2s ease-in-out;
}

 .ty2:checked {
	border: 0.3em solid tomato;
}

.ty1, .ty2:focus-visible {
	outline-offset: max(0.5px, 0.1em);
	outline: max(0.5px, 0.1em) dotted tomato;
}

.ty2 {
-webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center
}

.ty1, .ty2:hover {
	box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
	cursor: pointer;
}

.ty1, .ty2 :disabled {
	background-color: lightgray;
	box-shadow: none;
	opacity: 0.7;
	cursor: not-allowed;
}

.ty1, .ty2:disabled+.s1 {
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

*, *::before, *::after {
	box-sizing: border-box;
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="row mb-4 mt-4 md-7">
			<h1 class="h1">짧강효확 상세 페이지 등록</h1>
		</div>
	</div>
<div class="container">
	<div class="row">
	<form class="col-md-7 mx-auto" action="./add" method="post"
		enctype="multipart/form-data">
		<div class="row justify-content-center">

			<div class="mb-3">
				<label class="l1" for="bodyNum" id="bodyNum"> 운동부위(중복선택가능) </label>

				<fieldset class="f1">
					<label class="l2"> 
					<input class="ty1" type="checkbox"
						name="bodyNum" value="36" /> <span class="s1">상체ALL</span>
					</label> 
					<label class="l2"> <input class="ty1" type="checkbox"
						name="bodyNum" value="21" /> <span class="s1">얼굴</span>
					</label> 
					<label class="l2"> <input class="ty1" type="checkbox"
						name="bodyNum" value="22" /> <span class="s1">겨드랑이</span>
					</label> 
					<label class="l2"> <input class="ty1" type="checkbox"
						name="bodyNum" value="23" /> <span class="s1">팔뚝살</span>
					</label> 
					<label class="l2"> <input class="ty1" type="checkbox"
						name="bodyNum" value="28" /> <span class="s1">직각어깨</span>
					</label> 
					<label class="l2"> <input class="ty1" type="checkbox"
						name="bodyNum" value="29" /> <span class="s1">등</span>
					</label> 
					<label class="l2"> <input class="ty1" type="checkbox"
						name="bodyNum" value="30" /> <span class="s1">허리</span>
					</label> 
					<label class="l2"> <input class="ty1" type="checkbox"
						name="bodyNum" value="37" /> <span class="s1">하체All</span>
					</label>
				</fieldset>
				<fieldset class="f1">
					<label class="l2"> 
					<input class="ty1" type="checkbox" name="bodyNum" value="32" /> 
						<span class="s1">복근&뱃살</span>
					</label> <label class="l2"> <input class="ty1" type="checkbox"
						name="bodyNum" value="33" /> <span class="s1">아랫배</span>
					</label> <label class="l2"> <input class="ty1 check" type="checkbox"
						name="bodyNum" value="24" /> <span class="s1">애플힙</span>
					</label> <label class="l2"> <input class="ty1 check" type="checkbox"
						name="bodyNum" value="25" /> <span class="s1">종아리</span>
					</label> <label class="l2"> <input class="ty1 check" type="checkbox"
						name="bodyNum" value="26" /> <span class="s1">앞벅지</span>
					</label> <label class="l2"> <input class="ty1 check" type="checkbox"
						name="bodyNum" value="27" /> <span class="s1">안쪽허벅지</span>
					</label> <label class="l2"> <input class="ty1 check" type="checkbox"
						name="bodyNum" value="31" /> <span class="s1">승마살</span>
					</label>
				</fieldset>
			</div>

			<div class="mb-3">
				<label for="detailTitle" class="form-label l1">영상 제목</label> <input
					type="text" name="detailTitle" class="form-control"
					id="detailTitle" placeholder="영상제목 입력">
			</div>

			<div class="mb-3">
					<label for="machineNum" class="l1">홈트용품(최대1개)</label>
				<fieldset class="f1">	
					<c:forEach items="${machines}" var="machine">
						<label class="machineLabel"> <input class="ty2"
							type="radio" name="machineNum" value="${machine.machineNum}"/>
							<span class="s1">${machine.machineName}</span>
							<%-- <c:if > --%>
						</label>
					</c:forEach>
				</fieldset>

			</div>

			<div class="mb-3">
				<label for="urlId" class="form-label l1">영상주소/URL</label> <input
					type="text" name="urlId" class="form-control" id="urlId"
					placeholder="영상주소 입력">
			</div>

			<div class="mb-3">
				<label for="info" class="form-label l1">상세설명</label> <input type="text"
					name="info" class="form-control" id="info" placeholder="상세설명 입력">
			</div>


			<div class="mb-3">
				<label for="highLight" class="form-label l1">추천</label> <input
					type="text" name="highLight" class="form-control" id="highLight"
					placeholder="추천 입력">
			</div>

			<div class="mb-3">
				<label class="l1" for="power" id="power">운동강도</label>
				<fieldset class="f1">
					<label class="l2"> <input class="ty2" type="radio"
						name="power" value="1" checked /> <span class="s3">★</span>
					</label> <label class="l2"> <input class="ty2" type="radio"
						name="power" value="2" /> <span class="s3">★★</span>
					</label> <label class="l2"> <input class="ty2" type="radio"
						name="power" value="3" /> <span class="s3">★★★</span>
					</label> <label class="l2"> <input class="ty2" type="radio"
						name="power" value="4" /> <span class="s3">★★★★</span>
					</label> <label class="l2"> <input class="ty2" type="radio"
						name="power" value="5" /> <span class="s3">★★★★★</span>
					</label>
				</fieldset>
			</div>

			<div class="mb-3">
				<label for="time" class="form-label l1">운동시간</label> 
				<input type="text" name="time" class="form-control" id="time" placeholder="운동시간 입력 00:00">
			</div>
		</div>

		<div id="fileList">
			<button type="button" class="btn btn-primary col-md-2" id="fileAdd">이미지 업로드</button>
		</div>

		<button type="submit" class="btn btn-outline-primary col col-md-4 offset-md-10">
			짧강효확 상세페이지 등록</button>
	</form>
</div>
</div>




	<!-- <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> -->
	<script src="/resources/js/exerciseAdd.js"></script>
<%-- 	<c:import url="../template/footer.jsp"></c:import> --%>
	<c:import url="../template/common_js.jsp"></c:import>

	<script>
		setMax(1);
		setParam('Files');
	</script>
</body>
</html>


