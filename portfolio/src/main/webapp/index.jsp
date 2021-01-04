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
		
		.position-back{
			position: absolute;
			z-index: 1;
		}
		
		.position-front{
			position: absolute;
			z-index: 2;
		}
		
		.circle {
			width: 50%;
			padding-bottom: 50%;
			border-radius: 50%;
			background-color: var(--maingreen);
			
			left: -13%;
			bottom: -15%;
		}
		
		.block{
			display: inline-block;
			vertical-align: top;
		}
		
		.photo{
			min-width: 40%;
			/* background-color: yellow; */
			
			position:fixed;
			left: -2%;
			bottom: 0;
		}
		
		.photo img{
			width: 100%;
			vertical-align: bottom;
		}
		
		.content{
			width: 65%;
			/* background-color: orange; */
			
			margin-top: 5%;
			margin-left: 35%;
			
			text-align: left;
		}
		
		.info{
			width: 30%;
			/* background-color: red; */
			
			margin-right: 5%;
		}
		
		.detail-info{
			width: 60%;
			/* background-color: gray; */
		}
		
		.title{
			font-size: 2vw;
			font-weight: bold;
		}
		
		.subtitle{
			font-size: 1.2vw;
		}
		
		table{
			width: 100%;
			border-spacing: 10px;
		}
		
		tr :nth-child(1){
			color: var(--maingray);
			pointer: default;
		}
		
		tr :nth-child(2){
			cursor: pointer;
		}
	</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
	<div class="position-back circle"></div>
	
	<div class="position-front photo block">
		<img src="${ contextPath }/resources/img/profile_img.png">
	</div>
	
	<div class="position-front content">
		<div class="info block">
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
		
		
		<div class="detail-info block">
			<p class="title">
				Programming Language
			</p>
			
			<div class="subtitle">
				&nbsp;
			</div>
			
			
			<p class="title">
				Time Line
			</p>
			
			<div class="subtitle">
				<table>
					<tr>
						<td>2016. 03</td>
						<td>서일대학교 소프트웨어공학과 입학</td>
					</tr>
					<tr>
						<td>2017. 03</td>
						<td>서일대학교 학생상담센터 근로장학생 근무</td>
					</tr>
					<tr>
						<td>2017. 11</td>
						<td>서일대학교 세방도서관 근로장학생 근무</td>
					</tr>
					<tr>
						<td>2018. 07</td>
						<td>메타소프트 현장실습</td>
					</tr>
					<tr>
						<td>2018. 11</td>
						<td>서일대학교 졸업작품 발표</td>
					</tr>
					<tr>
						<td>2019. 03</td>
						<td>서일대학교 소프트웨어공학과 전공심화 입학</td>
					</tr>
					<tr>
						<td>2019. 11</td>
						<td>KH정보교육원 취업성공패키지 수료</td>
					</tr>
					<tr>
						<td>2020. 08</td>
						<td>정보처리기사 취득</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
</body>
</html>