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

function back(){
	window.location.href="${request.contextPath}/goods/list";
}

</script>
</head>

<body>
	<h1 align="center">${message}</h1>
	
	<p align="center">current time is ${time}</p>
	
	<p align="center">
      <input name="ok" type="button" value="ok" onclick="back()"/>
    </p>
</body>
</html>
