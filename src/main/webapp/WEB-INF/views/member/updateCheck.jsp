<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my page</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container-fluid">
<div class="row">
<table class="usermodify-table">
                <tbody>
                <tr>
                    <th scope="row">아이디</th>
                    <td>
                        <div id="ChkId">${sessionMember.id}</div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        비밀번호
                    </th>
                    <td>
                        <input name="pw" data-target="usermodify-auth-password-err" data-errmsg="비밀번호가 일치하지 않습니다." class="usermodify-auth-password-tf member__input-border" type="password">
                        <span class="form-err usermodify-auth-password-err"></span>
                    </td>
                </tr>
                </tbody>
            </table>
                <button id="sbmBtnUpChk" type="button" class="btn btn-secondary">제출</button>
  </div>
</div>


<script src="/resources/js/member/memUpdateCheck.js"></script>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>

</body>
</html>