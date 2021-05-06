<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			overflow: auto;
		}
		
		
		/* &도움말 */
		#helpBtn {
			position: fixed;
			right: 2vw;
			bottom: 2vw;
			width: 2vw;
			height: 2vw;
			background-color: var(--mainwhite);
			border-radius: 50%;
			z-index: 3;
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
			z-index: 3;
			transition: visibility 0s linear 0.35s, opacity 0.35s 0s, transform 0.35s;
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
		
		
		/* &내용 */
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
			width: 85%;
			white-space: nowrap;
			border-spacing: 0px;
		}
		
		#timeGraph td{
			padding: 0;
			margin: 0;
			text-align: center;
		}
		
		#timeGraph td:nth-child(1), #timeGraph td:nth-child(2), #timeGraph td:nth-child(3), #timeGraph td:nth-child(4), #timeGraph td:nth-child(5){
			/* width: 2%; */
			font-size: 1.2vw;
		}
		
		#timeGraph td:nth-child(1){
			padding-left: 2%;
		}
		
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
			/* background-color: rgba(0, 0, 0, 0.125); */
			/* background-color: rgba(144, 152, 165, 0.35); */
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
			line-height: 2;
			border: 2px var(--lightgray) solid;
			color: var(--lightgray);
			border-radius: 2vw;
			padding-left: 2%;
			padding-right: 2%;
			margin-right: 1%;
			font-size: 0.9vw;
			cursor: pointer;
		}
		
		.click{
			color: var(--mainwhite);
			border: 2px var(--mainwhite) solid;
			transition: all ease 0.35s;
		}
		
		.looked{
			color: #4e4e4e;
			border: 2px #4e4e4e solid;
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
			overflow: scroll;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background-color: var(--mainwhite);
			color: var(--mainblack);
			padding: 4rem 3rem;
			width: 65%;
			
			height: auto;
			transition: all ease 0.35s;
			/* height: 70vh; */
			/* border-radius: 0.5rem; */
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
			padding-left: 0.8%;
			padding-right: 0.8%;
			margin-left: 1%;
			font-weight: bold;
			font-size: 0.73vw;
		}
		
		.pl-tag{
			border: 0.18vw var(--maingray) solid;
			color: var(--maingray);
		}
		.tp-tag{
			border: 0.18vw var(--maingray) solid;
			background-color: var(--maingray);
			color: var(--mainwhite);
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
		
	</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
	<div id="helpDiv"></div>
	<div id="helpBtn"><span><i class="fas fa-question fa"></i></span></div>
	
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
			  		<div class="language">#ASP</div>
			  		<div class="language">#C</div>
			  		<div class="language">#C#</div>
			  		<div class="language">#C++</div>
			  		<div class="language">#CSS</div>
			  		<div class="language">#Database</div>
			  		<div class="language">#Git</div>
			  		<div class="language">#HTML</div>
			  		<div class="language">#Illustrator</div>
			  		<div class="language">#Java</div>
			  		<div class="language">#JavaScript</div>
			  		<div class="language">#MFC</div>
			  		<div class="language">#Photoshop</div>
			  		<div class="language">#Spring</div>
			  		<div class="language">#Unity</div>
			  		<div class="language">#Unix</div>
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
		
		$(window).on('scroll', function() {
			var scrollPercent = ($(window).scrollTop() / ($(document).outerHeight() - $(window).height()))*10;
			var transSize = 43 + (scrollPercent*1.5)
			$('.bg-circle').css({'width': transSize + '%', 'padding-bottom': transSize + '%'});
		});
		//참고 : https://tyle.io/blog/61
		
		$(function() {
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
									var tag = txt[1].split('(');
									
									appendCode = '<tr class="headTr hover-trans"><td style="text-align: center;">' + txt[0].slice(2) + '</td>';
									appendCode = appendCode + '<td>' + tag[0];
									
									if(tag.length > 1) {
										for(var i = 1; i < tag.length; i++) {
											var contxt = tag[i].substring(0, tag[i].length-1);
											var tagType;
											if(contxt != 'Front' && contxt != 'Back') tagType = 'small-tag pl-tag';
											else tagType = 'small-tag tp-tag';
											appendCode = appendCode + '<div class="' + tagType + '">' + tag[i].substring(0, tag[i].length-1) + '</div>';
										}
									}
									
									appendCode = appendCode + '</td></tr>';
									$('#mTable').append(appendCode);
								} else if(triger == 1) {
									if(contxtArr[i].substr(0,1) == '>') {
										$('#mTable').append('<tr class="hidTr hidden"><td colspan="2">' + contxtArr[i].slice(2) + '</td></tr>');
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
				
				document.querySelector(".modal").classList.toggle("show-modal");
			}
			
			function windowOnClick(event) { if(event.target === document.querySelector(".modal")) toggleModal(); }
			document.querySelector(".close-modal").addEventListener("click", toggleModal);
			window.addEventListener("click", windowOnClick);
			
			$('.language').click(function() {
				var language = $(this).parent();
				
				for(var i=0; i < language.children().length; i++) {
					if(language.children(':eq('+ i + ')').hasClass('click') == true && $(this).index() != i) {
						language.children(':eq('+ i + ')').removeClass('click');
						language.children(':eq('+ i + ')').addClass('looked');
						break;
					}
				}
				//자식 노트 찾기 참고 : https://m.blog.naver.com/PostView.nhn?blogId=kimnx9006&logNo=220586673921&proxyReferer=https:%2F%2Fwww.google.com%2F
				
				clickLanguage = $(this).text().slice(1);
				toggleModal('click');
				if($(this).hasClass('looked') == true) $(this).removeClass('looked');
				$(this).addClass('click');
			});
			
			$('.close-modal').mouseenter(function() {
				$('.close-modal i').attr('class', 'fas fa-times-circle');
			}).mouseleave(function() {
				$('.close-modal i').attr('class', 'far fa-times-circle');
			});
			
			var clickModal = 99999;
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
							$(this).parent().children('tr:eq(' + clickModal + ')').removeClass('hover-color-black');
							modalEvent('close', $(this));
						}
						//클릭한 tr의 내용을 보여줌
						clickModal = $(this).index();
						modalEvent('open', $(this));
					//클릭했던 tr일 때
					} else {
						//tr의 bgcolor를 돌려놓고 내용을 숨김
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
				
				//console.log($('.modal-content').innerHeight() + ' / ' + window.outerHeight*0.65);
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
			
			$('#helpBtn').mouseenter(function() {
				$(this).css('transform', 'scale(1.6)');
			}).mouseleave(function() {
				$(this).css('transform', 'scale(1.2)');
			}).click(function() {
				$('#helpDiv').addClass('show-modal');
			});
			
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
				
				$('#timeGraph').append('<tr class="hover-trans"><td>' + tdArr[0] + '</td><td>' + tdArr[1] + '</td><td>' + tdArr[2] + '</td><td>' + tdArr[3] + '</td><td>' + tdArr[4] + '</td><td>'
						+ tableArr[1] + '</td><td>' + tableArr[2] + '</td></tr>');
			}
			
			settingTimeLine();
			
			//hoverTr[0] : 가지의 시작 (초기값 99999), hoverTr[1] : 가지의 끝
			var hoverTr = [99999, 0];
			//hover된 가지의 색을 담는 배열
			var hoverColor = [];
			$('#timeGraph tr td:nth-last-child(1)').mouseenter(function() {
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
			//참고 : https://m.blog.naver.com/PostView.nhn?blogId=interbirds&logNo=220120122658&proxyReferer=https:%2F%2Fwww.google.com%2F
			
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
			var colorArr = ['rgb(255,0,0)', 'rgb(255,94,0)', 'rgb(255,187,0)', 'rgb(255,228,0)', 'rgb(171,242,0)',
				'rgb(0,216,255)', 'rgb(0,84,255)', 'rgb(1,0,255)', 'rgb(95,0,255)', 'rgb(255,0,221)'];
			for(var i in colorArr) {
				colorArr[colorArr.length-1] = colorArr.splice(Math.floor(Math.random()*i),1)[0];
			}
			
			for(var k=$('#timeGraph tr').length-1; k >= 0; k--) {
				var here = $('#timeGraph tr:eq(' + k + ') td:eq(0)');
				var hereInfo = $('#timeGraph tr:eq(' + k + ') td:eq(6)').text();
				
				if(here.text() == '*' && hereInfo != '' && hereInfo.indexOf('Merge') && checkBranch(k)) {
					var branchMap = searchBranch('branch', k);
					var color1, color2;
					if(colorArr.length > 0) color1 = colorArr.pop();
					else color1 = 'rgb(' + Math.floor(Math.random()*220 + 30) + ',' + Math.floor(Math.random()*220 + 30) + ',' + Math.floor(Math.random()*220 + 30) + ')';
					
					if(branchMap.size == 5) {
						if(colorArr.length > 0) color2 = colorArr.pop();
						else color2 = 'rgb(' + Math.floor(Math.random()*220 + 30) + ',' + Math.floor(Math.random()*220 + 30) + ',' + Math.floor(Math.random()*220 + 30) + ')';
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
						if(colorArr.length > 0) mainBranchColor = colorArr.pop();
						else mainBranchColor = 'rgb(' + Math.floor(Math.random()*220 + 30) + ',' + Math.floor(Math.random()*220 + 30) + ',' + Math.floor(Math.random()*220 + 30) + ')';
					}
				}
			}
		}
		
	</script>
</body>
</html>