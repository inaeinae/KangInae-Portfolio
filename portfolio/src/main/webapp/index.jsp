<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<link href="${contextPath}/resources/css/style.css" rel="stylesheet">
	
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
			background-color: var(--maingreen);
			
			left: -13%;
			bottom: -15%;
			
			position: fixed;
			transition: all ease 1.5s;
		}
		
		.photo{
			min-width: 40%;
			max-width: 40%;
			/* background-color: yellow; */
			
			position: fixed;
			left: -4%;
			bottom: 0;
		}
		
		.photo img{
			width: 100%;
			vertical-align: bottom;
		}
		
		.content{
			width: 70%;
			/* background-color: orange; */
			
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
			width: 100%;
			white-space: nowrap;
			border-spacing: 0px;
		}
		
		td{
			padding: 0;
			margin: 0;
		}
		 
		tr :nth-last-child(2){
			padding-left: 5%;
			text-align: center;
			
			color: var(--maingray);
			font-size: 0.9vw;
		}
		
		tr :nth-last-child(1){
			padding-left: 5%;
		}
	</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
	<div class="position-back bg-circle"></div>
	
	<div class="position-front photo block">
		<img src="${ contextPath }/resources/img/profile_img.png">
	</div>
	
	<div class="position-front content">
		<div class="block" id="profileInfo">
			<p class="title">
				강인애<br>
				KANG IN AE
			</p>
			<p class="subtitle">
				1996. 09. 05<br>
				kkin09@naver.com<br>
				서일대학교, 소프트웨어공학과
			</p>
		</div>
		
		<div class="detail-info">
			<div class="block" id="programInfo">
				<p class="subtitle">
					Programming Language
				</p>
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
		$(function() {
		    var lineData = $.ajax({
                url: './resources/data/gitTimelineInfo.txt',
                async: false
             }).responseText;
		    
			var lineArr = lineData.split('%');
			
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
		});
		
		$(window).on('scroll', function() {
			var scrollPercent = ($(window).scrollTop() / ($(document).outerHeight() - $(window).height()))*10;
			var transSize = 40 + (scrollPercent*2)
			$('.bg-circle').css({'width': transSize + '%', 'padding-bottom': transSize + '%'});
		});
		
	</script>
</body>
</html>