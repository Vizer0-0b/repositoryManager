<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>

</head>

<body>

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

	$(":button#${type}").click(function(){
		var amount=Number($(":text#amount").val());
		if(Math.round(amount) == amount){
			window.location.href="${request.contextPath}/goods/${type}?id="+${good.id}+"&amount=" + amount;
		}else{
			alert("please input an integer!!!");
			$(":text#amount").val("");
		}
		
	});
});

</script>


	<h1 align="center">GOODS_IO</h1>
    
	<p align="center">current time is ${time}</p>
		
	<p align="center">
	  id:${good.id}
	</p>
	
	<p align="center">
	  code:${good.code}
	</p>
	
	<p align="center">
	  name:${good.name}
	</p>
	
	<p align="center">
	  remianNum:${good.remainNum}
	</p>
	
	<p align="center">
	  <label for="amount"></label>
	  <input id="amount" type="text" name="amount" />
	</p>
    
    <p align="center">
      <input id="${type}" name="${type}" type="button" value="${type}"/>
    </p>
    
    <p align="center">
      <input name="back" type="button" value="back" onclick="javascript:history.back(-1);"/>
    </p>

</body>
</html>