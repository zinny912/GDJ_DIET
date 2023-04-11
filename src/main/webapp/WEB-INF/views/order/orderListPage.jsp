<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<c:import url="../template/common_css.jsp"></c:import>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"> -->
<style type="text/css">
body {
            min-height: 100vh;
            background-size: cover;
            font-family: 'Lato', sans-serif;
            color: rgba(116, 116, 116, 0.667);
/*             background: linear-gradient(140deg , #fff , 50% , #BA68C8);     */

        }
        .container-fluid {
            margin-top: 50px ;
        }

        p {
            font-size: 14px;
            margin-bottom: 7px;

        }

        .small {
            letter-spacing: 0.5px !important;
        }

        .card-1 {
            box-shadow: 2px 2px 10px 0px rgb(190, 108, 170);
        }

        hr {
            background-color: rgba(248, 248, 248, 0.667);
        }


        .bold {
            font-weight: 500;
        }

        .change-color {
            color: #AB47BC !important;
        }

        .card-2 {
            box-shadow: 1px 1px 3px 0px rgb(112, 115, 139);

        }

        .fa-circle.active {
            font-size: 8px;
            color: #AB47BC;
        }

        .fa-circle {
            font-size: 8px;
            color: #aaa;
        }

        .rounded {
            border-radius: 2.25rem !important;
        }


        .progress-bar {
            background-color: #AB47BC !important;
        }


        .progress {
            height: 5px !important;
            margin-bottom: 0;
        }

        .invoice {
            position: relative;
            top: -70px;
        }

        .Glasses {
            position: relative;
            top: -12px !important;
        }

        .card-footer {
            background-color: #AB47BC;
            color: #fff;
        }

        h2 {
            color: rgb(78, 0, 92);
            letter-spacing: 2px !important;
        }

        .display-3 {
            font-weight: 500 !important;
        }

        @media (max-width: 479px) {
            .invoice {
                position: relative;
                top: 7px;
            }

            .border-line {
                border-right: 0px solid rgb(226, 206, 226) !important;
            }

        }

        @media (max-width: 700px) {

            h2 {
                color: rgb(78, 0, 92);
                font-size: 17px;
            }

            .display-3 {
                font-size: 28px;
                font-weight: 500 !important;
            }
        }

        .card-footer small {
            letter-spacing: 7px !important;
            font-size: 12px;
        }

        .border-line {
            border-right: 1px solid rgb(226, 206, 226)
        }
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<div class="container-fluid">
		<div class="row">
			<c:import url="../member/memberHeader.jsp"></c:import>

			<div class="col-8">
				<div class="row "><!-- row -->




					
<!-- oder반복 -->
					<c:forEach items="${orderDTOs}" var="orderDTO">
					
<!-- 상품반복 -->	
        <div class="card card-1 mb-3 d-flex  justify-content-center">

            <div class="card-body">
            
                <div class="row justify-content-between mb-3">
                    <div class="col-auto"> <h6 class="color-1 mb-0 change-color">Receipt</h6> </div>
                    <div class="col-auto  "> <small>Receipt Voucher : 1KAU9-84UIL</small> </div>
                </div>
							
<!-- 스터디 반복 -->
<c:forEach items="${orderDTO.cartDTOs}" var="cartDTO">

<c:if test="${cartDTO.studyNum ne null}">

                <div class="row mt-4">
                    <div class="col">
                        <div class="card card-2">
                            <div class="card-body">
                                <div class="media">
                                    <div class="sq align-self-center "> <img onclick="javascript:location.href='/study/studyDetail?studyNum=${cartDTO.studyNum}'" class="img-fluid  my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0" src="/resources/images/${cartDTO.studyDTOs[0].studyBoardFileDTOs[0].fileName}" width="135" height="135" /> </div>
                                    <div class="media-body my-auto text-right">
                                        <div class="row  my-auto flex-column flex-md-row">
                                            <div class="col my-auto"> <h6 class="mb-0"> ${cartDTO.studyDTOs[0].studyName}</h6>  </div>
                                            <div class="col-auto my-auto"> <small>Golden Rim </small></div>
                                            <div class="col my-auto"> <small>Size : M</small></div>
                                            <div class="col my-auto"> <small>Qty : 1</small></div>
                                            <div class="col my-auto"><h6 class="mb-0">${cartDTO.studyDTOs[0].studyCost}원</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-3 ">
                                <div class="row">
<button type="button" class="btn btn-secondary btn-addCart to-cart-popper"
	data-addCart-price="${cartDTO.cartPrice}"
	data-addCart="${cartDTO.studyNum}" data-bs-container="body"
	data-bs-toggle="popover" data-bs-placement="top"
	data-bs-content="Top popover">장바구니 담기</button>
<button type="button" class="btn btn-secondary">리뷰
	작성하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

</c:if>



