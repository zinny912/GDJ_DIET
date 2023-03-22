<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row mb-4 mt-4 md-7">
			<h1 class="col-md-5 mx-auto text-center border border-primary pb-3">HealthMachine
				detail And OptionAdd page</h1>

			<div class="row">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>NUM</th>
							<th>category</th>
							<th>machinename</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${dto.machineNum}</td>
							<td>${dto.categoryNum}</td>
							<td>${dto.machineName}</td>


						</tr>
					</tbody>
				</table>

				<div class="row" id="optionSelect"
					data-machineNum="${dto.machineNum}">
					<div id="opt1" data-optName="${dto.option1 }">
						<select class="form-select mb-3" id="optSelect1">
							<option class="option" id="default">${dto.option1}선택</option>
						</select>
					</div>
					<div id="opt2" data-optName="${dto.option2 }"></div>
					<div id="opt3" data-optName="${dto.option3 }"></div>
					<div id="opt4" data-optName="${dto.option4 }"></div>
				</div>

			</div>
		</div>
	</div>
	<%-- <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/images/studyclass.jpg" alt="..." /></div>
                <div class="col-lg-5">
                    <h2 class="font-weight-light">${dto.studyName}</h2>
                    <h3 class="font-weight-light">${dto.studyCost}원</h3>
                    <hr class="my-hr2">
            		<div class="text-center">
                    <h6><strong>스터디 일정안내</strong></h6>
                    ${dto.studyPeriod} 스터디 기간
                    <br>반배정 문자 일괄 발송
                    <br>문의:010-0000-1111
                    </div>
                    <br>
                    <a class="btn btn-primary" href="#!">장바구니에 담기</a>
                </div>
            </div>
            <!-- Call to Action-->
            
            <div class="col-12 w-100 text-center">
			        <div class="row">
			        <div class="col-md-4">
			          <div class="nav-link" id="studyQnaInfo" style="cursor: pointer">상세정보</div>
			        </div>
			        <div class="col-md-4">
			         <div class="nav-link" style="cursor: pointer">구매평</div>
			        </div>
			        <div class="col-md-4">
			          <div class="nav-link" id="studyQnaList" data-study-studyNum="${dto.studyNum}" style="cursor: pointer">Q&amp;A</div>
			        </div>
			        <hr class="my-hr2">
			        </div>
  			</div>
  			
  			<div class="my-5" id="studyQnaListResult">
  				<img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/images/studyDetailinfomation.jpg" alt="..." />
  				<img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/images/studyDetailinfomation2.jpg" alt="..." />
  			</div>
  	</div> --%>
<a href="optionAdd?machineNum=${dto.machineNum}">add</a>



	<script src="/resources/js/getOption.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>