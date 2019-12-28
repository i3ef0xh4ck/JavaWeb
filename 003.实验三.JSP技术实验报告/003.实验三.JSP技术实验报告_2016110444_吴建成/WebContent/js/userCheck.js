$("input[type='password'],input[type='text'],input[type='email'],textarea").focus(function() {
	$(this).removeClass("wrong").addClass("onfocus");
}).blur(function() {
	$(this).removeClass("onfocus");
});

var usernameIsOk = false;
var emailIsOk = false;
var passwordIsOk = false;
var passwordIsOk2 = false;
var otherIsOk = false;

function doRegist() {
	checkUsername();
	checkEmail();
	checkPassword();
	checkPassword2();
	checkOther();
	if(usernameIsOk && emailIsOk && passwordIsOk && passwordIsOk2 && otherIsOk){
		$("#regist").submit();
	}else {
		alert("输入信息有误，请检查！");
	}
}
function cancelRegist(){
	if(window.confirm("你确定要取消注册吗？")){
		window.location.href = "index.jsp";
	}	
}

//用户名验证
function checkUsername() {
	var userName = $("#username");
	var prompt = $("#username_prompt");
	if(userName.val() == ""){
		userName.addClass("wrong");
		prompt.text("用户名不能为空");
		usernameIsOk = false;
		return;
	}
	if(userName.val().length < 5 || userName.val().length > 20) {
		userName.addClass("wrong");
		prompt.text("用户名长度应在5~20字符之间");
		usernameIsOk = false;
	} else {
		userName.removeClass("wrong");
		prompt.text("");
		usernameIsOk = true;
	}
}
//电子邮箱验证
function checkEmail() {
	var email = $("#email");
	var prompt = $("#email_prompt");
	var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if(email.val() == ""){
		email.addClass("wrong");
		prompt.text("电子邮箱不能为空");
		emailIsOk = false;
		return;
	}
	if(!reg.test(email.val())) {
		email.addClass("wrong");
		prompt.text("电子邮箱格式不正确");
		emailIsOk = false;
	} else {
		email.removeClass("wrong");
		prompt.text("");
		emailIsOk = true;
	}
}
//密码验证
function checkPassword(){
	var password1 = $("#password");
	var prompt = $("#password_prompt");
	if(password1.val() == "") {
		password1.addClass("wrong");
		prompt.text("密码不能为空");
		passwordIsOk = false;
	}else {
		password1.removeClass("wrong");
		prompt.text("");
		passwordIsOk = true;
	}
	checkPassword2();
}
function checkPassword2(){
	var password1 = $("#password");
	var password2 = $("#password2");
	var prompt = $("#password2_prompt");
	if(password1.val() != password2.val()){
		password2.addClass("wrong");
		prompt.text("两次密码不相同");
		passwordIsOk2 = false;
	}else {
		password2.removeClass("wrong");
		prompt.text("");
		passwordIsOk2 = true;
	}
}
//个人简介验证
function checkOther(){
	var other = $("#other");
	var prompt = $("#intro_prompt");
	if(other.val() == "") {
		other.addClass("wrong");
		prompt.text("个人简介不能为空");
		otherIsOk = false;
	}else {
		other.removeClass("wrong");
		prompt.text("");
		otherIsOk = true;
	}
}
