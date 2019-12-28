<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiancheng.wu.User"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>主页</title>
		<link rel="stylesheet" href="layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />	
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<script>
			$(function() {
				$(".first-menu>a,.second-menu li").click(function() {
					confirm($(this).text());
				});
				$(".spec-list ul li:first-child").css("border", "2px solid #017DB9");
				$(".spec-list ul li").mouseover(function() {
					$(this).css("border", "2px solid #017DB9");
					$(this).siblings().css("border", "2px solid #fff");
					var src = $(this).children().get(0).src;
					$(".spec-img img").attr("src", src);
				});

				$(".number_btn a:last-child").addClass("disabled");
				var maxNum = Number($(".number .rest-num").text());
				$(".number_btn a:first-child").click(function() {
					var num = $("#buy-num").val();
					$(".number_btn a:last-child").removeClass("disabled");
					$("#buy-num").val(++num);
					if(num >= maxNum) {
						$("#buy-num").val(maxNum);
						$(this).addClass("disabled");
					}
				});
				$(".number_btn a:last-child").click(function() {
					var num = $("#buy-num").val();
					$(".number_btn a:first-child").removeClass("disabled");
					$("#buy-num").val(--num);
					if(num <= 1) {
						$("#buy-num").val(1);
						$(this).addClass("disabled");
					}
				});
				$("#buy-num").on("change", function() {
					var num = $(this).val();
					if(num <= 1 || num >= maxNum) {
						$("#buy-num").val(1);
					}
				});
			});
		</script>
		<script>
			$(function() {
				$("#login-btn").on('click', function() {
					layui.use('layer', function() {
						var layer = layui.layer;
						layer.open({
							content: $("#login-dialog"),
							title: '登录',
							type: 1,
							resize: false,
							area: "400px"
						});
					});
				});
			});
		</script>
	</head>

	<body>
		<div class="header">
			<div class="header-content clear">
				<div class="logo">
					<img src="img/dell-logo.png" width="101px" />
				</div>
				<div class="banner">
					戴尔官方旗舰店
					<a href="#"><img src="img/head-img1.gif"></a>
					<a href="#"><img src="img/tobuy1.png"></a>
					<a href="#"><img src="img/tobuy2.png" /></a>
				</div>
				<div class="login">
				<%
					User user = (User)session.getAttribute("login");
					if(user == null){
				%>
					<p>你好，请登录</p>
					<input type="button" value="登录" id="login-btn" />
					<a href="userpage.jsp?isReady=true">注册账号</a>
				<%
					}else {
				%>		
					<p>你好，<%=user.getNickname() %></p>
					<a href="doLogout.jsp?isReady=true">退出登录</a>
				<%
					}
				%>
				</div>
			</div>
		</div>
		<div class="main">
			<div class="main-content clear">
				<div class="left-side">
					<div class="navigator">
						<ul class="first-menu">
							<a href="#">
								<li class="first-li">首页</li>
							</a>
							<a href="#">
								<li class="first-li">全部产品</li>
							</a>
							<li class="first-li">笔记本
								<ul class="second-menu">
									<a href="#">
										<li><i class="fa fa-angle-right"></i>游戏本</li>
									</a>
									<a href="#">
										<li><i class="fa fa-angle-right"></i>轻薄本</li>
									</a>
									<a href="#">
										<li><i class="fa fa-angle-right"></i>XPS系列</li>
									</a>
									<a href="#">
										<li><i class="fa fa-angle-right"></i>外星人系列</li>
									</a>
								</ul>
							</li>
							<li class="first-li">台式机
								<ul class="second-menu">
									<a href="#">
										<li><i class="fa fa-angle-right"></i>台式机</li>
									</a>
									<a href="#">
										<li><i class="fa fa-angle-right"></i>游戏台式机</li>
									</a>
									<a href="#">
										<li><i class="fa fa-angle-right"></i>一体机</li>
									</a>
								</ul>
							</li>
							<li class="first-li">显示器
								<ul class="second-menu">
									<a href="#">
										<li><i class="fa fa-angle-right"></i>电竞游戏</li>
									</a>
									<a href="#">
										<li><i class="fa fa-angle-right"></i>微边框</li>
									</a>
									<a href="#">
										<li><i class="fa fa-angle-right"></i>商务办公</li>
									</a>
									<a href="#">
										<li><i class="fa fa-angle-right"></i>超薄系列</li>
									</a>
								</ul>
							</li>
							<a href="#">
								<li class="first-li">外设</li>
							</a>
						</ul>
						<input type="text" class="search-text" placeholder="搜索..." />
					</div>
					<div class="introduction clear">
						<div class="preview">
							<div class="spec-img">
								<img src="img/spec1-l.jpg" width="400px" />
							</div>
							<div class="spec-list">
								<ul>
									<li><img src="img/spec1-l.jpg" width="54px" /></li>
									<li><img src="img/spec2-l.jpg" width="54px" /></li>
									<li><img src="img/spec3-l.jpg" width="54px" /></li>
									<li><img src="img/spec4-l.jpg" width="54px" /></li>
									<li><img src="img/spec5-l.jpg" width="54px" /></li>
								</ul>
							</div>
							<div class="preview-info clear">
								<span class="left">
									<a href="#"><i class="fa fa-heart"></i>收藏</a>
									<a href="#"><i class="fa fa-share-alt"></i>分享</a>
								</span>
								<span class="right">
									<a href="#"><i class="fa fa-info-circle"></i>举报</a>
								</span>
							</div>
						</div>
						<div class="iteminfo">
							<div class="h-group">
								<h1>戴尔（DELL）XPS 15-9560 系列15.6英寸笔记本电脑(XPS15-9560-R2845)</h1>
								<p>定制类产品 指纹识别 即刻唤醒 疾速传输</p>
							</div>
							<div class="price">
								<label>价  格</label>
								<span id="prdPrice" class="prdPrice">
									<label>¥</label>
									13799.00
								</span>
							</div>
							<ul class="statistics">
								<li>
									<a href="#" title="点击查看评价">
										<span class="tag-label">累计评价</span>
										<span class="tag-count">51</span>
									</a>
								</li>
								<li>
									<a href="#" title="了解积分规则">
										<span class="tag-label">积分</span>
										<span class="tag-count">100</span>
									</a>
								</li>
							</ul>
							<div class="number">
								<label>数 量</label>
								<div class="wrap_input clear">
									<input type="number" min="1" max="20" value="1" id="buy-num" />
									<div class="number_btn">
										<a href="javascript:;">+</a><br />
										<a href="javascript:;">-</a>
									</div>
								</div>
								<label>件</label> 库存数量：
								<span class="rest-num">5</span>
							</div>
							<div class="blank-div"></div>
							<div class="btn-group clear">
								<div class="btn-basket">
									<a href="#none"><i class="fa fa-shopping-cart"></i>&nbsp;加入购物车</a>
								</div>
								<div class="btn-buy">
									<a href="#">立即购买</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="right-side">
					<p>----- 热门商品 -----</p>
					<div class="aside-content">
						<ul>
							<li>
								<div class="p-img">
									<a href="#"><img src="img/p-img1.jpg" width="180px"></a>
								</div>
								<div class="p-name">
									<a href="#">戴尔（DELL） Precision M5520 15.6英寸移动工作站笔记本 微边框</a>
								</div>
								<div class="p-price">
									<strong>￥35799.00</strong>
								</div>
							</li>
							<li>
								<div class="p-img">
									<a href="#"><img src="img/p-img2.jpg" width="180px"></a>
								</div>
								<div class="p-name">
									<a href="#">小米(MI)Pro 15.6英寸金属轻薄笔记本(i5-8250U 8G 256G PCIE SSD</a>
								</div>
								<div class="p-price">
									<strong>￥5699.00</strong>
								</div>
							</li>
							<li>
								<div class="p-img">
									<a href="#"><img src="img/p-img3.jpg" width="180px"></a>
								</div>
								<div class="p-name">
									<a href="#">Apple MacBook Pro 13.3英寸笔记本电脑 深空灰色 2018新</a>
								</div>
								<div class="p-price">
									<strong>￥13888.00</strong>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="footer-content">
				<div class="message">
					用户协议 | 商城意见反馈：028-8888888 | 在线反馈：6666666（QQ群）
				</div>
				<div class="copyright">
					Copyright © 1998-2018 JasonWu. All Right Reserved. 吴建成 版权所有</p>
				</div>
			</div>
		</div>
		<div style="display: none" id="login-dialog" class="login-dialog">
			<form method="post" action="doLogin.jsp" class="layui-form layui-form-pane">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">
						<input type="text" name="username" required lay-verify="username" autocomplete="off" class="layui-input" title="请填写用户名">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<input type="password" name="password" required lay-verify="required" autocomplete="off" class="layui-input" title="请填写密码">
					</div>
				</div>
				<div class="layui-form-item">
					<input type="submit" class="layui-btn layui-btn-normal" value="登录" />
				</div>
				<input name="isReady" value="true" style="display: none;" />
			</form>
		</div>
	</body>
	<script type="text/javascript" src="layui/layui.js"></script>

</html>