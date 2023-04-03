<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 <title>구디다이어트</title>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <c:import url="../template/common_css.jsp"></c:import>
 <link href="/resources/css/cartList.css" rel="stylesheet"/>

</head>
<body>
<c:import url="../template/header.jsp"></c:import>
    <section class="cart">
        <div class="cart__information">
            <ul>
                <li>얼리버드는 매월 마지막 날, 오후 8시 (4시간)</li>
                <li>얼리버드는 선착순이므로, 결제 도중 마감 될 수 있습니다.</li>
            </ul>
        </div>
        <table class="cart__list">
                <thead>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td colspan="2">상품정보</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="cart__list__detail">
                        <td style="width: 2%;"><input type="checkbox"></td>
                        <td style="width: 13%;">
                            <img src="image/mouse.jpg" alt="magic mouse">
                        </td>
                        <td style="width: 41%;"><a href="#">컴퓨존</a><span class="cart__list__smartstore"> 스마트스토어</span>
                            <p>[애플] Magic Mouse [MK2E3KH/A]</p>
                            <span class=" price">88,900원</span>
                        </td>
                        <td style="width: 29%;"><span class="price">88,900원</span><br>
                            <button class="cart__list__orderbtn btn btn-primary">주문하기</button>
                        </td>
                        <td style="width: 29%;">무료</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3"><input type="checkbox"> <button class="cart__list__optionbtn">선택상품 삭제</button>
                            <button class="cart__list__optionbtn">선택상품 찜</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
        </table>
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left btn btn-primary">쇼핑 계속하기</button>
            <button class="cart__bigorderbtn right btn btn-primary">주문하기</button>
        </div>
    </section>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>