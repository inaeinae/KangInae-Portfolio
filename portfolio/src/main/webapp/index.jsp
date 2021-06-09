<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  
	response.setHeader("Cache-Control","no-store");  
	response.setHeader("Pragma","no-cache");  
	response.setDateHeader("Expires",0);  
	if (request.getProtocol().equals("HTTP/1.1"))        
		response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- 마크다운 파일 -->
	<script src="https://cdn.jsdelivr.net/npm/showdown@1.9.0/dist/showdown.min.js"></script>
	<!-- 폰트어썸 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	
	<link href="${contextPath}/resources/css/style.css" rel="stylesheet">
	
	<title>Kang Inae</title>
	
	<style>
		/* &페이지 */
		html,body {
			background-color: var(--mainblack);
			color: var(--mainwhite);
			overflow-x: hidden;
			overflow-y: auto;
		}
		
		
		/* &배경 */
		.bg-circle {
			width: 43%;
			padding-bottom: 43%;
			border-radius: 50%;
			border: 10px solid blue;
			
			left: -13%;
			bottom: -15%;
			
			position: fixed;
			transition: all ease 1.5s;
		}
		
		.photo{
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
		
		
		/* &내용 */
		#subInfo{
			font-size: 1.3vw;
			font-weight: bold;
		}
		
		.content{
			width: 70%;
			
			position: absolute;
			right: 0;
			top: 0;
			
			padding-top: 5%;
			padding-bottom: 5%;
			
			font-size: 1.05vw;
			text-align: left;
		}
		
		#profileInfo{
			position:fixed;
		}
		
		.detail-info{
			float: right;
			margin-left: 32%;
		}
		
		#programInfo{
			margin-bottom: 6%;
		}
		
		
		/* &타임라인 */
		#timeLine{
			width: 100%;
		}
		
		#timeGraph{
			width: 95%;
			white-space: nowrap;
			border-spacing: 0px;
		}
		
		#timeGraph td{
			padding: 0;
			margin: 0;
			text-align: center;
		}
		
		#timeGraph td:nth-child(1), td:nth-child(2), td:nth-child(3), td:nth-child(4), td:nth-child(5){
			font-size: 1.2vw;
		}
		#timeGraph td:nth-child(2), td:nth-child(3), td:nth-child(4), td:nth-child(5){
			padding-left: 0.6%;
		}
		/* 
		#timeGraph td:nth-child(1){
			padding-left: 2%;
		}
		#timeGraph td:nth-child(2){
			padding-left: 1.5%;
		} */
		
		#timeGraph tr td:nth-last-child(2){
			padding-left: 3%;
			color: var(--maingray);
		}
		
		#timeGraph tr td:nth-last-child(1){
			padding-left: 3%;
			text-align: left;
		}
		
		.hover-bg-white{
			background-color: rgba(256, 256, 256, 0.05);
		}
		.hover-color-black{
			color: var(--maingray);
		}
		
		.hover-trans{
			transition: all ease 0.5s;
		}
		
		/* 
		.hover-bold{
			font-weight: bold;
			transition: all ease 0.7s;
		}
		 */
		 
		/* 
		.time-info-flag{
			padding-left: 2%;
			transition: all ease 2.0s;
		}
		 */
		
		
		/* &프로그래밍언어 */
		.languageList{
			width: 95%;
			line-height: 2.6;
		}
		
		.language{
			display: inline-block;
			line-height: 1.8;
			border: 0.155vw var(--lightgray) solid;
			color: var(--lightgray);
			border-radius: 2vw;
			padding-left: 1.5%;
			padding-right: 1.5%;
			margin-right: 1%;
			font-size: 0.85vw;
			cursor: pointer;
		}
		
		.click{
			color: var(--mainwhite);
			border: 0.17vw var(--mainwhite) solid;
			transition: all ease 0.35s;
		}
		
		.looked{
			color: #4e4e4e;
			border: 0.155vw #4e4e4e solid;
			transition: all ease 0.35s;
		}
		
		
		/* &프로그래밍언어 - 모달 */
		.modal{
			display: none;
			position: fixed;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(0, 0, 0, 0.35);
			opacity: 0;
			z-index: 4;
			transform: scale(1.1);
			transition: visibility 0s linear 0.35s, opacity 0.35s 0s, transform 0.35s;
		}
		
		.modal p{
			margin: 0;
			line-height: 1.5;
		}
		
		.modal p:nth-child(2){
			margin-bottom: 2rem;
		}
		
		.modal p:nth-child(n+3){
			margin-top: 1rem;
		}
		
		.modal-content{
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background-color: var(--mainwhite);
			color: var(--mainblack);
			padding: 4rem 3rem;
			width: 65%;
			height: auto;
			transition: all ease 0.35s;
			
			/* overflow: scroll; */
			overflow-x: hidden;
			overflow-y: auto;
		}
		
		.modal-title{
			text-align: center;
		}
		
		.close-modal{
			position: absolute;
			top: 1.4vw;
			right: 1.2vw;
			cursor: pointer;
			transform: scale(1.5);
			color: var(--mainblack);
		}
		
		.close-modal i{
			transform: scale(1.2);
		}
		
		.show-modal{
			opacity: 1;
			display: block;
			transform: scale(1.0);
			transition: visibility 0s linear 0s, opacity 0.35s 0s, transform 0.35s;
		}
		
		#mContext{
			/* text-align: center; */
		}
		
		#mTable {
			margin: auto;
			width: 90%;
			font-size: 1.0vw;
			border-spacing: 1vw;
		}
		
		#mTable td{
			text-align: left;
			word-break: keep-all;
		}
		
		.headTr{
			font-size: 1.4vw;
			font-weight: bold;
			text-align: left;
		}
		
		.hidTr{
			display: none;
		}
		
		.small-tag{
			display: inline-block;
			vertical-align: middle;
			line-height: 1.6;
			border-radius: 2vw;
			padding-left: 1%;
			padding-right: 1%;
			margin-left: 1%;
			font-weight: bold;
			font-size: 0.7vw;
		}
		
		.pl-tag{
			border: 0.17vw var(--maingray) solid;
			color: var(--maingray);
		}
		.tp-tag{
			border: 0.17vw var(--maingray) solid;
			background-color: var(--maingray);
			color: var(--mainwhite);
		}
		.tl-tag{
			border: 0.155vw var(--mainwhite) solid;
			color: var(--mainwhite);
			font-size: 0.73vw;
			font-weight: normal;
		}
		
		.modal-img-block{
			width: 98%;
			display: inline-flex;
			justify-content: space-between;
			align-items: center;
		}
		
		.modal-img {
			display: inline-block;
		}
		
		.modal-img img, video{
			width: 100%;
			height: auto;
		}
		
		.two-block{
			width: 49.5%;
		}
		
		.one-block{
			width: 99%;
		}
		
		.fixed {
			position: fixed;
		}
		
		.modal-link{
			font-weight: bold;
			cursor: pointer;
			
			background-color: var(--mainblack);
			color: white;
			padding: 0.3%;
			transition: all ease 0.35s;
		}
		
		
		/* &도움말 */
		#helpBtn {
			position: fixed;
			right: 2vw;
			bottom: 2vw;
			width: 2.5vw;
			height: 2.5vw;
			background-color: var(--mainwhite);
			border-radius: 50%;
			z-index: 100;
			cursor: pointer;
			transform: scale(1.2);
			transition: all ease 1.2s;
			box-shadow: 0px 0px 0.4vw 2px #10121A;
		}
		
		#helpBtn span {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			color: #10121A;
		}
		
		/* #helpBtn span i{
			transform: scale(1.2);
		} */
		
		#helpDiv{
			display: none;
			position: fixed;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(0, 0, 0, 0.35);
			opacity: 0;
			z-index: 100;
			transition: visibility 0s linear 0.35s, opacity 0.35s 0s, transform 0.35s;
		}
		
		
		/* &대기화면 */
		#loading {
			vertical-align: middle;
		  	z-index: 99;
			transition: all ease 2.0s;
		}
		
		#loading > div {
			width: 100%;
			height: 100%;
			position: fixed;
			display: block;
		  	opacity: 0.6;
		  	background: #000;
		  	z-index: 99;
		  	text-align: center;
		}
		
		#loading > p {
    		font-size: 7.0vw;
			position: absolute;
		  	top: 50%;
		  	left: 50%;
		  	transform: translate( -50%, -100% );
		  	z-index: 100;
		}
		
	</style>
