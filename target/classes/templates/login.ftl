<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
	<link rel="stylesheet" href="css/style.css">
<title>Login</title>
<script type="text/javascript">
$(document).ready(function(){
  var wHeight = $(window).height();   //647  100 200 300 400 400
	var wWidth = $(window).width();			//1366
	//64		//229		//238		//101		//44
	$("#lable").css({"right":wWidth/2-64/2+"px", "top":wHeight*0.25+"px"});
	$("#account").css({"right":wWidth/2-229/2+"px","top":wHeight*0.37+"px"});
	$("#password").css({"right":wWidth/2-238/2+"px","top":wHeight*0.47+"px"});
	$("#rememberMe").css({"right":wWidth/2-101/2+70+"px","top":wHeight*0.57+"px"});
	$("#submit").css({"right":wWidth/2-44/2-90+"px","top":wHeight*0.57+"px"});

	$(":submit,:checkbox,:password,:text").css("background-color","#0f0000");
	$(":submit,:checkbox,:password,:text").css("color","#f0ffff");
	$(":submit,:checkbox,:password,:text").fadeTo(170, 0.5);
	
	$(":submit,:checkbox,:password,:text").mouseleave(function(event){
		$(event.target).fadeTo(170, 0.5);
		$(event.target).css("background-color","#0f0000");
	});
	
	$(":submit,:checkbox,:password,:text").mouseover(function(event){
		$(event.target).fadeTo(170, 1.0);
		$(event.target).css("background-color","#aaaaaf");
		$(event.target).css("color","#000000");
	});
	
	$(":submit,:checkbox,:password,:text").mouseleave(function(event){
		$(event.target).fadeTo(170, 0.5);
		$(event.target).css("background-color","#0f0000");
		$(event.target).css("color","#f0ffff");
	});
	
	$(":submit,:checkbox,:password,:text").mouseover(function(event){
		$(event.target).fadeTo(170, 1.0);
		$(event.target).css("background-color","#aaaaaf");
		$(event.target).css("color","#000000");
	});
	
	$(window).resize(function() {
  	var wHeight = $(window).height();   //647  100 200 300 400 400
		var wWidth = $(window).width();			//1366
		//64		//229		//238		//101		//44
		$("#lable").css({"right":wWidth/2-64/2+"px", "top":wHeight*0.25+"px"});
		$("#account").css({"right":wWidth/2-229/2+"px","top":wHeight*0.37+"px"});
		$("#password").css({"right":wWidth/2-238/2+"px","top":wHeight*0.47+"px"});
		$("#rememberMe").css({"right":wWidth/2-101/2+70+"px","top":wHeight*0.57+"px"});
		$("#submit").css({"right":wWidth/2-44/2-90+"px","top":wHeight*0.57+"px"});
	});
});
</script>

</head>

<body style="pandin:0px">
	<div id="particles-js" style="width:100%;height:100%;position:absolute;z-index:0;">
		<form name="frmLogin" style="background-color:red;width:auto;height:auto;" action="login" method="post">
		  	<p id="lable" style="margin:0px;z-index:2;position:absolute;width:auto;height:auto;right:700px;top:100px;color:antiquewhite;">
		  	Login Page
		  	</p>
		  	
		  	<p id="account" style="margin:0px;z-index:2;position:absolute;width:auto;height:auto;right:600px;top:200px;color:antiquewhite;">
		  	account : <input type="text" name="username" value="admin"/>
		  	</p>
		  	
		  	<p id="password" style="margin:0px;z-index:2;position:absolute;width:auto;height:auto;right:600px;top:300px;color:antiquewhite;">
		  	password : <input type="password" name="password" value="123456"/>
		  	</p>
		  	
		  	<p id="rememberMe" style="margin:0px;z-index:2;position:absolute;width:auto;height:auto;right:800px;top:400px;color:antiquewhite;">
		  	<input type="checkbox" name="rememberMe" />remember me
		  	</p>
		  	
		  	<p id="submit" style="margin:0px;z-index:2;position:absolute;width:auto;height:auto;right:600px;top:400px;color:antiquewhite;">
		  	<input type="submit" value="login"/>
		  	</p>
        </form>
	</div>
</body>

	<script src='js/particles.min.js'></script>
	<script src="js/particlesCfg.js"></script>
</html>

