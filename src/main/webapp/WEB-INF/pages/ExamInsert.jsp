<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,fourth.bean.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
    <style>
        .tb{
        	
	        cellspacing: 2  ;
	        cellpadding: 1  ;
	        border: solid 2px gray; 
            width: 800px;
            margin: auto;
        }
        
       .divform{
    		
    		width: 800px;
    		margin:auto;
    	}
    	
    	.alert {
            color: red;
        }
    	
    	.prevw{
    		text-align:center;
    		margin:auto;
    	}
    	
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>


		<jsp:include page="Header.jsp" />

	

    <form action="examInsert" method="post" enctype="multipart/form-data" onsubmit="return check()">
    
        <table class="tb">
     	     <colgroup>
                <col width="20.00%">
                <col width="80.00%">
            </colgroup>
            <tr>
                <td><label>考卷名稱:</label></td>
                <td><input type="text" name="examName" id="examName" size="10" maxlength="10"><span class="alert" id="spExamName"></span></td>
            </tr>
            <tr>
                <td><label>考卷科目:</label></td>
                <td><select name="subject" size="1">
                        <option value="數學">數學</option>
                        <option value="英文">英文</option>
                        <option value="國文">國文</option>
                    </select></td>
            </tr>
            <tr>
               <td><label>考卷程度:</label></td>
               <td><select name="education" size="1">
                        <option value="國中">國中</option>
                        <option value="高中">高中</option>
                        <option value="成人">成人</option>
                    </select></td>
            </tr>
            <tr>
                <td><label>難易度:</label></td>
                <td><select name="difficulty" size="1">
                        <option value="簡單">簡單</option>
                        <option value="中等">中等</option>
                        <option value="困難">困難</option>
                    </select></td>
            </tr>
            <tr>
                <td><label>考卷題數:</label></td>
                <td><input type="text" name="quNumber" id="quNumber" size="3" maxlength="10" onchange="create(this.value)"><span class="alert" id="spQuNumber"></span></td>
            </tr>
            <tr>
                <td><label>日期:</label></td>
                <td><input type="date" name="examDate" id="examDate"><span class="alert" id="spExamDate"></span></td>
            </tr>
            <tr>
                <td><label>圖片:</label></td>
                <td><input style="display:inline;width:200px;" type="file" name="myfile" id="pictureInput"><span class="alert" id="spExamPic"></span></td>
            </tr>
            <tr>
            	<td style=" margin:auto;text-align:center">
	            		<img  class="prevw" id="preview_pictureInput_img" src="" />
            	</td>
            </tr>

            <tr>
<!--                <td><button type="submit" value="insert" onclick="check()">insert</td> -->
               <td style="text-align:center" colspan="2">
               		<button type="submit" value="insert" onclick="check()">insert</button>
               		<button type="button" value="insert" onclick="inertData()">一鍵輸入</button>
               </td>		
<!--                <<button type="button" value="insert" onclick="wrongData()">一鍵錯誤</td> -->
           </tr>
           
        </table>
        <br><br>
        
        <div id="quArea">
        
        
        
        
        </div>
        
           
    </form>
    
	
	<script src="kai/inserttable.js"></script>
	<script src="kai/imgPreview.js"></script>
	<script src="kai/ExamFrontCheck.js"></script>
	<script src="kai/oneClick.js"></script>

</body>
</html>