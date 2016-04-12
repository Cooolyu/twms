
function save(){
	var validate = $("#saveForm").validate().form();
	if(!validate){
		return false;
	}
	$.ajax({
		type : "POST",
		url : "sensor/save",
		data : {
			"id" : $("#sensorId").val(),
			"name" : $("#sensorName").val(),
			"temperature" : $("#sensorTemperature").val(),
			"humidity" : $("#sensorHumidity").val(),
			"floorId" : $("#floorId").val()
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
		url : "sensor/delete",
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

function edit(id,name,temperature,humidity){
	$("#sensorId").val(id);
	$("#sensorName").val(name);
	$("#sensorTemperature").val(temperature);
	$("#sensorHumidity").val(humidity);
	$("#sensorSave").text("更新");
}

/**
 * 楼栋修改
 */
function buildingChange(){
	$("#building_id").val($("#buildingId").val());
	$("#floor_id").val("");
	$("#listForm").submit();
}

/**
 * 楼栋修改
 */
function floorChange(){
	$("#floor_id").val($("#floorId").val());
	$("#listForm").submit();
}

/**
 * 翻页
 * @param num
 */
function paging(num){
	$("#start").val(num);
	$("#listForm").submit();
}