<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
 <head>
 <title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <c:import url="../template/common_css.jsp"></c:import>
 </head>
 
 <body>
<!-- modal 추가 -->
    <div class="modal fade" id="vidoeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">영상을 등록하세요</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="title" class="col-form-label">영상 제목</label>
                        <input type="text" class="form-control" id="title" name="title">
                        <label for="urlId" class="col-form-label">영상 URL</label>
                        <input type="text" class="form-control" id="urlId" name="urlId">
                        <label for="detailTitle" class="col-form-label">상세설명</label>
                        <input type="text" class="form-control" id="detailTitle" name="detailTitle">
                        <label for="highLight" class="col-form-label">추천</label>
                        <input type="text" class="form-control" id="highLight" name="highLight">
                        <label for="power" class="col-form-label">운동강도</label>
                        <input type="text" class="form-control" id="power" name="power">
                        <label for="time" class="col-form-label">운동시간</label>
                        <input type="text" class="form-control" id="time" name="time">
                        
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">짧강효확 등록</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
        </div>
    </div>



 <script src="/resources/js/studyBoard.js"></script>
 </body>
</html>