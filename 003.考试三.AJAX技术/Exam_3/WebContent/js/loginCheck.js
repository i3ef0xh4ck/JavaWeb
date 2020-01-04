$(function(){
	var sure = document.getElementById('sure');
	var form = document.getElementById('login');
	
	var username_prompt = $("#username_prompt");
	var password_prompt = $("#password_prompt");

	function checkUsername() {
		var username_val = $("#username").val();
		if(username_val.trim() == "") {
			username_prompt.text("用户名不能为空");
			return false;
		} else {
			username_prompt.text("");
			return true;
		}
	}

	function checkPassword() {
		var password_val = $("#password").val();
		if(password_val.trim() == "") {
			password_prompt.text("密码不能为空");
			return false;
		} else {
			password_prompt.text("");
			return true;
		}
	}

	sure.addEventListener('click', function() {
		var f1 = checkUsername();
		var f2 = checkPassword();
		if(f1 && f2){
			$.ajax({
				type: "post",
				url: "/Exam_3/LoginServlet",
				data: $("#login").serialize(),
				success: function(data) {
					if(data === "no-such-user"){
						username_prompt.text("用户不存在");
						$("#password").val("");
						$("#username").focus();
					}else if(data === "wrong-password"){
						password_prompt.text("密码错误");
						$("#password").val("");
						$("#password").focus();
					}else if(data === "login-success") {
						window.location = "chat.jsp";
					}else {
						alert("粗错啦！");
					}
				},error: function (error) {
					alert(error);
				}
			});	
		}
	});
});