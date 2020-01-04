$(function(){
	$("#send_mes").click(function(){
		let input_mes = $("#input_mes").val().split(" ");
		let user2 = input_mes[0].substring(1);
		let mes = input_mes[1];
		$.ajax({
				type: "post",
				url: "/Exam_3/SendMes",
				data: {"user2": user2, "mes": mes},
				success: function(data) {
					var str = $("#mes").val(); //先获取原有的值
					$("#mes").val(str + data); //拼接新值
					$("#input_mes").val("");
				}
		});	
	});
	
	var lastMes = "";
	showMes();
	
	function showMes() { //每5秒获取一次信息
		$.ajax({
			type: "post",
			url: "/Exam_3/ReciveMes",
			success: function(data) {
				if(lastMes != data){
					var str = $("#mes").val(); //先获取原有的值
					$("#mes").val(str + data); //拼接新值
					lastMes = data;
				}		
			}
		});	
		setTimeout(function() {
			showMes()
		}, 5000);
	}
});
