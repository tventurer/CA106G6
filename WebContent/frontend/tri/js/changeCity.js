
//輸入城市時Ajax查詢資料庫城市資料輸出
$("#changeCity").on("keyup", function(){
	var xhr = new XMLHttpRequest();
	xhr.onload = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				debugger
				var citys = JSON.parse(xhr.responseText);
				
			} else{
				alert(xhr.status);
			}
		}
	}
	
	var city = $("#changeCity").val();
	var content = encodeURIComponent(city);
	$("#changeCity").autocomplete();
	debugger
	xhr.open("POST", "../tde/ChangeCityAjax", true);
	xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
	xhr.send("content=" + content);
});
