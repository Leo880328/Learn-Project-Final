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

    <div class="Div1">
        <form action=ExamReTestSubmit method="post" class="tstfrm">
            <table class="tb" style="border:solid 1px gray;border-radous:20px;">
                <tr class="table-light" style="border:solid 1px gray;">
                    <td style="border:solid 1px gray" colspan="4"><label>考卷名稱:  ${reTestMap.examBean.examName}</label></td>
                </tr>

                <c:forEach items="${reTestMap.examQuList}" var="que" varStatus="loop">
                    <tr class="table-success">
                        <td style="border:solid 1px gray" colspan="4" ><label style="width:900px">${loop.index+1}. ${que.quesContent}:
                        </label>
                        <br><button type="button" onclick="reveal(this,'${que.quesAnswer}')" style="padding-left:0px;padding-right:0px;font-size:15px; height: 40px; width:70px; margin:auto;border-radius:10px">顯示答案</button></td>
                    </tr>

                    <tr class="table-light">
                        <td style="border:solid 1px gray" colspan="2"><label> A. ${que.optA}</label></td>
                        <td style="border:solid 1px gray" colspan="2"><label> B. ${que.optB}</label></td>

                    </tr>
                    <tr class="table-light">
                        <td style="border:solid 1px gray" colspan="2"><label> C. ${que.optC}</label></td>
                        <td style="border:solid 1px gray" colspan="2"><label> D. ${que.optD}</label></td>          
                    </tr>
                </c:forEach>
			
     	</form>
     		   
 				<tr class="table-light" style="border:solid 1px gray">
	                 <td style="text-align: center; border:solid 1px gray;border-radius:10px" colspan="4">
	                 <button type="button" onclick="submit()" value="testSubmit" style="border-radius:10px">testSubmit</button></td>    
            	</tr>
            	
            </table>
    </div>

<script>
	function submit(){
		
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
	
	function reveal(button,ans){
		console.log(button);
		$(button).html(ans);
		
	}
</script>


</body>




</html>