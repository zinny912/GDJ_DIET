
let machineNum=$("#optionSelect").attr("data-machineNum");
let idx=0;
let optId1="";
let optId2="";
let optId3="";
let optId4="";
let optId5="";

$.ajax({
    type:"POST",
    url:"./option1",
    data:{
        machineNum:machineNum
    },
    success:function(response){
        
        $("#optSelect1").append(response.trim())
    },
    error:function(){
        console.log("error");
    }
})

$("#optionSelect").on("change","#optSelect1",function(e){
    idx=2;
    console.log($(this).val())
    optId1=$(this).val()
    optName=$("#opt2").attr("data-optName")
    let select ='<select class="form-select mb-3" id="optSelect2">'
    select=select+'<option class="option"  id="default">'+optName
    select=select+'을 선택 해주세요</option></select>'
    
    for(i=2;i<=5;i++){
    $("#optSelect"+i).remove()
}
    
    
    $.ajax({

        type:"POST",
        url:"./option2",
        data:{
            machineNum:machineNum,
            optId1:optId1
        },
        success:function(response){
            console.log(response.trim().length)
            if(response.trim().length>20){
            $("#opt2").append(select);
            $("#optSelect2").append(response.trim())
            }
        },
        error:function(){
            console.log("error");
        }
    })
    
    
    
})
$("#optionSelect").on("change","#optSelect2",function(e){

    idx=3;
    optId2=$(this).val()
    optName=$("#opt3").attr("data-optName")
    let select ='<select class="form-select mb-3" id="optSelect3">'
    select=select+'<option class="option"  id="default">'+optName
    select=select+'을 선택해주세요</option></select>'
    for(i=3;i<=5;i++){
        $("#optSelect"+i).remove()
    }
    $.ajax({

        type:"POST",
        url:"./option3",
        data:{
            machineNum:machineNum,
            optId1:optId1,
            optId2:optId2
        },
        success:function(response){
            console.log(response.trim().length)
            if(response.trim().length>20){
            $("#opt"+idx).append(select);
            $("#optSelect3").append(response.trim())
        }
        },
        error:function(){
            console.log("error");
        }
    })
    
    
    
})

function getOption(optionNum){

}





