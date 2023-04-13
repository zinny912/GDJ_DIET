<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>짧강효확 수정/삭제 페이지</title>
<link href="../resources/css/infoupdate.css" rel="stylesheet"
	type="text/css" />
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
</head>

<body>

	<div class="row col-5 mx-auto mb-7">
		<strong>추천 / 난이도 / 운동시간을 참고해 내 몸에 알맞은 운동을 직접 선택해 보세요 :)</strong>
	</div>
	<div class="essbox">
		<form action="./update" method="POST" enctype="multipart/form-data"
			id="frm">
			<input type="hidden" value="${dto.num}" name="num">
			<section id="box">
				<div class="mb-3">
					<div>
						<!-- dtailTitleNull임 -->
						<input class="detail1 form-input-title essential"
							value="${dto.detailTitle}" id="detailTitle" name="detailTitle"
							placeholder="detailTitle" />

					</div>
					<fieldset class="f1">
						<label id="machineNum" for="machineNum" class="form-label"
							data-machineNum="${dto.machineNum}">운동기구</label>
					</fieldset>

				</div>

				<div class="container" id="one">
					<!-- 전체를 감싸는 div 태그-->
					<div class="first">
						<!--두개의 div태그로 나누어 왼쪽 절반의 구역으로 나눠줌-->


						<div id="fileList">
							<img src="/resources/images/${dto.boardFileDTOs[0].fileName}"
								alt="">

						</div>
						<button type="button" class="btn btn-primary col-md-3"
							id="fileChange">이미지 교체</button>

					</div>
					<div class="second">
						<!-- 두개의 div태그로 나누어 오른쪾 절반의 구역으로 나눠줌-->
						<div class="detail2">
							<span class="info mx-0">상세설명</span> <input class="l essential"
								id="info" name="info" value="${dto.info}" />

						</div>
						<div class="detail4">
							<span class="highlight">추천: </span> <input class="highlight"
								id="highLight" name="highLight" value="${dto.highLight}" />
						</div>

						<div class="detail3">
							<div class="boxone">
								<span class="power">난이도</span>
								<fieldset class="f1" data-power=${dto.power } id="power">
								<label class="l2"> <input class="ty1 check1" type="radio"
									name="power" value="1"> <span class="s3">★</span>
								</label> <label class="l2"> <input class="ty1 check1" type="radio"
									name="power" value="2"> <span class="s3">★★</span>
								</label> <label class="l2"> <input class="ty1 check1" type="radio"
									name="power" value="3"> <span class="s3">★★★</span>
								</label> <label class="l2"> <input class="ty1 check1" type="radio"
									name="power" value="4"> <span class="s3">★★★★</span>
								</label> <label class="l2"> <input class="ty1 check1" type="radio"
									name="power" value="5"> <span class="s3">★★★★★</span>
								</label>
							</fieldset>
							</div>

							<div class="boxtwo">
								<ul>
									<li><span class="time">운동소요시간</span></li>
									<li><input class="mmss essential" id="time" name="time"
										value="${dto.time}" /></li>
								</ul>
							</div>
						</div>
						<div class="">
							<label>영상링크</label> <input class="golink essential"
								value="${dto.urlId}" id="urlId" name="urlId" />
						</div>

					</div>
				</div>

			</section>

			<fieldset class="f1" style="margin-left: 14%;">
				<label id="machineNum" class="form-label">운동기구</label>
				<c:forEach items="${machines}" var="machine">
					<label class="machineLabel"><input class="machines check2"
						type="radio" name="machineNum" value="${machine.machineNum }">
						<span class="s1">${machine.machineName}</span></label>
				</c:forEach>
				<br> <label class="form-label">운동부위</label>
				<c:forEach items="${bodyList }" var="body">
					<label> <input class="bodys check3" type="checkbox"
						name="bodyNum" value="${body.bodyNum }" /> <span class="s1">${body.bodyName }</span>
					</label>
				</c:forEach>
				<c:forEach items="${dto.bodyDTO}" var="checkbody">
					<input class="checkbodys" type="hidden" disabled="disabled"
						data-bodydata="${checkbody.bodyNum }">
				</c:forEach>
			</fieldset>



		</form>
		<button type="button" class="btn btn-primary" id="submitbtn">수정하기</button>
	</div>
	<script>
		/* setParam('Files'); */
	</script>


	<c:import url="../template/common_js.jsp"></c:import>
	<script src="/resources/js/exerciseAdd.js"></script>
	<script src="/resources/js/essential.js"></script>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="/resources/js/essential.js"></script>
</body>
</html>