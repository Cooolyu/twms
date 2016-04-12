$(function(){
	
});

function save(){
	var validate = $("#saveForm").validate().form();
	if(!validate){
		return false;
	}
	$("#saveForm").submit();
}

function del(id){
	$.ajax({
		type : "POST",
		url : "floor/delete",
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

function saveCallBack(msg){
	alert(msg);
	$("#listForm").submit();
}

function edit(id,name,buildingId){
	$("#floorId").val(id);
	$("#floorName").val(name);
	$("#buildingId").val(buildingId);
	$("#floorSave").text("更新");
}

/**
 * 翻页
 * @param num
 */
function paging(num){
	$("#start").val(num);
	$("#listForm").submit();
}

/**
 * 楼栋修改
 */
function buildingChange(){
	$("#building_id").val($("#buildingId").val());
	$("#listForm").submit();
}