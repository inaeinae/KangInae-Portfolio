<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<link href="${contextPath}/resources/css/style.css" rel="stylesheet">
	
	<!-- 폰트어썸 -->
	﻿<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	
	<title>Kang Inae</title>
	
	<style>
		html,body {
			background-color: var(--mainwhite);
			color: var(--mainblack);
		}
		
		.bg-circle {
			width: 40%;
			padding-bottom: 40%;
			border-radius: 50%;
			border: 10px solid blue;
			
			left: -13%;
			bottom: -15%;
			
			position: fixed;
			transition: all ease 1.5s;
		}
		
		.photo{
			/* background-color: yellow; */
			position: fixed;
			left: -4%;
			bottom: 0;
		}
		
		#profileImg{
			min-width: 40%;
			max-width: 40%;
		}
		
		.photo img{
			width: 100%;
			vertical-align: bottom;
		}
		
		#subInfo{
			font-size: 1.3vw;
			font-weight: bold;
		}
		
		.content{
			/* background-color: orange; */
			width: 70%;
			
			position: absolute;
			right: 0;
			top: 0;
			
			padding-top: 5%;
			padding-bottom: 5%;
			
			font-size: 1.1vw;
			text-align: left;
		}
		
		#profileInfo{
			/* background-color: red; */
			position:fixed;
		}
		
		.detail-info{
			float: right;
			margin-left: 38%;
		}
		
		#programInfo{
			margin-bottom: 10%;
		}
		
		#timeLine{
			width: 100%;
		}
		
		table{
			width: 90%;
			white-space: nowrap;
			border-spacing: 0px;
		}
		
		td{
			padding: 0;
			margin: 0;
			text-align: center;
		}
		
		tr td:nth-child(1){
			padding-left: 3%;
		}
		
		tr td:nth-last-child(2){
			padding-left: 3%;
			
			color: var(--maingray);
		}
		
		tr td:nth-last-child(1){
			padding-left: 3%;
			
			text-align: left;
		}
		
		.hover-tr{
			background-color: rgba(0, 0, 0, 0.1);
			transition: all ease 0.8s;
		}
		
		/* 
		.time-info-flag{
			padding-left: 2%;
			transition: all ease 2.0s;
		}
		 */
		
		.icon{
			width: 15%;
			border-radius: 50%;
			
			posistion: relative;
			
			background-color: blue;
			text-align:center;
		}
		
		.icon:after{
			padding-bottom: 15%;
		}
		/* 나중 참고용 : https://eunclove.tistory.com/506 */
		
		.icon p{
			display: inline-block;
			vertical-align:middle;
			
			font-size: 2vw;
			font-weight: bold;
			
			color: white;
		}
	</style>