<!-- 기구 -->
<c:if
	test="${cartDTO.realMachineNum ne null}">


               <div class="row mt-4">
                    <div class="col">
                        <div class="card card-2">
                            <div class="card-body">
                                <div class="media">
                                    <div class="sq align-self-center "> <img 
                                    onclick="javascript:location.href='/study/studyDetail?studyNum=${cartDTO.realMachineNum}'" class="img-fluid  my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0" 
                                    src="/resources/images/${cartDTO.healthMachineDTO.healthMachineImgDTOs[0].fileName}" width="135" height="135" /> </div>
                                    <div class="media-body my-auto text-right">
                                        <div class="row  my-auto flex-column flex-md-row">
                                            <div class="col my-auto"> <h6 class="mb-0"> ${cartDTO.studyDTOs[0].studyName}</h6>  </div>
                                            <div class="col-auto my-auto"> <small>${cartDTO.realHealthMachineDTO.optName1} </small></div>
                                            <div class="col my-auto"> <small>Size : ${cartDTO.realHealthMachineDTO.optName2}</small></div>
                                            <div class="col my-auto"> <small>${cartDTO.count}개</small></div>
                                            <div class="col my-auto"><h6 class="mb-0">${cartDTO.healthMachineDTO.salePrice}원</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-3 ">
                                <div class="row">
<button type="button"
	class="btn btn-secondary btn-addCart-machine to-cart-popper"
	data-bs-container="body" data-bs-toggle="popover"
	data-bs-placement="top" data-bs-content="Top popover"
	data-addCart="${cartDTO.realMachineNum}"
	data-addCart-price="${cartDTO.cartPrice}"
	data-addCart-machineNum="${cartDTO.realHealthMachineDTO.machineNum}"
	data-addCart-op1="${cartDTO.realHealthMachineDTO.optId1}"
	data-addCartop-2="${cartDTO.realHealthMachineDTO.optId2}"
	data-addCartop-3="${cartDTO.realHealthMachineDTO.optId3}"
	data-addCartop-4="${cartDTO.realHealthMachineDTO.optId4}">장바구니
	담기</button>
<button type="button" class="btn btn-secondary">리뷰
	작성하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

</c:if>

</c:forEach>


                <!-- order정보 -->
                <div class="row mt-4">
                    <div class="col">
                        <div class="row justify-content-between">
                            <div class="col-auto"><p class="mb-1 text-dark"><b>Order Details</b></p></div>
                            <div class="flex-sm-col text-right col"> <p class="mb-1"><b>Total</b></p> </div>
                            <div class="flex-sm-col col-auto"> <p class="mb-1">${orderDTO.price}원</p> </div>
                        </div>
                        <div class="row justify-content-between">
                            <div class="flex-sm-col text-right col"><p class="mb-1"> <b>Discount</b></p> </div>
                            <div class="flex-sm-col col-auto"><p class="mb-1">xx원</p></div>
                        </div>
                        <div class="row justify-content-between">
                            <div class="flex-sm-col text-right col"><p class="mb-1"><b>GST xx%</b></p></div>
                            <div class="flex-sm-col col-auto"><p class="mb-1">xx</p></div>
                        </div>
                        <div class="row justify-content-between">
                            <div class="flex-sm-col text-right col"><p class="mb-1"><b>Delivery Charges</b></p></div>
                            <div class="flex-sm-col col-auto"><p class="mb-1">Free?</p></div>
                        </div>
                    </div>
                </div>
                <div class="row invoice ">
                    <div class="col"><p class="mb-1"> Number : ${orderDTO.orderNum}</p><p class="mb-1"> Date : ${orderDTO.orderDate}</p></div>
                </div>
            </div>

        </div><!-- 상품반복 끝 -->


					</c:forEach><!-- oder반복 -->
					

					
					
				</div><!-- row -->
			</div>

<div class="col-2"></div>
		</div>
	</div>


	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal"
		data-bs-target="#deleteModal">회원탈퇴</button>

	<!-- Modal -->

	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable mx-auto">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">회원탈퇴</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body margin-bottom-xxxl">
					<div>가입된 회원정보가 모두 삭제됩니다. 작성하신 게시물은 삭제되지 않습니다.</div>
					<div>탈퇴 후 같은 계정으로 재가입 시 기존에 가지고 있던 적립금은 복원되지 않으며, 사용 및 다운로드했던
						쿠폰도 사용 불가능합니다.</div>
					<div>회원 탈퇴를 진행하시겠습니까?</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="memberDeleteBtnModal" onclick="javascript:modalMemberDelete()">탈퇴하기</button>
					<button type="button" class="btn btn-secondary" id="modalClose"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>





	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/js/order/orderList.js"></script>


	<script src="/resources/js/member/memberDelete.js"></script>

	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/common_js.jsp"></c:import>

</body>
</html>