</head>
<body onload="resourceLoading();">
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
	<div id="helpDiv"></div>
	<div id="helpBtn"><span><i class="fas fa-question fa-lg"></i></span></div>
	
	<div id="loading">
	    <!-- <img src="./resources/img/loadingbar.gif"> -->
	    <div></div>
	    <p class="title">Kang In Ae</p>
	</div>
	
	<div class="position-back bg-circle"></div>
	
	<div class="position-front photo block" id="profileImg">
		<img src="${ contextPath }/resources/img/profile_img.png">
	</div>
	
	<div class="position-front content">
		<div class="block" id="profileInfo">
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
		
		<div class="detail-info">
			<div class="block" id="programInfo" style="width: 100%;">
				<p class="subtitle">
					Programming Language
				</p>
				
				<div class="languageList">
			  		<div class="language">#AndroidStudio</div>
			  		<div class="language">#Arduino</div>
			  		<div class="language">#AWS</div>
			  		<div class="language">#ASP</div>
			  		<div class="language">#C</div>
			  		<div class="language">#C#</div>
			  		<div class="language">#C++</div>
			  		<div class="language">#CSS</div>
			  		<div class="language">#Database</div>
			  		<div class="language">#Git</div>
			  		<div class="language">#HTML</div>
			  		<div class="language">#Illustrator & Photoshop</div>
			  		<div class="language">#Java</div>
			  		<div class="language">#JavaScript</div>
			  		<div class="language">#MFC</div>
			  		<div class="language">#Spring</div>
			  		<div class="language">#Unity</div>
			  		<div class="language">#Unix</div>
			  		<div class="language">#UML</div>
			  		<div class="language">#VisualBasic</div>
			  		<div class="language">#...</div>
				</div>
			</div>
			
			
			<div class="block" id="timeLine">
				<p class="subtitle">
					Time Line
				</p>
				
				<div>
					<table id="timeGraph">
					</table>
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="modal">
		<div class="modal-content">
			<span class="close-modal"><i class="far fa-times-circle"></i></span>
			<p class="modal-title title" id="mTitle"></p>
			<div id="mContext">
				<table id="mTable"></table>
			</div>
		</div>
	</div>
	
	
	<script>
		/* 이미지 프리로딩 */
		function resourceLoading() {
			//병렬처리
			preloading(2, ['help.png']);
			preloading(1, ['and_1.png', 'and_2.png', 'ard_2.png', 'cshop_2.png', 'ill_1.png', 'ill_2.png', 'ill_3.png', 'ill_4.png', 'pho_1.png', 'pho_2.png', 'pho_3.png', 'spr_1.png', 'spr_2.png', 'vb_1.png'])
		}
		
		function preloading(type, imageArray) {
			if(type == 1)
				var dir = './resources/img/hashtag/';
			else
				var dir = './resources/img/';
			
			let n = imageArray.length;
			for (let i = 0; i < n; i++) {
				let img = new Image();
				img.src = dir + imageArray[i];
			}
		}
		
		/* 배경 스타일 */
		$(window).on('scroll', function() {
			var scrollPercent = ($(window).scrollTop() / ($(document).outerHeight() - $(window).height()))*10;
			var transSize = 43 + (scrollPercent*1.5)
			$('.bg-circle').css({'width': transSize + '%', 'padding-bottom': transSize + '%'});
		});
		
		$(function() {
			/* 대기화면 */
			$('body').css('position', 'fixed');
			$('#loading').click(function() {
				$('#loading').hide();
				$('body').css('position', 'scroll');
			});
			
			var clickLanguage = '',
				mLength = 0;
			function toggleModal(type) {
				if(type == 'click') {
					$.ajax({
						url: 'programInfo',
						data: {programLanguage:clickLanguage},
						dataType: 'json',
						async: false,
						success: function(data) {
							$('#mTitle').html(data['header']);
							$('#mTable').html('');
							
							var contxtArr = data['context'].split('<br>');
							var triger = 0;
							
							for(i in contxtArr){
								if(contxtArr[i].substr(0,1) == '&') {
									triger = 1;
									var appendCode;
									var txt = contxtArr[i].split('@');
									var tag = txt[2].split('(');
									
									appendCode = '<tr class="headTr hover-trans"><td style="text-align: center;">' + txt[0].slice(2) + '</td>';
									appendCode = appendCode + '<td>' + txt[1] + '</td>';
									appendCode = appendCode + '<td>' + tag[0];
									
									if(tag.length > 1) {
										for(var i = 1; i < tag.length; i++) {
											var contxt = tag[i].substring(0, tag[i].length-1);
											var tagType;
											if(contxt == 'Front' || contxt == 'Back') tagType = 'small-tag tp-tag';
											else tagType = 'small-tag pl-tag';
											appendCode = appendCode + '<div class="' + tagType + '">' + tag[i].substring(0, tag[i].length-1) + '</div>';
										}
									}
									
									appendCode = appendCode + '</td></tr>';
									$('#mTable').append(appendCode);
								} else if(triger == 1) {
									if(contxtArr[i].substr(0,1) == '>') {
										var hidContext = contxtArr[i].slice(2);
										
										if(hidContext.substr(0, 4) == '<div') {
											$('#mTable').append('<tr class="hidTr hidden"><td colspan="3" style="font-size:1.6vw;">' + hidContext + '</td></tr>');
										} else {
											$('#mTable').append('<tr class="hidTr hidden"><td colspan="3">' + hidContext + '</td></tr>');
										}
									} else {
										triger == 0;
									}
								}
								mLength++;
							}
							
							if($('.headTr').length >= 15) $('.modal-content').css('height', '70vh');
							else $('.modal-content').css('height', 'auto');
						},
						error: function(data) {
							console.log('실패');
						}
					});
					
					$('html,body').addClass('fixed');
				} else {
					$('html,body').removeClass('fixed');
				}

				$('#mTable').css('width', '90%');
				document.querySelector(".modal").classList.toggle("show-modal");
			}
			
			function windowOnClick(event) { if(event.target === document.querySelector(".modal")) toggleModal(); }
			document.querySelector(".close-modal").addEventListener("click", toggleModal);
			window.addEventListener("click", windowOnClick);
			
			$('.language').click(function() {
				if($(this).text() != '#AWS') {
					var language = $(this).parent();
					
					for(var i=0; i < language.children().length; i++) {
						if(language.children(':eq('+ i + ')').hasClass('click') == true && $(this).index() != i) {
							language.children(':eq('+ i + ')').removeClass('click');
							language.children(':eq('+ i + ')').addClass('looked');
							break;
						}
					}
					
					clickLanguage = $(this).text().slice(1);
					toggleModal('click');
					if($(this).hasClass('looked') == true) $(this).removeClass('looked');
					$(this).addClass('click');
				}
			});
			
			// 모달창 닫기 버튼 - 마우스 이벤트에 따라 아이콘 바뀌게
			$('.close-modal').mouseenter(function() {
				$('.close-modal i').attr('class', 'fas fa-times-circle');
			}).mouseleave(function() {
				$('.close-modal i').attr('class', 'far fa-times-circle');
			});
			
			
			var clickModal = 99999;
			var clickTag = '';
			$(document).on('mouseenter', '.headTr', function(){
				if($(this).parents().children('tr:eq(' + ($(this).index() + 1) + ')').hasClass('hidden') == true) {
					$(this).css('cursor', 'pointer');
					$(this).addClass('hover-color-black');
				}
			}).on('mouseleave', '.headTr', function(){
				if(clickModal != $(this).index()) $('#mTable tr:eq(' + $(this).index() + ')').removeClass('hover-color-black');
			}).on('click', '.headTr', function(){
				if($(this).parents().children('tr:eq(' + ($(this).index() + 1) + ')').hasClass('hidden') == true) {
					//클릭했던 tr이 아닐 때
					if(clickModal != $(this).index()) {
						//clickModal이 초기값이 아닐 때 클릭했던 tr의 bgcolor를 돌려놓고 내용을 숨김
						if(clickModal != 99999) {
							var $lastClick = $(this).parent().children('tr:eq(' + clickModal + ')');
							var head = $lastClick.html();
							$lastClick.html(head.slice(0, head.length-5) + clickTag + head.slice(head.length-5, head.length));
							clickTag = '';
							
							$lastClick.removeClass('hover-color-black');
							modalEvent('close', $(this));
						}
						//클릭한 tr의 내용을 보여줌
						var head = $(this).html();
						clickTag = head.slice(head.indexOf('<div'), head.length-5);
						$(this).html(head.replace(clickTag, ''));
						
						clickModal = $(this).index();
						modalEvent('open', $(this));
						
					//클릭했던 tr일 때
					} else {
						//tr의 bgcolor를 돌려놓고 내용을 숨김
						var head = $(this).html();
						$(this).html(head.slice(0, head.length-5) + clickTag + head.slice(head.length-5, head.length));
						clickTag = '';
						
						$(this).removeClass('hover-color-black');
						modalEvent('close', $(this));
						clickModal = 99999;
					}
				}
			});
			
			function modalEvent(type, where) {
				var i = clickModal + 1;
				while(true) {
					if(i >= mLength-1) break;
					
					var here = where.parent().children('tr:eq(' + i + ')');
					i++;
					
					if(here.hasClass('headTr') == true) {
						break;
					} else {
						if(type == 'close') here.addClass('hidTr');
						else if(type == 'open') here.removeClass('hidTr');
					}
				}
				
				if(type == 'open') {
					if($('.modal-content').innerHeight() >= window.outerHeight*0.7)
						$('.modal-content').css('height', '70vh');
					else
						$('.modal-content').css('height', 'auto');
				} else if(type == 'close') {
					if($('.headTr').length >= 15)
						$('.modal-content').css('height', '70vh');
					else
						$('.modal-content').css('height', 'auto');
				}
			}
			
			/* 
			$('#profileImg').mouseenter(function() {
				$(this).children().attr('src','${ contextPath }/resources/img/profile_img.png');
			}).mouseleave(function() {
				$(this).children().attr('src','${ contextPath }/resources/img/profile_img_bw.png');
			});
			 */
			
			/* 도움말 */
			var trg = 0;
			$('#helpBtn').mouseenter(function() {
				$(this).css('transform', 'scale(1.6)');
			}).mouseleave(function() {
				$(this).css('transform', 'scale(1.2)');
			}).click(function() {
				if(trg == 0) {
					$('#loading').hide();
					$('#helpBtn').html('<span><i class="fas fa-question fa"></i></span>');
					$('#helpBtn').css({'width':'2vw', 'height':'2vw'});
					trg = 1;
				}
				
				$('#mTitle').html('사이트 구성과 설명');
				$('#mTable').html('<tr><td style="text-align: center;"><div class="modal-img-block"><div class="modal-img one-block"><img src="resources/img/help.png"/></div></div></td></tr>');
				
				$('html,body').addClass('fixed');
				$('#mTable').css('width', '100%');
				$('.modal-content').css('height', '70vh');
				document.querySelector(".modal").classList.toggle("show-modal");
			});
			
			/* 타임라인 */
		    var lineData = $.ajax({
                url: './resources/data/gitTimelineInfo.txt',
                async: false
             }).responseText;
		    
		    lineData = lineData.replace(/(\r\n|\n|\r)/gm,"");
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
				
				$('#timeGraph').append('<tr class="hover-trans"><td>' + tdArr[0] + '</td><td>' + tdArr[1] + '</td><td>' + tdArr[2] + '</td><td>' + tdArr[3] + '</td><td>' + tdArr[4] + '</td><td>'
						+ tableArr[1] + '</td><td>' + tableArr[2] + '</td></tr>');
			}
			
			settingTimeLine();
			
			//hoverTr[0] : 가지의 시작 (초기값 99999), hoverTr[1] : 가지의 끝
			var hoverTr = [99999, 0];
			//hover된 가지의 색을 담는 배열
			var hoverColor = [];
			$('#timeGraph tr td:nth-last-child(1), td:nth-last-child(2)').mouseenter(function() {
				//timline table의 내용에 mouseover했을 때
				if($(this).text() != '' && $(this).text().indexOf('Merge')) {
					//timeLineEvent($(this), 'enter');
					var here = $(this).parent().index();
					hoverTr[0] = here;
					hoverColor = [];

					//branch가 존재할 때
					if(checkBranch(here)) {
						//branch를 찾음
						var branchMap = searchBranch('branch', here);
						var endCommit = here - branchMap.size;
						hoverTr[1] = endCommit + 1;
						
						//해당 branch의 색을 뺏음
						for(var i = here; i > endCommit; i--) {
							var value = parseInt(branchMap.get(i)) - 1;
							var target = $('#timeGraph tr:eq(' + i + ') td:eq(' + value + ')');
							
							hoverColor.push(value);
							hoverColor.push(target.css('color'));
							
							target.css('color', 'white');
							target.addClass('hover-trans');
							target.parent().addClass('hover-bg-white');
						}
						
					//branch가 존재하지 않을 때
					} else {
						$('#timeGraph tr:eq(' + here + ') td:eq(0)').addClass('hover-trans');
						$('#timeGraph tr:eq(' + here + ')').addClass('hover-bg-white');
						hoverTr[1] = here;
						//hoverColor.push('var(--mainwhite)');
					}
				}
			}).mouseleave(function() {
				if($(this).text() != '' && $(this).text().indexOf('Merge')) {
					var here = $(this).parent().index();
					
					//branch가 존재할 때
					if(checkBranch(here)) {
						//branch를 찾음
						var branchMap = searchBranch('branch', here);
						var endCommit = here - branchMap.size;
						
						//해당 branch의 색을 돌려줌
						for(var i = here; i >= endCommit; i--) {
							$('#timeGraph tr').eq(i).removeClass('hover-bg-white');
							$('#timeGraph tr:eq(' + i + ') td:eq(' + hoverColor.shift() + ')').css('color', hoverColor.shift());
						}
						
					//branch가 존재하지 않을 때
					} else {
						$(this).parent().removeClass('hover-bg-white');
					}
				}
			});
			
		});

		//해당 내용의 branch가 존재하는지 찾는 함수
		function checkBranch(startCommit) {
			var check;
			
			var frontLine = $('#timeGraph tr').eq(startCommit-1).children('td:nth-child(2)').text();
			if(frontLine == '/') check = true;
			else check = false;
			
			return check;
		}
		
		function searchBranch(type, startCommit) {
			var countBranch = 0;
			
			if(type == 'area') {
				var endCommit = 0;
				
				for(var i = startCommit-2; i >= 0; i--) {
					var frontLine = $('#timeGraph tr').eq(i).children('td:nth-child(2)').text();
					
					if(frontLine == '/') {
						countBranch++;
					} else if(frontLine == '\\') {
						if(countBranch > 0) {
							countBranch--;
						}else {
							endCommit = i - 1;
							return endCommit;
						}
					}
				}
			} else {
				var branchMap = new Map();
				
				var line = 1;
				branchMap.set(startCommit, line);
				line = line + 1;
				branchMap.set(startCommit-1, line);
				line = line + 1;
				
				for(var i = startCommit-2; i >= 0; i--) {
					var frontLine = $('#timeGraph tr').eq(i).children('td:nth-child(2)').text();
					
					if(frontLine == '/') {
						countBranch++;
						line = line + 1;
						branchMap.set(i, line);
						line = line + 1;
					} else if(frontLine == '\\') {
						if(countBranch > 0) {
							countBranch--;
							line = line - 1;
							branchMap.set(i, line);
							line = line - 1;
						}else {
							line = line - 1;
							branchMap.set(i, line);
							line = line - 1;
							branchMap.set(i-1, line);
							return branchMap;
						}
					} else {
						branchMap.set(i, line);
					}
				}
			}
		}
		
		function settingTimeLine() {
			var mainBranchColor;
			/* var colorArr = ['rgb(255,0,0)', 'rgb(255,94,0)', 'rgb(255,187,0)', 'rgb(255,228,0)', 'rgb(171,242,0)',
				'rgb(0,216,255)', 'rgb(0,84,255)', 'rgb(1,0,255)', 'rgb(95,0,255)', 'rgb(255,0,221)']; */
			var colorArr = ['#ef3f4a', '#f2728b', '#ffd504', '#80b563', '#25aae2', '#49b9ba', '#9d7eb9', '#f89552',
				'#d4e25b', '#7fd3ed', '#aedfdc', '#bcb8dd'];
			
			for(var i in colorArr) {
				colorArr[colorArr.length-1] = colorArr.splice(Math.floor(Math.random()*i),1)[0];
			}
			
			for(var k=$('#timeGraph tr').length-1; k >= 0; k--) {
				var here = $('#timeGraph tr:eq(' + k + ') td:eq(0)');
				var hereInfo = $('#timeGraph tr:eq(' + k + ') td:eq(6)').text();
				
				if(here.text() == '*' && hereInfo != '' && hereInfo.indexOf('Merge') && checkBranch(k)) {
					
					var branchMap = searchBranch('branch', k);
					var color1, color2;
					var range = 715;
					if(colorArr.length > 0) color1 = colorArr.pop();
					else {
						var temp1 = Math.floor(Math.random()*255 + 50);
						var temp2 = Math.floor(Math.random()*255 + 50);
						var temp3 = range - temp1 - temp2;
						color1 = 'rgb(' + temp1 + ',' + temp2 + ',' + temp3 + ')';
					}
					
					if(branchMap.size == 5) {
						if(colorArr.length > 0) color2 = colorArr.pop();
						else {
							var temp1 = Math.floor(Math.random()*255 + 50);
							var temp2 = Math.floor(Math.random()*255 + 50);
							var temp3 = range - temp1 - temp2;
							color2 = 'rgb(' + temp1 + ',' + temp2 + ',' + temp3 + ')';
						}
					}
					
					for(var i = k; i > k - branchMap.size; i--) {
						var value = parseInt(branchMap.get(i)) - 1;
						var target = $('#timeGraph tr:eq(' + i + ') td:eq(' + value + ')');
						//target.addClass('hover-trans hover-bold');
						
						if(branchMap.size == 5 && i == k-3 && target.text() != '*') target.css('color', color2);
						else if(target.text() != '*') target.css('color', color1);
						else continue;
					}
					
					mainBranchColor = color1;
				} else {
					if(here.text() != '*') {
						here.css('color', mainBranchColor);
						//here.addClass('hover-bold hover-bold');
					} else {
						var range = 715;
						if(colorArr.length > 0) mainBranchColor = colorArr.pop();
						else {
							var temp1 = Math.floor(Math.random()*255 + 50);
							var temp2 = Math.floor(Math.random()*255 + 50);
							var temp3 = range - temp1 - temp2;
							mainBranchColor = 'rgb(' + temp1 + ',' + temp2 + ',' + temp3 + ')';
						}
					}
				}
			}
		}
		
	</script>
</body>
</html>