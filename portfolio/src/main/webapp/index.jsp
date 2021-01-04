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
			color: var(--maingray);
		}
		
		.position-back{
			position: absolute;
			z-index: 1;
		}
		
		.position-front{
			position: absolute;
			z-index: 2;
		}
		
		.block{
			display: inline-block;
			vertical-align: top;
		}
		
		.photo{
			width: 40%;
			background-color: yellow;
			
			position:fixed;
			bottom: 0;
		}
		
		.content{
			width: 65%;
			/* background-color: orange; */
			
			margin-top: 5%;
			margin-left: 35%;
		}
		
		.info{
			width: 40%;
			text-align: right;
			background-color: red;
		}
		
		.detail-info{
			width: 59%;
			text-align: right;
			background-color: gray;
		}
		
		.title{
			font-size: 3.0em;
		}
		
		.subtitle{
			font-size: 2.0em;
		}
		
		
	</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
	<div class="position-front photo block">&nbsp;</div>
	
	<div class="position-front content">
		<div class="info block">
			<p class="title">
				강인애<br>
				Kang In Ae
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
			
			<p class="subtitle">
				<p>&nbsp;</p>
			</p>
		</div>
	</div>
	
</body>
</html>