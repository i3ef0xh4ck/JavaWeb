var modal = document.getElementById('modal');

/*进入购物车*/
$("#go_to_cart").bind("click",function(){
	var modal = document.getElementById('modal');
	$.ajax({
		type: "post",
		url: "/test4/ShoppingCart",
		success: function(data) {
			if(data === "noLogin"){
				if(confirm("您还未登录，请先登录~")){
					modal.style.display = "block";
				}
			}else{
				window.location = "ShoppingCart?func=show";
			}
		}
	});
});

/*添加商品*/
$("#add_to_cart").bind("click",function(){
	var pid = $("#pid").val();
	var num = $("#buy-num").val();
	$.ajax({
		type: "post",
		url: "/test4/ShoppingCart",
		data: { "func":"add", "pid":pid, "num":num },
		success: function(data) {
			if(data === "noLogin"){
				if(confirm("您还未登录，请先登录~")){
					modal.style.display = "block";
				}
			}else {
				alert(data);
			}
		}
	});
});

//删除商品
$("i[id^='remove_from_cart_']").bind("click",function(){
	var tr = $(this).parent().parent();
	var id = $(this).attr('id');
	var pid = id.substr(17);
	if(confirm("确定要删除吗？")){
		$.ajax({
			type: "post",
			url: "/test4/ShoppingCart",
			data: { "func":"remove", "pid":pid },
			success: function(data) {
				tr.remove();
				calculate();
			}
		});
	}
});

//变更商品数量
$("span[id^='dis_update_cart_']").bind("click",function(){
	var num = parseInt($(this).next().val()) - 1;
	if(num<1){
		alert("不能再少啦~");
	}else{
		//更改数量
		$(this).next().val(num);
		//计算价格
		var price = parseFloat(num) * parseFloat($(this).parent().prev().children().text());
		$(this).parent().next().children().text(price);
		//更改总价
		calculate();
		//更改数据库
		var pid = $(this).parent().next().next().children().attr('id').substr(17);
		$.ajax({
			type: "post",
			url: "/test4/ShoppingCart",
			data: { "func":"update", "pid":pid,"num":num }
		});
	}	
});
$("span[id^='add_update_cart_']").bind("click",function(){
	var resNum = $(this).next().val();
	var num = parseInt($(this).prev().val()) + 1;
	if(num>resNum){
		alert("没有那么多库存哦~");
	}else{
		$(this).prev().val(num);
		
		var price = parseFloat(num) * parseFloat($(this).parent().prev().children().text());
		$(this).parent().next().children().text(price);
		
		calculate();
		
		var pid = $(this).parent().next().next().children().attr('id').substr(17);
		$.ajax({
			type: "post",
			url: "/test4/ShoppingCart",
			data: { "func":"update", "pid":pid,"num":num }
		});
	}
});


//复选框
$("#chooseAll").click(function(){
	if(this.checked){
		$("input[name='product']").prop("checked",true);
	}else{
		$("input[name='product']").prop("checked",false);			
	}
	calculate();
});
	
$("input[name='product']").click(function(){
	if(this.checked){
		$(this).prop("checked",true);
	}else{
		$(this).prop("checked",false);
	}
	calculate();
});

function calculate(){
	var chooseNum = 0;
	var totalPrice = 0.0;
	 $("input[name='product']:checked").each(function(){ 
	 	var price =  $(this).parent().nextAll().last().prev().children().text();
	 	chooseNum ++;
	 	totalPrice = totalPrice + parseFloat(price);
	 });
	 $("#chooseNum").html(chooseNum);
	 $("#totalPrice").html(totalPrice);
}



