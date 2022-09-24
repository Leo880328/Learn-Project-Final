<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"
	import="java.util.*,fourth.bean.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
<!DOCTYPE html>
<html>

<head>
    <title>Insert title here</title>
    <style>
        .divform {

            width: 700px;
            margin: auto;
        }

        .tb {
            border: solid 2px black;
            border-collapse: collapse;
            width: 1000px;
            /*自動斷行*/
            word-wrap: break-word;
            table-layout: fixed;
        }

        td {
            width: 100px;
            height: 120px;
            border: solid 1px gray;
        }

        th {
            width: 100px;
            height: 50px;
            border: solid 1px gray;
        }

        tr {
            text-align: center;
        }
    </style>
</head>


<body>

    <jsp:include page="Header.jsp" />
    <!-- 選項與CRUD按鈕 -->

    <div class="divform">
        <form action="ExamController" method="post">
            <div>
                <input type="submit" name="todo" value="query"> 考卷
                <input type="submit" name="todo" value="queryAll"> 錯題
            </div>
            
            <!-- 表格 -->
            <h2>考試天地</h2>
            <table class="tb" align="center">
                <thead>
                    <tr>
                        <th>項次</th>
                        <th>圖片</th>
                        <th>科目</th>
                        <th>程度</th>
                        <th>名稱</th>
                        <th>年度</th>
                    </tr>
                </thead>

                <% List<ExamBean> examTable = (List<ExamBean>) request.getAttribute("examTable");
                        if (examTable != null && examTable.size() > 0) {
                        for (int i = 0; i < examTable.size(); i++) { DateFormat dateFormat=new
                            SimpleDateFormat("yyyy-MM-dd"); Date date=new Date(); String
                            dateToStr=dateFormat.format(examTable.get(i).getExamdate()); %>
				<tbody>
				    <tr>
				        <%-- <td><input type="checkbox" name="examTableIndex" value="<%= i %>"></td> --%>
				            <td><%= i+1 %></td>
				            <td><img src="<%=examTable.get(i).getExamPic()%>" alt="" title="" width="80"></td>
				            <td><%= examTable.get(i).getSubject().getSubjectName() %></td>
				            <td><%= examTable.get(i).getEducation().getEducationName() %></td>
				            <td><%= examTable.get(i).getExamName() %></td>
				            <td><%= dateToStr %></td>
				            <form action="ExamController" method="post">
				                <input type="hidden" name="examID" value="<%= examTable.get(i).getExamID() %>">
				                <input type="hidden" name="subject" value="<%= examTable.get(i).getSubject().getSubjectName() %>">
				                <input type="hidden" name="education" value="<%= examTable.get(i).getEducation().getEducationName() %>">
				                <input type="hidden" name="examName" value="<%= examTable.get(i).getExamName()%>">
				                <input type="hidden" name="examDate" value="<%= dateToStr%>">
				                <input type="hidden" name="examPic" value="<%= examTable.get(i).getExamPic() %>">
				            </form>
				    </tr>
				</tbody>

                <% } // for loop %>

               	<% } // if %>
            </table>

        </form>
    </div>
</body>

</html>