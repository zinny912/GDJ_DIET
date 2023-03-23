<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
	
<div class="container-fluid" >
	<div class="row my-5">
		<div class="col-10 mx-auto" style="background-color: #eee;">		




<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col" colspan="2">First</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>


<table class="cartTable" summary="장바구니 상품명, 제품가격, 선택한수량, 총결제비용 정보 및 결제 상품으로 선택,해제 및 수량변경, 삭제 기능 제공표">

            <colgroup><col width="50"><col width="80"><col width="*"><col width="90"></colgroup>
            
<thead>
<tr class="head" style="height: 40px; border-Bottom: 1px solid black;">
    <th scope="col" class="all-select-event" colspan="2">
    	<label><input title="모든 상품을 결제상품으로 설정" type="checkbox" class="all-deal-select">
    	<span>&nbsp;&nbsp;전체선택</span>
    	</label></th>
    <th scope="colgroup" id="th-product-box">상품정보</th>
    <th scope="col" id="th-unit-total-price">상품금액</th>
</tr>
</thead>

<tbody  id="cartTable-other" >            

<!-- 상품들 --> 
<tr class="cart-deal-item count0 cart-sc-items last-cart-sc-items" data-item-status="CHECKED" data-adult="false" data-index="0" data-count="1" data-bundle-id="22414959833" data-bundle-type="PRODUCT" data-app="" data-has-id="false" data-has-wid="false" data-group-type="partner">

	<!-- 상품체크버튼 -->
	<td class="product-select-event">
	<input type="checkbox" title="프루틴 고당도 애플망고선물세트 상품을 결제상품으로 설정" checked="checked" value="22414959833" class="dealSelectChk">
	</td>

	<!-- 상품이미지 -->
	<td>
	<a href="//www.coupang.com/vp/products/2080286008?vendorItemId=70888587844" class="moveProduct">
	<img src="//thumbnail10.coupangcdn.com/thumbnails/remote/120x120ex/image/vendor_inventory/cac8/efd7e4a42ea425909633ea10e636aaa35e9e0cb7dd98a404f74b069f5645.png" width="78" height="78" class="product-img img" alt="프루틴 고당도 애플망고선물세트" data-bundle-id="22414959833">
	</a>
	</td>



	
<!-- 상품상세 JS로 만들어...-->
<td class="product-box p-3">

	<!-- 상품제목 -->
	<div class="product-name-part pb-2" style="border-Bottom: 1px solid black;">
	<a href="//www.coupang.com/vp/products/2080286008?vendorItemId=70888587844" class="product-name moveProduct modify-color">프루틴 고당도 애플망고선물세트, 1박스, 항공직송 애플망고 6과 특대(2.7KG내외) 실속형</a>
	</div>


<div id="70888587844" class="option-item modify-float" data-quantity="1" data-vendor-id="A00077089" data-vi="70888587844" data-vip="" data-pid="2080286008" data-itemid="3534091837" data-bundle-id="22414959833" data-shipping-place-id="18673" data-delivery-fee="0" data-retail-rocket-debadging="false">
<div class="option-item-info" data-restock-notification-state="false">
<div class="option-name">
<span class="option-item-name" style="display:none;">프루틴 고당도 애플망고선물세트, 1박스, 항공직송 애플망고 6과 특대(2.7KG내외) 실속형</span>
</div>



</div>
<div class="option-price-part" data-sale-price="39910">


<span class="unit-cost" data-sale-price="39910"><span class="sr-only">제품가격</span>39,910원</span>
<span class="select-select">
<select class="quantity-select" data-url="/memberCartItem/quantity/22414959833/" data-quantity="1" data-all="true" title="프루틴 고당도 애플망고선물세트, 1박스, 항공직송 애플망고 6과 특대(2.7KG내외) 실속형 수량변경">


<option value="1" selected="selected">1</option>

<option value="2">2</option>

<option value="3">3</option>

<option value="4">4</option>

<option value="5">5</option>

<option value="6">6</option>

<option value="7">7</option>

<option value="8">8</option>

<option value="9">9</option>

<option value="10">10+</option>

</select>
</span>
<span class="select-text">
<input type="text" class="quantity-text" title="프루틴 고당도 애플망고선물세트, 1박스, 항공직송 애플망고 6과 특대(2.7KG내외) 실속형 수량변경" maxlength="4" value="1" data-url="/memberCartItem/quantity/22414959833/" data-all="true">
<input type="button" class="quantity-chg none" value="수량변경">
</span>
<span class="unit-price-area"><span class="unit-price"><span class="sr-only">구매가격</span>39,910원</span></span>


<a href="/memberCartItem/deleteItems?cartItemIds[]=22414959833&amp;itemStatus=CHECKED" data-url="/memberCartItem/deleteItems?cartItemIds[]=22414959833&amp;itemStatus=CHECKED" data-all="true" class="delete-option"><span class="sr-only">프루틴 고당도 애플망고선물세트, 1박스, 항공직송 애플망고 6과 특대(2.7KG내외) 실속형 상품삭제</span></a>



</div>
</div>
<div class="badge-list">





</div>
</td>
<!-- 상품상세 끝 -->




	<!-- 상품금액 -->
	<td class="unit-total-price" headers="th-unit-total-price">
	<div class="unit-total-sale-price">39,910원</div>
	</td>



</tr>        

            
<!-- 총금액 -->
<tr class="bundle-price-total" style="border-Top: 1px solid black; height: 50px;">
    <td colspan="5">
        주문금액 <span class="total-order-price number"></span>원
</td></tr>

</tbody>


            
        </table>

		</div>	
	</div>


</div>
	
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>