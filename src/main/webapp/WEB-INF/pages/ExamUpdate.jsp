<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,fourth.bean.*" %>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
    <style>
        .tb{
        	
	        cellspacing: 2  ;
	        cellpadding: 1  ;
/* 	        border: solid 3px gray; */
            width: 1000px;
            margin: auto;
        }
        
       .divform{
    		
    		width: 1000px;
    		margin:auto;
    	}
    	
    	.alert {
            color: red;
        }
    	
    	
    </style>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	
	
	<script>
	
	$(function () {
		
    var subIdx = "${sessionScope.upBean.subject.subjectId}" - 1;

    var eduIdx = "${sessionScope.upBean.education.educationId}" - 1;

    var diffArray = ["簡單", "中等", "困難"];
    var diffIdx = diffArray.indexOf("${sessionScope.upBean.difficulty}")

    var oselSub = document.getElementById("choSub"); //得到select的ID
    var optsSub = oselSub.getElementsByTagName("option");//得到陣列option
    optsSub[subIdx].selected = true;

    var oselEdu = document.getElementById("choEdu"); //得到select的ID
    var optsEdu = oselEdu.getElementsByTagName("option");//得到陣列option
    optsEdu[eduIdx].selected = true;

    var oselDiff = document.getElementById("choDiff"); //得到select的ID
    var optsDiff = oselDiff.getElementsByTagName("option");//得到陣列option
    optsDiff[diffIdx].selected = true;




	});
	</script>
	
</head>


<body>

	<jsp:include page="Header.jsp"/>
	<br>
    <form class="upfrm" action="examUpdateConfirm" method="post" enctype="multipart/form-data">
    
        <table class="tb">
            <tr>
                <td><label>考卷名稱:</label></td>
                <td><input type="text" name="examName" id="name" size="20" maxlength="20" value="${upBean.examName}"><span class="alert" id="spExamName"></span></td>
            </tr>
            <tr>
                <td><label>考卷科目:</label></td>
                <td><select id="choSub" name="subject" size="1">
                        <option value="數學">數學</option>
                        <option value="英文">英文</option>
                        <option value="國文">國文</option>
                    </select></td>
            </tr>
            <tr>
               <td><label>考卷程度:</label></td>
               <td><select id="choEdu" name="education" size="1">
                        <option value="國中">國中</option>
                        <option value="高中">高中</option>
                        <option value="成人">成人</option>
                    </select></td>
            </tr>
            <tr>
                <td><label>難易度:</label></td>
                <td><select id="choDiff" name="difficulty" size="1">
                        <option value="簡單">簡單</option>
                        <option value="中等">中等</option>
                        <option value="困難">困難</option>
                    </select></td>
            </tr>
            <tr>
                <td><label>考卷題數:</label></td>
                <td><input type="text" name="quNumber" id="" size="3" maxlength="10" value="${examQuesNum}"></td>
            </tr>
            <tr>
                <td><label>日期:</label></td>
                <td><input type="date" name="examDate" id="examDate" value="${upBean.stringDate}"><span class="alert" id="spExamDate" ></span></td>
            </tr>
            <tr>
            	<td><label>審查狀態:</label></td>
            	<td><select id="choReview" name="review" size="1">
                        <option ${upBean.examStatus== 0 ?"selected":""} value="0">未通過</option>
                        <option ${upBean.examStatus== 1 ?"selected":""} value="1">通過</option>
                    </select></td>
            </tr>
            <tr>
<%-- <%--                 <td><img src="${upBean.examPic}" id ="img" alt="" title="" width="200" height="150"> --%>
<%-- 			    <td><img src="${upBean.examPic}" id ="img" alt="" title="" width="200" height="150"> --%>
<%-- 			    <input id="imgPath" type="hidden" name="myfile" title="考卷封面圖片" value="${upBean.examPic}"> --%>
<!-- 			    <input onchange="previewImg(this)" type="file" title="考卷封面圖片"></td> -->
<%-- 				<td><img src="${upBean.examPic}" id ="img" alt="" title="" width="200" height="150"> --%>
   				<td><input style="width:300px" type="file" name="myfile" id="pictureInput" value="${upBean.examPic}"></td>
   				<td><img id="preview_pictureInput_img" src="${upBean.examPic}" /></td>
            </tr>
            
        </table>
        
        <div id="quArea">
        	<br><br>
			<c:forEach items="${examQues}" var="que" varStatus="loop">
				<table class="tb">
						<tbody>
							<tr>
								<td colspan='6'>題目內容:</td>
								<td><input type="hidden" name="examQuId" value="${que.quesID}"></td>
							</tr>
							<tr>
								<td colspan='6'><textarea name="content" cols='100' rows='10'>${que.quesContent}</textarea></td>
							</tr>
							<tr>
								<td rowspan='2'>選項文字:</td>
								<td>A:<input type='text' name="optA" size='40' value="${que.optA}"></td>
								<td>B:<input type='text' name="optB" size='40' value="${que.optB}"></td>
							</tr>
							<tr>
								<td>C:<input type='text' name="optC" size='40' value="${que.optC}"></td>
								<td>D:<input type='text' name="optD" size='40' value="${que.optD}"></td>
							</tr>
							<tr>
								<td colspan='3'>
									<label>答案: 
										<select class="Se"  name='answer' id="D" size='1' style='width: 80px;'>
											<option ${que.quesAnswer=="A"?"selected":""} value='A'>A</option>
											<option ${que.quesAnswer=="B"?"selected":""} value='B'>B</option>
											<option ${que.quesAnswer=="C"?"selected":""} value='C'>C</option>
											<option ${que.quesAnswer=="D"?"selected":""} value='D'>D</option>
										</select>
									</label> 
									
									<label class='test'> 
										配分:<input type='text' name="score" size='10' value="${que.quesScore}">
									</label>
									
								</td>
							</tr>
							<tr>
								<td style='display:none'> ${que.quesID} </td> 
								<td><button type='button' class='del'>Del</button></td>
							</tr>
						</tbody>
				</table>
			</c:forEach>

           	<input type="hidden" name="testNumber" value="${upBean.testNumber}"> 
           	<input type="hidden" name="avgScore" value="${upBean.avgScore}"> 
           	<input type="hidden" name="examId" value="${upBean.examID}"> 
           	<input type="hidden" name="userId" value="${upBean.member.userId}">
		</div>
    </form>
		
     <tr>
         <td colspan="2">
             <center>
                <input type="submit" onclick="update()">
             </center>
         </td>
     </tr>

	<script src="kai/imgPreview.js"></script>
	<script type="text/javascript">

	$('.tb').on('click', '.del', function () {

	    $(this).closest('table').remove();

	    var quId = $(this).parent().prev().text();

	    var params = { "quId":""+ quId }

	    $.ajax({

	        type: 'post',
	        url: 'quDe',
	        data: params,
	        datatype: 'json',
	        success: function (data) {

	        }, error: function (e) {

	        }
	    })

	})
	
	function update(){
		
	    Swal.fire({
	        title: '確認修改考卷?"',
	        text: "",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '確定',
	        cancelButtonText: '取消',
	    }).then((result) => {
	        if (result.isConfirmed) {
				Swal.fire({
					title: '修改完成 ',
					willClose: function () {
						$('.upfrm').submit();
					}
				})
	        }
	    })
		
		
	}
		
	
	</script>
</body>

</html>