</head>
<body onload="Load_bg();">
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
	<div class="position-front photo block" id="profileImg">
		<img src="${ contextPath }/resources/img/profile_img_bw.png">
	</div>
	<!-- 
	<div class="position-back bg-circle"></div>
	 -->
	 <!-- 
		<div class="position-front block content" id="profileInfo">
			<p class="title">
				강인애<br>
				KANG IN AE
			</p>
			<p id="subInfo">
				1996. 09. 05<br>
				kkin09@naver.com<br>
				서일대학교, 소프트웨어공학과
			</p>
		</div>
	 -->
	<canvas id="bgCanvas">
		
	</canvas>
	
	<div class="position-front content">
		
		<div class="detail-info">
			<div class="block" id="programInfo">
				<p class="subtitle">
					Programming Language
				</p>
				
				<div class="">
					<div class="icon"><p>C</p></div>
				</div>
			</div>
			
			<div class="block" id="timeLine">
				<p class="subtitle">
					Time Line
				</p>
				
				<div class="">
					<table id="timeline">
					</table>
				</div>
			</div>
		</div>
		
	</div>
	
	<script>
		
		$(window).on('scroll', function() {
			var scrollPercent = ($(window).scrollTop() / ($(document).outerHeight() - $(window).height()))*10;
			var transSize = 40 + (scrollPercent*1.5)
			$('.bg-circle').css({'width': transSize + '%', 'padding-bottom': transSize + '%'});
		});
		//참고 : https://tyle.io/blog/61
		
		$(function() {
		    var lineData = $.ajax({
                url: './resources/data/gitTimelineInfo.txt',
                async: false
             }).responseText;
		    
			var lineArr = lineData.split('%');
			//참고 : https://www.python2.net/questions-12013.htm
			
			for(var i in lineArr) {
				var tableArr = lineArr[i].split('^');
				var tdArr = [];
				
				for(var j = 0; j < 5; j++) {
					if(j+1 <= tableArr[0].length)
						tdArr[j] = tableArr[0].substring(j, j+1);
					else
						tdArr[j] = "&nbsp;";
				}
				
				$('#timeline').append('<tr><td>' + tdArr[0] + '</td><td>' + tdArr[1] + '</td><td>' + tdArr[2] + '</td><td>' + tdArr[3] + '</td><td>' + tdArr[4] + '</td><td>'
						+ tableArr[1] + '</td><td>' + tableArr[2] + '</td></tr>');
			}
			
			//위쪽 화살표 <i class="fas fa-angle-up"></i>
			//var timeInfoHTML = '<span class="time-info-flag" style="color: var(--mainblack)"><i class="fas fa-angle-down"></i></span>';
			//var ori;
			
			var clickTr;
			$('#timeline tr td:nth-last-child(1)').mouseenter(function() {
				if($(this).text() != '' && $(this).text().indexOf('Merge')) {
					//ori = $(this).text();
					//$(this).html(ori + timeInfoHTML);
					
					var here = $(this).parent().index();
					
					if(checkBranch(here)) {
						var endCommit = searchBranch(here);
						for(var i = here; i >= endCommit; i--) {
							$('#timeLine tr').eq(i).addClass('hover-tr');
						}
					} else {
						$(this).parent().addClass('hover-tr');
					}
					
					$(this).css('cursor', 'pointer');
				}
			}).mouseleave(function() {
				if($(this).text() != '' && $(this).text().indexOf('Merge')) {
					//$(this).html(ori);
					
					var here = $(this).parent().index();
						
					if(checkBranch(here)) {
						var endCommit = searchBranch(here);
						for(var i = here; i >= endCommit; i--) {
							$('#timeLine tr').eq(i).removeClass('hover-tr');
						}
					} else {
						$(this).parent().removeClass('hover-tr');
					}
				}
			}).click(function() {
				if($(this).text() != '' && $(this).text().indexOf('Merge')) {
					var here = $(this).parent().index();
					
					if(checkBranch(here)) {
						var endCommit = searchBranch(here);
						for(var i = here; i >= endCommit; i--) {
							$('#timeLine tr').eq(i).addClass('hover-tr');
						}
					} else {
						$(this).parent().addClass('hover-tr');
					}
				}
			});
			//참고 : https://m.blog.naver.com/PostView.nhn?blogId=interbirds&logNo=220120122658&proxyReferer=https:%2F%2Fwww.google.com%2F
			
			$('#profileImg').mouseover(function() {
				$(this).children().attr('src','${ contextPath }/resources/img/profile_img.png');
			}).mouseout(function() {
				$(this).children().attr('src','${ contextPath }/resources/img/profile_img_bw.png');
			});
		});
		
		function checkBranch(startCommit) {
			var check;
			
			var frontLine = $('#timeline tr').eq(startCommit-1).children('td:nth-child(2)').text();
			if(frontLine == '/') check = true;
			else check = false;
			
			return check;
		}
		
		function searchBranch(startCommit) {
			var countBranch = 0;
			var endCommit = 0;
			
			for(var i = startCommit-2; i >= 0; i--) {
				var frontLine = $('#timeline tr').eq(i).children('td:nth-child(2)').text();
				
				if(frontLine == '/') {
					countBranch++;
				} else if(frontLine == '\\') {
					if(countBranch > 0) {
						countBranch--;
					}else {
						endCommit = i - 1;
						break;
					}
				}
			}
			
			return endCommit;
		}
		
		function Load_bg() {
			var width = $(window).width();
			var height = $(window).height();
			
			var canvas = document.getElementById("bgCanvas");
			canvas.width = width;
			canvas.height = height;

			var width = width/3;
			var height = height/3;
			
			var ctx = document.getElementById("bgCanvas").getContext("2d");
			
			ctx.font = '700 50px sans-serif';
			ctx.fillStyle = "#232931";
			ctx.fillText('강인애', 450, 200);
			ctx.font = '700 40px sans-serif';
			ctx.fillText('KANG IN AE', 450, 245);
						
			/* 
			ctx.lineWidth = 10;
			ctx.fillStyle = "red";
			ctx.fillRect(height+30, width+30, 400, 600);
			ctx.fill();
			 */
			ctx.globalCompositeOperation = 'xor';
			
			ctx.lineWidth = 15;
			ctx.strokeStyle = "blue";
			ctx.arc(height, width, 420, 0, (Math.PI / 180) * 360, true);
			ctx.stroke();
		}
		
		/*
		참고
		
		https://m.blog.naver.com/PostView.nhn?blogId=javaking75&logNo=140170321918&proxyReferer=https:%2F%2Fwww.google.com%2F
		https://kkangil.github.io/2020/05/31/Canvas%EC%9D%98-%EA%B8%B0%EC%B4%88/
		https://m.blog.naver.com/PostView.nhn?blogId=phlox__&logNo=221223871826&proxyReferer=https:%2F%2Fwww.google.com%2F
		https://www.w3resource.com/html5-canvas/html5-canvas-text.php
		*/
	</script>
</body>
</html>