<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>

<title>MainList</title>
<script type="text/javascript">
$(document).ready(function(){
	$(":button").css("background-color","#aaaaaf");
	
	$(":button").mouseover(function(event){
		//alert(event.target);
		$(event.target).fadeTo(170, 0.5);
		$(event.target).css("background-color","#0f0000");
		$(event.target).css("color","#f0ffff");
	});
	
	$(":button").mouseleave(function(event){
		//alert(event.target);
		$(event.target).fadeTo(170, 1.0);
		$(event.target).css("background-color","#aaaaaf");
		$(event.target).css("color","#000000");
	});
});
function addone(){
	var name = encodeURIComponent(document.getElementById("name").value);
	var code = encodeURIComponent(document.getElementById("code").value);
	
	window.location.href="${request.contextPath}/goods/addone?name="+name+"&code="+code;
	
	// alert($("#name").val() + " " + $("#code").val());
	// alert("${request.contextPath}/goods/addone");
	
	/*
	$.ajax({
		type: "POST",
		url: "/goods/addone",
		data: {name:$("#name").val(), code:$("#code").val()},
		datatype: "text",
		async: false,
		success: function(data){
			//window.location.href="${request.contextPath}/goods/addone";
			
			alert("operating success!!!");
			window.location.href="${request.contextPath}/goods/list";
		},
		error: function(data) {
			alert("operating failed!!!");
		}
	});*/
	
	
}
</script>
</head>

<body>
	<h1 align="center">ADD_ONE</h1>
    
	<p align="center">current time is ${time}</p>
	<p align="center">code:</p>
    <p align="center">
	  <label for="code"></label>
	  <input type="text" name="code" id="code" />
	</p>
	
	<p align="center">name:</p>
	<p align="center">
	  <label for="name"></label>
	  <input type="text" name="name" id="name" />
    </p>
	
    <p align="center">
      <input name="addone" type="button" value="addone" onclick="addone(code,name)"/>
    </p align="center">
    <p align="center">
      <input name="back" type="button" value="back" onclick="javascript:history.back(-1);"/>
    </p>

</body>
</html>