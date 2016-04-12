
$(function(){
	init();
	window.setInterval(changeText, 10000);
});

function changeText(){
	$(".moveDiv").each(function(){
		ajaxGetData($(this).find(".idVal").val(), $(this).find(".randomTem"), $(this).find(".randomHum"));
	});
}

function ajaxGetData(id, temObj, humObj){
	$.ajax({
		type : "POST",
		url : "sensorValue/ajaxGetData",
		data : {
			"id" : id
		},
		success : function(data) {
			var senVal = data.returnValue;
			var senTemVal = senVal.sensor.temperature;
			var senTemData = senVal.temperature;
			var senHumVal = senVal.sensor.humidity;
			var senHumData = senVal.humidity;
			if(senTemData>senTemVal){
				temObj.html('温度：<font color="#FF0000">' + senTemData + '</font>°C');
			} else {
				temObj.html('温度：' + senTemData + '°C');
			}
			if(senHumData>senHumVal){
				humObj.html('湿度：<font color="#FF0000">' + senHumData + '</font>%');
			} else {
				humObj.html('湿度：' + senHumData + '%');
			}
		},
		async:false,
		dataType : "json"
	});
}

function randomNum(){
	var num = Math.ceil(Math.random()*50);
	return num;
}

function init(){
	changeText();
	$(".moveDiv").each(function(){
		var moveDiv = $(this);
		moveDiv.offset({ top: moveDiv.find(".leftVal").val(), left: moveDiv.find(".topVal").val() });
	});
}

function edit(){
	$(".moveDiv").each(function(){
		var moveDiv = $(this);
//		var moveDiv = moveDiv.offset({ top: moveDiv.find(".leftVal").val(), left: moveDiv.find(".topVal").val() });
		var moveBtn = moveDiv.find(".moveBtn");
		moveBtn.bind("mousedown", function(){
			$(document).mousemove(function(e){
				mouseMove(e,moveDiv);
			}).mouseup(function(){
				$(document).unbind("mousemove").unbind("mouseup");
			});
		});
	});
}

function mouseMove(e,obj){
	obj.offset({left: e.pageX,top: e.pageY});
	obj.find(".leftVal").val(e.pageY);
	obj.find(".topVal").val(e.pageX);
}

function save(){
	$("#save").submit();
}
function saveCallBack(){
	$("#view").submit();
}

function changeFloor(id){
	$("#floorId").val(id);
	$("#view").submit();
}

function buildingChange(){
	$("#floorId").val('');
	$("#view").submit();
}