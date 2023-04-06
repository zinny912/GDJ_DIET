const checkAll = document.getElementById("checkAll")
const checks = document.getElementsByClassName("checks")

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