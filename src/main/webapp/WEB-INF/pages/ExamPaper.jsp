<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,fourth.bean.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
    <style>

        .tb {
			   
/*             word-wrap: break-word; */
/*             table-layout: fixed; */
/*             background-color: #FFFFFF; */
               
/*                border:  solid 1.0px gray;  */
/*                border-radius: 20px; */
        }
        
        td{
/*         	border: 1px solid gray; */
        }
        
        .test{
/*         	border-top:solid 1px gray; */
/*         	border-left: solid 1px gray; */
/*         	border-right:solid 1px gray; */
        
        }
        
        .tbbor .tbb{
         	border-top:solid 1px gray; 
        }
/*         style="border:solid 1px gray" */
        
        .Div1{
        
 	        width: 1020px; 
 	        margin: auto; 
 	       	padding:10px;
	        background-color: #F5F5F5;
			border-radius:20px;
        }
    </style>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
    integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

</head>

<body>
    <jsp:include page="Header.jsp" />
	<br>
    <div class="Div1">
        <form action=ExamTestSubmit method="post" class="tstfrm">
            <table class="tb" style="border:solid 1px gray;border-radous:20px;">
                <tr class="table-light" style="border:solid 1px gray">
                    <td style="border:solid 1px gray" colspan="4"><label>考卷名稱:  ${testMap.examName}</label></td>
                </tr>

                <c:forEach items="${testMap.examQueList}" var="que" varStatus="loop">
                    <tr class="table-success">
                        <td style="border:solid 1px gray" colspan="4" >${loop.index+1}. ${que.quesContent}:</td>
                    </tr>
                    <tr class="table-light">
                        <td style="border:solid 1px gray" colspan="2"><input type="radio" name="answer${loop.index}" id="" value="A" required> A. ${que.optA}</td>
                        <td style="border:solid 1px gray" colspan="2"><input type="radio" name="answer${loop.index}" id="" value="B"> B. ${que.optB}</td>

                    </tr>
                    <tr class="table-light">
                        <td style="border:solid 1px gray" colspan="2"><input type="radio" name="answer${loop.index}" id="" value="C"> C. ${que.optC}</td>
                        <td style="border:solid 1px gray" colspan="2"><input type="radio" name="answer${loop.index}" id="" value="D"> D. ${que.optD}</td>          
                    </tr>
                </c:forEach>
			
     	</form>
     		   
 				<tr class="table-light" style="border:solid 1px gray">
	                 <td style="text-align: center; border:solid 1px gray;border-radius:10px" colspan="4">
	                 <button type="button" onclick="update()" value="testSubmit" style="border-radius:10px">testSubmit</button></td>    
            	</tr>
            	
            </table>
    </div>

<script>
	function update(){
		
	    Swal.fire({
	        title: '確認交卷?"',
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
					title: '送出成功 !',
					willClose: function () {
						$('.tstfrm').submit();
					}
				})
	        }
	    })
		
		
	}
</script>


</body>




</html>