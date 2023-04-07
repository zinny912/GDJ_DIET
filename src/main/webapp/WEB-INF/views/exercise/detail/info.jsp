<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>list</title>
    <link href="/resources/css/info.css" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
</head>

<body>

 	<c:forEach items="{exerciseList}" var="dto">
	
    <section id="box"> <!--레이아웃-->    
                <p class="maintitle" id="detailTitle" name="detailTitle">${dto.detailTitle}</p> 
				<c:forEach items="{exerciseList}" var="dto">
					<button id="machine">${dto.machineNum}</button>
				</c:forEach>
				
        <div class="container" id="one"> <!-- 전체를 감싸는 div 태그-->
            <div class="first"> <!--두개의 div태그로 나누어 왼쪽 절반의 구역으로 나눠줌-->
                <img src="/resources/images/${dto.boardFileDTOs[0].oriName}" alt="">
            </div>
          <div class="second"> <!-- 두개의 div태그로 나누어 오른쪾 절반의 구역으로 나눠줌-->
                    <div class="productdetail">
                        <span class="l">${dto.info}</span> 
                    </div>
                    <div class="productdetail3">
                  <p class="highlight">${dto.highLight}</p>
                  </div>
                  <div class="productdetail2"> 
                        <div class="boxone"> 
                            <ul>							
							<li>
                                    <span class="power">난이도</span>
                            </li>
                            <li>        
                                    <span class="star">${dto.power}</span>
                            </li>
                            </ul>
                        </div>

                  		<div class="boxtwo"> 
                            <ul>
                            <li>
                                    <span class="time">운동소요시간 </span>
                                    </li>
                                    <li>
                                    <span class="mmss">${dto.time}</span>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="golink" src="/video?num=${dto.num}">루틴 보러가기</div>
	
				</div>
				</div>
                    
    		</section>
    	</c:forEach>
    
</body>
</html>