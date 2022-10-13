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


	<jsp:include page="Header.jsp" /> 
 	

		<br><br><br><br>
				<input type="hidden" name="add" value="add">
		<fieldset  class="fl">
	<form action="ColumnAddAction1" method="post"  >
		<div class=" divform">
			<div class="st1 ">
<!-- 			<form action="ColumnAddAction" method="post" > -->
			<legend>新增專欄</legend>
				<label for="" class="t1">發佈時間:</label> <input type="date"
					name="publish_time" id="date">
			</div>
			
			<div class="st1">
				<label for="account1" class="t1">標題:</label> <input type="text"
					id="title" autocomplete="off" name="title"  >
			</div>
			
			<div class="st1">
				<label for="account1" class="t1">使用者編號:</label> <input type="text"
					id="user_id" autocomplete="off" name="user_id" value="48" >
			</div>

			<div class="st1">
				<label for="pwd1" class="t1">作者:</label><input type="text" id="author"
					name="author" >
			</div>

			<div class="st1">
				<label for="" class="t1">權限:</label> <select type="text" name="role" id="role">
					<option value="老師">老師
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
			<br>
			<div width="50px"; height="50px"; class="st1">
				<label class="t1">簡介(50字內):</label>
				<textarea cols="2" rows="2"  type="text" name="summary" id="summary">
			</textarea>
			</div>
			
			
			<div width="50px"; height="50px"; class="st1">
				<label class="t1">內容:</label>
				<textarea id="editor" cols="5" rows="5"  type="text" name="contents">
				<p>I just returned from the greatest summer vacation! It was so fantastic, I never wanted it to end. I spent eight days in Paris, France. My best friends, Henry and Steve, went with me. We had a beautiful hotel room in the Latin Quarter, and it wasn’t even expensive. We had a balcony with a wonderful view.</p>
				<p>We visited many famous tourist places. My favorite was the Louvre, a well-known museum. I was always interested in art, so that was a special treat for me. The museum is so huge, you could spend weeks there. Henry got tired walking around the museum and said “Enough! I need to take a break and rest.”</p>
				<p>We took lots of breaks and sat in cafes along the river Seine. The French food we ate was delicious. The wines were tasty, too. Steve’s favorite part of the vacation was the hotel breakfast. He said he would be happy if he could eat croissants like those forever. We had so much fun that we’re already talking about our next vacation!

				</p>
			</textarea>
			</div>
		</fieldset>
		<center>
		<input type="hidden" name="status" id="status" size="3" title="文章狀態"  value="1">
				<input id="send" type="submit"  value="送出"> 
				</form>
				
			<a href="ColumnTeacherFront">  <button style="border-radius: 10px;  type="submit" name="backToQuery" value="返回">返回</button></a>
			<button type="button" id="correct1" style="border-radius: 10px;background-color: #5CADAD">一鍵輸入</button>
		</center>
		
		<script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/super-build/ckeditor.js"></script>
<script src="jss/ckeditornew.js"></script>	
<script src="howard/columnback.js"></script>


</body>
</html>