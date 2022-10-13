<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add</title>
<style>
.divform{
width:500px;
margin:auto;

}
.ck-editor__editable {
 min-height: 300px;
 /* width: 100%;
            margin: 0 auto; */
}
#send{
border-radius: 10px;
}


</style>

</head>
<body>


	<jsp:include page="BackendHeader.jsp" /> 
 	<jsp:include page="Style.jsp" /> 

		<br><br><br><br>
				<input type="hidden" name="add" value="add">
		<fieldset  class="fl">
	<form action="ColumnAddAction" class="cfi" method="post"  >
		<div class=" divform">
			<div class="st1 ">
<!-- 			<form action="ColumnAddAction" method="post" > -->
			<legend>新增專欄</legend>
				<label for="" class="t1">發佈時間:</label> <input type="date"
					name="publish_time" id="date">
			</div>
			
			<div class="st1">
				<label for="account1" class="t1">標題:</label> <input type="text"
					 autocomplete="off" name="title" id="title" >
			</div>
			
			<div class="st1">
				<label for="account1" class="t1">使用者編號:</label> <input type="text"
					autocomplete="off" name="user_id" id="user_id">
			</div>

			<div class="st1">
				<label for="pwd1" class="t1">作者:</label><input type="text" id="author"
					name="author" >
			</div>

			<div class="st1">
				<label for="" class="t1">權限:</label> <select type="text" name="role" id="role">
					<option value="管理者">管理者			
				</select>
			</div>
			
			<div class="st1">
				<label for="" class="t1">科目:</label> <select type="text" name="subject" id="subject">
					<option value="英文">英文
					<option value="多益">多益
					<option value="數學">數學
				</select>
			</div>
			
			<div>
			<input type="file" name="picture" >
			</div>
			
			<div width="50px"; height="50px"; class="st1">
				<label class="t1">簡介(50字內):</label>
				<textarea cols="2" rows="2"  type="text" name="summary" id="summary">
			</textarea>
			</div>
			
			
			<div width="50px"; height="50px"; class="st1">
				<label class="t1">內容:</label>
				<textarea id="editor" cols="2" rows="2"  type="text" name="contents"  class="contents">
				<p>I live in a house near the mountains. I have two brothers and one sister, and I was born last. My father teaches mathematics, and my mother is a nurse at a big hospital. My brothers are very smart and work hard in school. My sister is a nervous girl, but she is very kind. My grandmother also lives with us. She came from Italy when I was two years old. She has grown old, but she is still very strong. She cooks the best food!

My family is very important to me. We do lots of things together. My brothers and I like to go on long walks in the mountains. My sister likes to cook with my grandmother. On the weekends we all play board games together. We laugh and always have a good time. I love my family very much.</p>
			</textarea>
			</div>
			
			
		</fieldset>
			<input type="hidden" name="status" id="status" size="3" title="文章狀態"  value="3">
				</form>
		<center>
				<button id="send" onclick="checkAdd()" type="submit"  value="送出" >送出</button> 
				
			<a href="QueryAll"> <button style="border-radius: 10px;  type="submit" name="backToQuery" value="返回">返回</button></a>
			 <button type="button" id="correct" style="border-radius: 10px;background-color: #5CADAD">一鍵輸入</button>
		</center>
		
<script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/super-build/ckeditor.js"></script>
<script src="jss/ckeditornew.js"></script>	




<script src="howard/columnback.js"></script>
</body>
</html>