$.ajax({
    url: "/add",
    method: "POST",
    dataType: "json",
    data: JSON.stringify(events),
    contentType: 'application/json',

})