<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>

<title>MainList</title>
<script type="text/javascript">
$(document).ready(function(){
	$(":button").css("background-color","#aaaaaf");
	$("tr").css("background-color","#ffffff");
	
	$(":button").mouseover(function(event){
		$(event.target).fadeTo(170, 0.5);
		$(event.target).css("background-color","#0f0000");
		$(event.target).css("color","#f0ffff");
		$(event.target).parent().parent("tr").fadeTo(170, 0.8);
		$(event.target).parent().parent("tr").css("background-color","#aaaaaa");
		$(event.target).parent().parent("tr").css("color","#ff0f0f");
	});
	
	$(":button").mouseleave(function(event){
		$(event.target).fadeTo(170, 1.0);
		$(event.target).css("background-color","#aaaaaf");
		$(event.target).css("color","#000000");
		$(event.target).parent().parent("tr").fadeTo(170, 1.0);
		$(event.target).parent().parent("tr").css("background-color","#ffffff");
		$(event.target).parent().parent("tr").css("color","#000000");
	});
	
	$(":button").mouseover(function(event){
		$(event.target).fadeTo(170, 0.5);
		$(event.target).css("background-color","#0f0000");
		$(event.target).css("color","#f0ffff");
	});
	
	$(":button").mouseleave(function(event){
		$(event.target).fadeTo(170, 1.0);
		$(event.target).css("background-color","#aaaaaf");
		$(event.target).css("color","#000000");
	});
});

function addnew(){
	window.location.href="${request.contextPath}/goods/add";
}
function searc(){
	if($(":text#code").val()==""){
		window.location.href="${request.contextPath}/goods/list";
	}else{
		window.location.href="${request.contextPath}/goods/searc?pattern=" + encodeURIComponent($(":text#code").val());
	}
	
}
function logout(){
	window.location.href="${request.contextPath}/logout";
}


function good_in(id){
	window.location.href="${request.contextPath}/goods/goodsio?id=" + id + "&type=" + true;
}
function good_out(id){
	window.location.href="${request.contextPath}/goods/goodsio?id=" + id + "&type=" + false;
}
function good_edit(id){
	window.location.href="${request.contextPath}/goods/edit?id="+id;
	
}
function good_delete(id){
	window.location.href="${request.contextPath}/goods/deleteone?id="+id;
}

function test_btn(){
	window.location.href="${request.contextPath}/goods/list";
}

</script>



</head>

<body>
	<h1 align="center">GOODS_MANAGER</h1>
    
	<p align="center">current time is ${time}</p>
    
    <p align="center">
    	search by code:
      <input id="code" name="code" type="text">
      <input name="selectbycode" type="button" value="search" onclick="searc()"/>
      <input name="addnew" type="button" value="addnew" onclick="addnew()"/>
    </p>
<table border="1px solid #8968CD" align="center" style="border-collapse: collapse;">
	<tr><th>id</th> 
	<th>name</th> 
	<th>code</th> 
	<th>remainNum</th>
	<th>--IN--</th> 
	<th>--OUT--</th> 
	<th>--EDIT--</th> 
	<th>--DELETE--</th></tr>  
    <#list  goods as good>  
        <tr id="${good.id}">  
            <td align="center">${good.id}</td>
            <td align="center">${good.name}</td>  
            <td align="center">${good.code}</td>  
            <td align="right">${good.remainNum}</td>
            <td><input name="good_in"  type="button" value="good_in" onclick="good_in(${good.id})"/></td>
            <td><input name="good_out" type="button" value="good_out" onclick="good_out(${good.id})"/></td>
            <td><input name="good_edit" type="button" value="good_edit" onclick="good_edit(${good.id})"/></td>
            <td><input name="good_delete" type="button" value="good_delete" onclick="good_delete(${good.id});"/></td>
        </tr>  
    </#list>
    </table> 

    <p align="center">
    	<input name="logout" type="button" value="logout" onclick="logout()"/>
      <td><input id="test_btn" name="test_btn" type="button" value="refresh" onclick="test_btn();"/></td>
    </p>

</body>
</html>
