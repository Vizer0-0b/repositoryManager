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
	
	$(":button#modify").click(function(){
		var good = {id:encodeURIComponent($(":text#id").val()),
					code:encodeURIComponent($(":text#code").val()),
					name:encodeURIComponent($(":text#name").val())};
		
		window.location.href="${request.contextPath}/goods/editgood?" + $.param(good);
	});
	
});
</script>


	<h1 align="center">EDIT_GOOD</h1>
    
	<p align="center">current time is ${time}</p>
	
	<p align="center">id:</p>
	<p align="center">
	  <label for="id"></label>
	  <input id="id" type="text" name="id"  value="${good.id}" readonly="true"/>
	</p>
	
	
	<p align="center">code:</p>
	<p align="center">
	  <label for="code"></label>
	  <input id="code" type="text" name="code"  value="${good.code}" readonly="true"/>
	</p>
	
	
	<p align="center">name:</p>
	<p align="center">
	  <label for="name"></label>
	  <input id="name" type="text" name="name" value="${good.name}"/>
    </p>
    
    <p align="center">
      <input id="modify" name="modify" type="button" value="modify"/>
    </p>
    <p align="center">
      <input name="back" type="button" value="back" onclick="javascript:history.back(-1);"/>
    </p>

</body>
</html>