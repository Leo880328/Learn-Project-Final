<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,fourth.bean.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
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
            border-collapse: collapse;
            width: 1000px;
            /*自動斷行*/
            word-wrap: break-word;
            table-layout: fixed;
            background-color: white; 
            border:2px;
   			border-radius: 20px; 
        }

/*         td { */
/*             width: 100px; */
/*             height: 120px; */
/*             border: solid 1px gray; */
/*         } */

/*         th { */
/*             width: 100px; */
/*             height: 50px; */
/*             border: solid 1px gray; */
/*         } */

        tr {
        	border='1';
            text-align: center;
        }
    </style>
</head>


<body>

    <jsp:include page="BackendHeader.jsp" />
    <!-- 選項與CRUD按鈕 -->
    <br>
    <br>
    <br>
    <br>
    <div class="divform">
        <form action="ExamController" method="post">
            <div>
                <label>科目:</label>
                <select name="quSubject" size="1">
                    <option value="數學">數學</option>
                    <option value="英文">英文</option>
                    <option value="國文">國文</option>
                </select>
                <label>程度:
                </label>
                <select name="quEducation" size="1">
                    <option value="國中">國中</option>
                    <option value="高中">高中</option>
                    <option value="成人">成人</option>
                </select>
            </div>
            <div>
                <input type="submit" name="todo" value="query">
                <input type="submit" name="todo" value="queryAll">
                <input type="submit" name="todo" value="upload">
            </div>
            <!-- 表格 -->
            <h2>試卷名稱</h2>
<!--             <table id="data-table" class="table table-bordered" align="center"> -->
				<table  class="tb" align="center" border='1'>
                <thead>
                    <tr>
                        <th>項次</th>
                        <th width="120">圖片</th>
                        <th>科目</th>
                        <th>程度</th>
                        <th>名稱</th>
                        <th>年度</th>
                        <th>出題者</th>
                        <th>難度</th>
                        <th>考試人數</th>
                        <th>平均分數</th>
                        <th>審核狀態</th>
                        <th>刪除</th>
                        <th>更新</th>
                        <th>考試</th>
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
				            <td><img src="<%=examTable.get(i).getExamPic()%>" alt="" title="" width="100"></td>
				            <td><%= examTable.get(i).getSubject().getSubjectName() %></td>
				            <td><%= examTable.get(i).getEducation().getEducationName() %></td>
				            <td><%= examTable.get(i).getExamName() %></td>
				            <td><%= dateToStr %></td>
				            <td><%= examTable.get(i).getMember().getName()%></td>
				            <td><%= examTable.get(i).getDifficulty() %></td>
				            <td><%= examTable.get(i).getTestNumber() %></td>
				            <td><%= examTable.get(i).getAvgScore() %></td>
				            
				            <% if (examTable.get(i).getExamStatus() == 1){ %>
				            	<td>審核完成</td>
				            <% } else {%>
				            	<td><input type="submit" name="todo" value="review"></td>
				            <% } %>
				            
				            <form action="ExamController" method="post">
				                <input type="hidden" name="examID" value="<%= examTable.get(i).getExamID() %>">
				                <input type="hidden" name="subject" value="<%= examTable.get(i).getSubject().getSubjectName() %>">
				                <input type="hidden" name="education" value="<%= examTable.get(i).getEducation().getEducationName() %>">
				                <input type="hidden" name="examName" value="<%= examTable.get(i).getExamName()%>">
				                <input type="hidden" name="examDate" value="<%= dateToStr%>">
				                <input type="hidden" name="examPic" value="<%= examTable.get(i).getExamPic() %>">
				                <td><input type="submit" name="todo" value="delete" onclick="if( !(confirm('確認刪除?') ) ) return false"></td>
				                <td><input type="submit" name="todo" value="update"></td>
				                <td><input type="submit" name="todo" value="test"></td>
				                <button class="btn btn-primary">cc</button>
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