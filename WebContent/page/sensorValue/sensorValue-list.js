
function exportExcel(){
	
}

function changeHandle(id){
	$.ajax({
		type : "POST",
		url : "sensorValue/changeHandle",
		data : {
			"id" : id,
		},
		success : function(data) {
			if(data.success){
				alert("处理成功！");
			} else {
				alert("处理失败！");
			}
			$("#listForm").submit();
		},
		dataType : "json",
		async : false
	});
}

/**
 * 翻页
 * @param num
 */
function paging(num){
	$("#start").val(num);
	$("#listForm").submit();
}