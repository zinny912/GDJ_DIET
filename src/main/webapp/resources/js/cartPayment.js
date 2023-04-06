const checkAll = document.getElementById("checkAll")
const checks = document.getElementsByClassName("checks")
let deliveryPrice=$("#deliveryPrice").attr("data-deliveryPrice")*1;


checkAll.addEventListener("click",function(){
    for(let i=0;i<checks.length;i++){
        checks[i].checked=checkAll.checked;
    }
});

for(let i=0;i<checks.length;i++){
    checks[i].addEventListener("click", function(){
        //for문을 중간에 종료하기 위해 boolean 타입 사용
        let result = true;
        for(let j=0;j<checks.length;j++){
            if(!checks[j].checked){
                //result = checks[j].checked
                //result = false;
                result = !result;
                break;
            }
        }
        checkAll.checked=result;
    })
};
$("#submitbtn").click(function(){
    
    $("#frm").submit();
})


	// function checkOrder() {
	// 	  let checkboxes = document.querySelectorAll('input[type=checkbox]:checked');
	// 	  if (checkboxes.length === 0) {
	// 	    alert("주문할 스터디를 선택해주세요.");
	// 	    return false;
	// 	  } else {
	// 	    let checkedItems = [];
	// 	    let uncheckedItems = [];

	// 	    $('input[name="checkedItems"]:checked').each(function() {
	// 	      checkedItems.push($(this).val());
	// 	    });
	// 	    $('input[name="checkedItems"]:not(:checked)').each(function() {
	// 	      uncheckedItems.push($(this).val());
	// 	    });

	// 	    if (uncheckedItems.length > 0) {
	// 	      $.ajax({
	// 	        type: 'POST',
	// 	        url: './uncartCheckedUpdate',
	// 	        traditional:true,
	// 	        data: { uncheckedItems: uncheckedItems },
	// 	      });
	// 	    } 
	// 	    if (checkedItems.length > 0) {
	// 	      $.ajax({
	// 	        type: 'POST',
	// 	        url: './cartCheckedUpdate',
	// 	        traditional:true,
	// 	        data: { checkedItems: checkedItems },
	// 	      });
	// 	    }
	// 	   	location.href='/cart/payment'
	// 	    return true;
	// 	  }
	// 	} 
	
function checkDelete(){
	  let check = window.confirm("정말 삭제 하시겠습니까?");
	  if(check){
	    let checkedItems = [];
	    $('input[name="checkedItems"]:checked').each(function() {
	      checkedItems.push($(this).val());
	    });
	    
	    $.ajax({
	      type: 'POST',
	      url: './cartDelete',
	      traditional:true,
	      data: { checkedItems: checkedItems },
	      success: function() {
	        location.reload();
	        // 처리 결과에 따라 적절한 동작 수행
	      },
	      error: function(xhr, status, error) {
	        console.log(xhr.responseText);
	        console.log(checkedItems);
	        // 에러 처리
	      }
	    });
	  }
	}

// 태현-------------------------------
let TotalPrice=0;
let Checked =true;
$("#totalCost").html(TotalPrice+deliveryPrice);

$("#cartMachineList").on("click",".checks",function(){
	let cartPrice = $(this).parent().parent().find("#cartPrice").html()*1;
	Checked = $(this).prop("checked");
	if(Checked==true){//누른 후 체크라면(원래는 노체크)
		TotalPrice=TotalPrice+cartPrice;
	}
	else{
		TotalPrice=TotalPrice-cartPrice;
	}
	$("#totalPrice").html(TotalPrice);
	$("#totalCost").html(TotalPrice+deliveryPrice);
})
$(".countBtn").on("click",".plusbtn",function(){
	let body =$(this).parent().parent().parent()

	//1. count구하기
	let count=body.find("#count").html()*1;
	count=count+1
	body.find("#count").html(count)

	//2. price올리기
	let cartPrice=body.find("#cartPrice").html()*1;
	cartPrice=cartPrice/(count-1)*count;
	body.find("#cartPrice").html(cartPrice);
	//3. 총합계 update
	Checked = $(this).parent().parent().parent().find(".checks").prop("checked");
	if(Checked==true){
		TotalPrice=TotalPrice+ cartPrice/count;
		$("#totalPrice").html(TotalPrice);
		$("#totalCost").html(TotalPrice+deliveryPrice);
	}
	
})
$(".countBtn").on("click", ".minusbtn", function () {
	let body = $(this).parent().parent().parent()
	//1. count구하기
	let count = body.find("#count").html() * 1;
	if (count * 1 <= 1) {
		alert("상품은 최소 1개 이상 있어야 합니다.")
		return;
	}
	
		count=count-1
		body.find("#count").html(count)
		//2. price내리기
		let cartPrice=body.find("#cartPrice").html()*1;
		cartPrice=cartPrice/(count+1)*count
		body.find("#cartPrice").html(cartPrice);
		Checked = $(this).parent().parent().parent().find(".checks").prop("checked");
		if(Checked==true){
			TotalPrice=TotalPrice- cartPrice/count;
			$("#totalPrice").html(TotalPrice);
			$("#totalCost").html(TotalPrice+deliveryPrice);
		}
	
})

// -------------------------------
