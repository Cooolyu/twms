$(function(){
	if($("#flag").val()==1){
		alert("用户名或密码不正确！");
	}
	$("form").validate();
});