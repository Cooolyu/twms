$(function () {
	changeChart()
});		

function changeChart(){
	var charData;
	$.ajax({
		type : "POST",
		url : "sensorValue/getData",
		data : {
			"startDate":$("#startDate").val(),
			"endDate":$("#endDate").val()
		},
		success : function(data) {
			charData = data.returnValue;
		},
		dataType : "json",
		async : false
	});
	
	
	$(function () {
	    $('#container').highcharts({
	        chart: {
	            type: 'column'
	        },
	        credits: {
	            enabled: false
	        },
	        legend: {
	            enabled: false
	        },
	        title: {
	            text: '报警数TOP10'
	        },
	        xAxis: {
	            categories: charData.xData
	        },
	        yAxis: {
	            title:null
	        },
	        series: [{
	                name:'次数',
	            data: charData.yData
	        }]
	    });
	});
}