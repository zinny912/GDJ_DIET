<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>루틴등록-관리자페이지</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../resources/css/info.css" rel="stylesheet" type="text/css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap"
	rel="stylesheet">
<c:import url="../template/common_css.jsp"></c:import>
<c:import url="../template/header.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/selectbox.css">

<!-- radio box style -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

.ty1:disabled+.s1 {
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
	<div class="container-fluid">
		<div class="row mb-4 mt-4 md-7">
			<h1 class="h1">짧강효확 상세 페이지 등록</h1>
		</div>
	</div>

	<form class="col-md-7" action="./add" method="post"
		enctype="multipart/form-data">
		<div class="row justify-content-center">

			<div class="mb-3">
				<label class="l1" for="bodyNum" id="bodyNum"> 운동부위 </label>

				<fieldset class="f1">
					<label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="36" checked /> <span class="s1">상체ALL</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="21" /> <span class="s1">얼굴</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="22" /> <span class="s1">겨드랑이</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="23" /> <span class="s1">팔뚝살</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="28" /> <span class="s1">직각어깨</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="29" /> <span class="s1">등</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="30" /> <span class="s1">허리</span>
					</label>
				</fieldset>
				<fieldset class="f1">
					<label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="32" /> <span class="s1">복근&뱃살</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="33" /> <span class="s1">아랫배</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="24" /> <span class="s1">애플힙</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="25" /> <span class="s1">종아리</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="26" /> <span class="s1">앞벅지</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="27" /> <span class="s1">안쪽허벅지</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="bodyNum" value="31" /> <span class="s1">승마살</span>
					</label>
				</fieldset>
			</div>

			<div class="mb-3">
				<label for="detailTitle" class="form-label">영상 제목</label> <input
					type="text" name="detailTitle" class="form-control"
					id="detailTitle" placeholder="영상제목 입력">
			</div>

			<div class="mb-3">
				<label for="machineNum" class="form-label">운동기구</label> <input
					type="text" name="machineNum" class="form-control" id="machineNum"
					placeholder="운동기구 입력">
			</div>

			<div class="mb-3">
				<label for="urlId" class="form-label">영상주소URL</label> <input
					type="text" name="urlId" class="form-control" id="urlId"
					placeholder="영상주소 입력">
			</div>

			<div class="mb-3">
				<label for="info" class="form-label">상세설명</label> <input type="text"
					name="info" class="form-control" id="info" placeholder="상세설명 입력">
			</div>


			<div class="mb-3">
				<label for="highLight" class="form-label">추천 : </label> <input
					type="text" name="highLight" class="form-control" id="highLight"
					placeholder="추천 입력">
			</div>

			<div class="mb-3">
				<label class="l1" for="power" id="power">운동강도</label>
				<fieldset class="f1">
					<label class="l2"> <input class="ty1" type="radio"
						name="power" value="1" checked /> <span class="s3">★</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="power" value="2" /> <span class="s3">★★</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="power" value="3" /> <span class="s3">★★★</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="power" value="4" /> <span class="s3">★★★★</span>
					</label> <label class="l2"> <input class="ty1" type="radio"
						name="power" value="5" /> <span class="s3">★★★★★</span>
					</label>
				</fieldset>
			</div>

			<div class="mb-3">
				<label for="time" class="form-label">운동시간</label> <input type="text"
					name="time" class="form-control" id="time" placeholder="추천 입력">
			</div>
		</div>

		<div id="fileList">
			<button type="button" class="btn btn-primary col-md-2" id="fileAdd">이미지
				업로드</button>
		</div>

		<button type="submit"
			class="btn btn-outline-primary col col-md-4 offset-md-10">
			짧강효확 상세페이지 등록</button>
	</form>





	<%-- <!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div> --%>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/js/exerciseAdd.js"></script>
	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/common_js.jsp"></c:import>

	<script>
		setMax(1);
		setParam('Files');
	</script>
</body>
</html>


