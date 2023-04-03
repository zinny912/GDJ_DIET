
let machineNum=$("#machineNum").val();
$.ajax({
    type:"POST",
    url:"./RealMachineList",
    data:{
        machineNum:machineNum
      
    },
    success:function(response){
        
        if(response.trim().length>0){
            console.log(response.trim())
            $("#realMachineList").append(response.trim());
        }
    },
    error:function(){
        console.log("error")
    }
})