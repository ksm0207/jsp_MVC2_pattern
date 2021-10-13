<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- summer note -->
<link rel="stylesheet" href="./css/summernote-lite.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="./js/summernote-lite.js"></script>
<script src="./js/lang/summernote-ko-KR.js"></script>
<!-- end -->

<style type="text/css">
	#bbs table {
	    width:580px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
		
</style>
<script type="text/javascript">
	function sendData(){
		
		let title = document.getElementById('title').value;
		let writer = document.getElementById('writer').value;
		let content = document.getElementById('content').value;
		let file = document.getElementById('file').value;
		
		if(title.trim().length < 1){
			alert('제목을 입력하세요.');
			return false;
		}
		
		if(writer.trim().length < 1){
			alert('이름을 입력하세요.');
			return false;
		}
		
		if(content.trim().length < 1){
			alert('내용을 입력하세요.');
			return false;
		}
		
		if(file.trim().length < 1){
			alert('파일을 첨부하세요.');
			return false;
		}
		
		console.log("타이틀 : "+ title);
		console.log("작성자 : " + writer);
		console.log("내용 : " + content);
		console.log("파일 :" + file);
		
		
		/*
		for(var i=0 ; i<document.forms[0].elements.length ; i++){
			if(document.forms[0].elements[i].value == ""){
				alert(document.forms[0].elements[i].name+
						"를 입력하세요");
				document.forms[0].elements[i].focus();
				return;//수행 중단
			}
		}
	   */
	   
//		document.forms[0].action = "test.jsp";
		document.forms[0].submit();
	}
</script>
</head>
<body>
	<div id="bbs">
	
	<form action="Controller?type=write" method="post" 
	encType="multipart/form-data">
		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input type="text" id="title" name="title" size="45"/></td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><input id="writer" type="text" name="writer" size="12"/></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><textarea id="content" name="content" cols="50" 
							rows="8"></textarea></td>
				</tr>
				<tr>
					<th>첨부파일:</th>
					<td><input type="file" id="file" name="file"/></td>
				</tr>
	
				<tr>
				<th>비밀번호:</th>
					<td><input type="password" name="pwd" size="12"/></td>
				<tr>
					<td colspan="2">
						<input type="button" value="보내기"
						onclick="sendData()"/>
						<input type="button" value="다시"/>
						<input type="button" value="목록" onclick="goList();"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<script>
		function goList(){
			
			location.href='list.jsp';
			
		}
		$(function(){
			$("#content").summernote({
				lang: "ko-KR",
				width:500,
				height:200,
				minHeight:200,
				maxHeight:400,
				callbacks:{
					onImageUpload: function(files,editor){
						// callbacks : 이미지가 에디터에 추가될 때마다 수행하는영역
						// 추가되어 들어온 이미지는 배열로 되어있음 !
						for(var i=0; i<files.length; i++){
							sendImage(files[i], editor);
						}
					}
					
				}
			});
			$("#content").summernote("lineHeight",.7);
		});
		
		function sendImage(file,editor){
			
			let frm = new FormData();
			
			
			// 보내고자 하는 데이터를 위해 Form 객체에 파라미터로 넣어주도록 하자.
			frm.append("file",file);
			console.log(frm);
			// ajax
			
			$.ajax({
				url : "saveImage.jsp",
				data : frm,
				type: "POST",
				dataType: "json",
				contentType : false,
				processData : false,
				 // 서버로부터 받을 데이터 형식 => Json
			})
			.done(function(data){
				alert("success");
				$("#content").summernote("editor.insertImage",data.url);
			})
			.fail(function(error){
				alert(error);
			});
		}
		
	</script>
</body>
</html>