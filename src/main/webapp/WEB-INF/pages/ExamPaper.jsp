<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,fourth.bean.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
    <style>
        .divform {

            width: 1000px;
            margin: auto;
        }

        .tb {
/*             border: solid 3px gray; */
/*             border-collapse: collapse; */
            width: 1000px;
            word-wrap: break-word;
            table-layout: fixed;
            margin: auto;
        }
    </style>
</head>

<body>
    <jsp:include page="Header.jsp" />


    <div>
        <form action="ExamController" method="post">
            <table class="tb">
                <tr>
                    <td><label>考卷名稱:</label></td>
                </tr>

                <c:forEach items="${testMap.examQueList}" var="que" varStatus="loop">
                    <tr>
                        <td colspan="4"><label>${loop.index+1}${que.quesContent}:</label></td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="answer${loop.index}" id="" value="A" required>A.${que.optA}</td>
                        <td><input type="radio" name="answer${loop.index}" id="" value="B">B.${que.optB}</td>
                        <td><input type="radio" name="answer${loop.index}" id="" value="C">C.${que.optC}</td>
                        <td><input type="radio" name="answer${loop.index}" id="" value="D">D.${que.optD}</td>
                    </tr>
                </c:forEach>
			</table>
 

            <div style="margin:auto; height:42px;width:120px;">
                 <button  type="submit" name="todo" value="testSubmit">testSubmit</button>
            </div>
   

                
            
        </form>
    </div>

</body>


</html>