<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><!-- Vendor styles -->
    <base href="<%=request.getContextPath()%>/">
</head>

<body data-ma-theme="green">
<jsp:include page="BackendHeader.jsp" /> 
    <main class="main">
        <section class="content">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">審核活動</h4>
                    <div class="table-responsive" style="
                    padding-bottom: 20px; ">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="45.0%">
                                <col width="30.0%">
                                <col width="15.0%">
                                <col width="10.0%">
                            </colgroup>
                            <thead class="thead-default">
                                <tr>
                                    <th>活動名稱</th>
                                    <th>時間</th>
                                    <th>活動人數</th>
                                    <th>地點</th>
                                </tr>
                            </thead>

                            <tbody class="reviewingActivity">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <script src="ActivityResources/js/ActivityOperator.js"></script>
</body>

</html>