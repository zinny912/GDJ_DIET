<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>짧강효확 수정/삭제 페이지</title>
    <link href="../resources/css/info.css" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
<c:import url="../template/common_css.jsp"></c:import>
<c:import url="../template/header.jsp"></c:import>
</head>

<body>

			<div class="row col-5 mx-auto mb-7">
				<strong>추천 / 난이도 / 운동시간을 참고해 내 몸에 알맞은 운동을 직접 선택해 보세요 :)</strong>
			</div>

<form action="./update" method="POST" enctype="multipart/form-data" id="frm">
    <section id="box"> 
               <div><input class="detail1 form-input-title" value="${dto.detailTitle}" id="detailTitle"  name="detailTitle"/> <input id="machineNum" name="machineNum" value="${dto.machineName}"/></div>
				
        <div class="container" id="one"> <!-- 전체를 감싸는 div 태그-->
            <div class="first"> <!--두개의 div태그로 나누어 왼쪽 절반의 구역으로 나눠줌-->
            <input type="hidden"
							value="${dto.boardFileDTOs[0].fileName}"
							name="fileNum">
                <img src="/resources/images/${dto.boardFileDTOs[0].fileName}" alt="">
                <div id="fileList">
			<button type="button" class="btn btn-primary col-md-2" id="fileAdd">이미지
				업로드</button>
		</div>
        
            </div>
          <div class="second"> <!-- 두개의 div태그로 나누어 오른쪾 절반의 구역으로 나눠줌-->
                    <div class="detail2">
                    
                        <input class="l" id="info" name="info" value="${dto.info}"/>
                       
                    </div>
                    <div class="detail4">
                    
                  <input class="highlight" id="highLight" name="highLight" value="${dto.highLight}"/> 
              
                  </div>
                  <div class="detail3">  
                        <div class="boxone"> 
                            <ul>							
							<li> 
                                    <span class="power">난이도</span>
                            </li>
                            <li>  
                                    <c:choose>
						<c:when test="${dto.power eq 0}">
							<span class="star">☆☆☆☆☆</span> 
						</c:when>
						<c:when test="${dto.power eq 1}">
							<span class="star">★☆☆☆☆</span> 
						</c:when>
						<c:when test="${dto.power eq 2}">
							<span class="star">★★☆☆☆</span> 
						</c:when>
						<c:when test="${dto.power eq 3}">
							<span class="star">★★★☆☆</span> 
						</c:when>
						<c:when test="${dto.power eq 4}">
							<span class="star">★★★★☆</span> 
						</c:when>
						<c:when test="${dto.power eq 5}">
							<span class="star">★★★★★</span> 
						</c:when>
					</c:choose>
                            </li>
                            </ul>
                        </div>

                  		<div class="boxtwo"> 
                            <ul>
                            <li>
                                    <span class="time">운동소요시간 </span>
                                  
                                    </li>
                                    <li>
                                    <input class="mmss" id="time" name="time" value="${dto.time}"/>
                                </li>
                            </ul>
                        </div>

                    </div>
                   <input class="golink" value="${dto.urlId}" id="urlId" name="urlId"/>
                    <a class="golink" href="./video?num=${dto.num}">루틴 보러가기</a>
				
				</div>
				</div>
                    
    		</section>
    		
    	<button type="submit" class="btn btn-primary"> 수정하기 </button>
    	
    </form>	
<script>
	
		setParam('Files');
</script>
    	
    	
 <script src="/resources/js/exerciseAdd.js"></script>   	
 <c:import url="../template/footer.jsp"></c:import>   
</body>
</html>