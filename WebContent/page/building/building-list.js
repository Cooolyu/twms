$(function(){
	
});

function save(){
	var validate = $("#saveForm").validate().form();
	if(!validate){
		return false;
	}
	$.ajax({
		type : "POST",
		url : "building/save",
		data : {
			"id" : $("#buildingId").val(),
			"name" : $("#buildingName").val()
		},
		success : function(data) {
			if(data.success){
				alert("保存成功！");
			} else {
				alert("保存失败！");
			}
			$("#listForm").submit();
		},
		dataType : "json",
		async : false
	});
}

function del(id){
	$.ajax({
		type : "POST",
		url : "building/delete",
		data : {
			"id" : id,
		},
		success : function(data) {
			if(data.success){
				alert("删除成功！");
			} else {
				alert("删除失败！");
			}
			$("#listForm").submit();
		},
		dataType : "json",
		async : false
	});
}

function edit(id,name){
	$("#buildingId").val(id);
	$("#buildingName").val(name);
	$("#buildingSave").text("更新");
}

/**
 * 翻页
 * @param num
 */
function paging(num){
	$("#start").val(num);
	$("#listForm").submit();
}