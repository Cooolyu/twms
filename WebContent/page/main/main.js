$(function(){
})

function goMenu(url, obj){
	$("#mainFrame").attr("src", url);
	$("#main-nav>li").removeClass("active");
	$(obj).parent().addClass("active");
}