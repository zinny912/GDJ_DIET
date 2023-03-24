
let machineNum = $("#optionSelect").attr("data-machineNum");
let idx = 0;
let optId1 = "";
let optId2 = "";
let optId3 = "";
let optId4 = "";
let optId5 = "";
let url = "";
let select = "";
let toggleStatus = "off";
let toggleFlag=false;
let optName

$.ajax({
    type: "POST",
    url: "./option1",
    data: {
        machineNum: machineNum
    },
    success: function (response) {

        $("#optSelect1").append(response.trim())
    },
    error: function () {
        console.log("error");
    }
})

$("#optionSelect").on("click", "#op1", function (e) {
    idx = 2;

    optId1 = $(this).attr("data-id");
    console.log(optId1)

    getOption(2);

    $.ajax({

        type: "POST",
        url: "./option2",
        data: {
            machineNum: machineNum,
            optId1: optId1
        },
        success: function (response) {
            console.log(response.trim().length)
            if (response.trim().length > 5) {
                $("#opt2").append(select);
                $("#optSelect2").append(response.trim())
            }
        },
        error: function () {
            console.log("error");
        }
    })



})
$("#optionSelect").on("click", "#op2", function (e) {

    optId2 = $(this).attr("data-id")
    // idx=3;
    // optName=$("#opt3").attr("data-optName")
    // select ='<select class="form-select mb-3" id="optSelect3">'
    // select=select+'<option class="option"  id="default">'+optName
    // select=select+'을 선택해주세요</option></select>'
    getOption(3);
    idx = 3;
    // for(i=3;i<=5;i++){
    //     $("#optSelect"+i).remove()
    // }
    $.ajax({

        type: "POST",
        url: "./option3",
        data: {
            machineNum: machineNum,
            optId1: optId1,
            optId2: optId2
        },
        success: function (response) {

            if (response.trim().length > 20) {
                $("#opt" + idx).append(select);
                $("#optSelect3").append(response.trim())
            }
        },
        error: function () {
            console.log("error");
        }
    })



})

$("#optionSelect").on("click", "#op3", function (e) {
    optId3 = $(this).attr("data-id");
    getOption(4);
    
    $.ajax({

        type: "POST",
        url: url,
        data: {
            machineNum: machineNum,
            optId1: optId1,
            optId2: optId2,
            optId3: optId3
        },
        success: function (response) {

            if (response.trim().length > 20) {
                $("#opt" + idx).append(select);
                $("#optSelect4").append(response.trim())
            }
        },
        error: function () {
            console.log("error");
        }
    })

})

// function getOption(optSelectNum) {
//     optName = $("#opt" + optSelectNum).attr("data-optName")
//     url = "./option" + optSelectNum
//     select = '<select class="form-select mb-3" id="optSelect' + optSelectNum + '">'
//     select = select + '<option class="option"  id="default">' + optName
//     select = select + '을 선택해주세요</option></select>'
//     for (i = optSelectNum; i <= 5; i++) {
//         $("#optSelect" + i).remove()
//     }


// }

// $('#optbtn1').on("focus",function(e){
//     let $this = $(this).parents(".dropdown");
//     $this.addClass('show');
//     $this.find('> a').attr('aria-expanded', true);
//     // $this.find('.dropdown-menu').addClass('animated-fast fadeInUp show');
//     $this.find('.dropdown-menu').addClass('show');
// })

function getOption(optSelectNum) {
    optName = $("#opt" + optSelectNum).attr("data-optName")
    url = "./option" + optSelectNum
    idx=optSelectNum
    select = '<button class="btn dropdown-toggle" id=optbtn' + optSelectNum + '>'
    select = select + optName + '을 선택해주세요</button><div class="dropdown-menu"><ul style="list-style: none;" id=optSelect' + optSelectNum + '>'
    select = select + '</ul></div>'
    for (i = optSelectNum; i <= 5; i++) {
        $("#optSelect" + i).remove()
        $("#optbtn" + i).remove()
    }
}
$(".container-fluid").click(function () {
    
    if (toggleFlag==true&&toggleStatus != "") {
        
        toggleFlag=false
        return;
    }
    else if(toggleFlag==false){
    $(this).find('.dropdown').removeClass('show')
        $(this).find('.dropdown-menu').removeClass('show');
        toggleStatus=""
    }
})
$(".dropdown").on("click", ".dropdown-toggle", function () {
    let $this = $(this).parents(".dropdown");
    let parent = $(this).parents("#optionSelect")

    parent.find('.dropdown').removeClass('show')
    parent.find('.dropdown-menu').removeClass('show');
    toggleFlag=false

    if (toggleStatus != $(this).attr("id")) {
        $this.addClass('show');
        $this.find('> a').attr('aria-expanded', true);
        $this.find('.dropdown-menu').addClass('show');
        toggleStatus = $(this).attr("id");
        toggleFlag=true;
        return;
    }
    toggleStatus = "";


})

$(".dropdown").on("click", ".dropdown-item", function () {
    let $this = $(this).parents(".dropdown");

    $this.find(".btn").html($(this).attr("data-name")+"을 선택하였습니다.")
    $this.removeClass('show');
    // $this.find('> a').attr('aria-expanded', false);
    $this.find('.dropdown-menu').removeClass('show');
    toggleFlag=false
    toggleStatus = "";
})




