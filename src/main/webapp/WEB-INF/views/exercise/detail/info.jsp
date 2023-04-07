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
<c:forEach items="${exerciseList}" var="dto">
	<div class="exercise-item">
		<h3>${dto.detailTitle}</h3>
		<div class="exercise-info">
			<p>${dto.info}</p>
			<p>${dto.power}kg</p>
			<p>${dto.time}분</p>
			<p>${dto.highLight}</p>
		</div>
		<c:forEach items="${dto.boardFileDTOs}" var="fileDto">
			<img src="/board/display?fileName=${fileDto.fileName}">
		</c:forEach>
		<video src="/resources/videos/${dto.urlId}.mp4" controls></video>
	</div>
</c:forEach>
</body>
</html>