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
    <title><c:out value="${col.title }"></c:out></title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
    <link
        href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,700i&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/chosen.min.css">
    <link rel="stylesheet" href="assets/css/pe-icon-7-stroke.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.min.css">
    <link rel="stylesheet" href="assets/css/lightbox.min.css">
    <link rel="stylesheet" href="assets/js/fancybox/source/jquery.fancybox.css">
    <link rel="stylesheet" href="assets/css/jquery.scrollbar.min.css">
    <link rel="stylesheet" href="assets/css/mobile-menu.css">
    <link rel="stylesheet" href="assets/fonts/flaticon/flaticon.css">
    <link rel="stylesheet" href="assets/css/style.css">
<style>
.btn{
width: 67px;
height:42px;
background-color: #66B3FF;

}
.swal-popup-changeVal{

}
.swal-textarea-1{

}
#deletebtn{
border-radius: 10px;
font-size: 100%
}
#updatesec{
height: 100px;
font-size: 18px;
}
.swal2-popup {
  font-size: 1.5rem !important;
  font-family: Georgia, serif;
}
</style>
</head>

<body class="inblog-page">
<jsp:include page="Header.jsp" />

    <div class="header-device-mobile">
        <div class="wapper">
            <div class="item mobile-logo">
                <div class="logo"><a href="#"><img src="assets/images/logo.png" alt="img"></a></div>
            </div>
            <div class="item item mobile-search-box has-sub"><a href="#"><span class="icon"><i class="fa fa-search"
                            aria-hidden="true"></i></span></a>
                <div class="block-sub"><a href="#" class="close"><i class="fa fa-times" aria-hidden="true"></i></a>
                    <div class="header-searchform-box">
                        <form class="header-searchform">
                            <div class="searchform-wrap"><input type="text" class="search-input"
                                    placeholder="Enter keywords to search..."><input type="submit" class="submit button"
                                    value="Search"></div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="item mobile-settings-box has-sub"><a href="#"><span class="icon"><i class="fa fa-cog"
                            aria-hidden="true"></i></span></a>
                <div class="block-sub"><a href="#" class="close"><i class="fa fa-times" aria-hidden="true"></i></a>
                    <div class="block-sub-item">
                        <h5 class="block-item-title">Currency</h5>
                        <form class="currency-form teamo-language">
                            <ul class="teamo-language-wrap">
                                <li class="active"><a href="#"><span>English(USD) </span></a></li>
                                <li><a href="#"><span>French(EUR) </span></a></li>
                                <li><a href="#"><span>Japanese(JPY) </span></a></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
            <div class="item menu-bar"><a class=" mobile-navigation  menu-toggle"
                    href="#"><span></span><span></span><span></span></a></div>
        </div>
    </div>
    <div class="main-content main-content-blog single left-sidebar">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-trail breadcrumbs">
                        <ul class="trail-items breadcrumb">
                            <li class="trail-item trail-begin"><a href="#">首頁</a></li>
                            <li class="trail-item"><a href="ColumnFrontEnd">專欄</a></li>
                            <li class="trail-item trail-end active"><c:out value="${col.title }"></c:out></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="content-area content-blog col-lg-9 col-md-8 col-sm-12 col-xs-12">
                    <div class="site-main">
                        <div class="post-item">
                            <div class="post-format"  ><a href="#"><img src="<c:out value="${col.picture }"></c:out>  "alt="img"></a></div>
                            <div class="post-infor">
                                <div class="category-blog"><a href="#"><c:out value="${col.subject }"></c:out></a></div>
                                <h3 class="post-title"><a href="#"><c:out value="${col.title }"></c:out></a></h3>
                                <div class="main-info-post">
                                    <p>${col.contents }</p>
                                    
                                    <blockquote>
                                        <p>加入好學生，學習好棒棒 </p>
                                        <div class="author"><span class="name">Winnie</span><span
                                                class="desc">Creative Writer </span></div>
                                    </blockquote>
                                </div>
                            </div>
                        </div>
    
<!--     留言板                     -->
                        <div class="comments-area" >
                            <h3 >留言區 <span class="count"></span></h3>
                            
                            <form action="insert" class="comment-form" method="post">
                            <input type="hidden" name="article_no" value="${col.article_no }"> 
                                <p class="comment-reply-content"><textarea rows="5" placeholder="Write your comment"
                                        class="input-form"  name="comments" ></textarea></p>
                                <p class="form-submit"><span class="controll"><button class="submit button  postacomment">貼文</button></span></p>
                            </form>
 										 

					<c:forEach var="c" items="${all}">		
                            <ul class="comment-list">
                                <li class="comment">
                                    <div class="comment-item">
                                        <div class="author-view">
                                            <div class="author">
<!--                                                 <div class="avt"><img src="assets/images/avt-blog1.png" alt="img"></div> -->
                                                <h4><c:out value="${c.author}"></c:out></h4>
                                            </div>
                                            <div class="date-reply-comment"><span class="date-comment"><c:out value="${c.time}"></c:out>
                                                </span></div>
                                        </div>
                                        <div class="comment-body">
                                            <div class="comment-content">
                                                <div id="updatesec" class="updatearea${c.commentid }">${c.comments}
                                                </div>
                                            </div>
                                            <div class="comment-reply-link"><span class="Comment"><i
                                                        class="icon fa fa-commenting" aria-hidden="true"></i>Comment
                                                </span>
                                                
                                                	<form action="updatecomment?commentid=<c:out value="${c.commentid }"></c:out>" method="post">
                                                         <input type="hidden" name="article_no" value="${col.article_no }"> 
                                                         </form>
                                                         
         
                                                        <c:if test="${sessionScope.user.userId == c.user_id}"> 
                                                         <button class="btn" style="color:white; border-radius: 10px" onclick="changeVal('${c.commentid }')" >編輯</button>
                                                                                             
                                                         <form action="deletecomment?commentid=<c:out value="${c.commentid }"></c:out>" method="post">
                                                         <input type="hidden" name="article_no" value="${col.article_no }"> 
                                                         <button id="deletebtn">刪除</button>
                                                        </form>
                                                       
                                                        </c:if>
                                                      
                             
                                            </div>
                                        </div>
                                    </div>                            
                                </li>
                            </ul>
					</c:forEach>		
                        </div>
	 

                        <div class="view-share">
                            <div class="author-view">
                                <div class="author">
                                    <div class="avt" ><img src="assets/images/avt-blog1.png" alt="img"></div>
                                    <h3 class="name">Winnie </h3>
                                </div>
                                <div class="review">
                                    <div class="view"><span class="icon-view"><i class="fa fa-eye"
                                                aria-hidden="true"></i></span><span class="count">631 </span></div>
                                    <div class="s-comments"><span class="icon-cmt"><i class="fa fa-commenting"
                                                aria-hidden="true"></i></span><span class="count">82 </span></div>
                                </div>
                            </div>
                            <div class="share">
                                <h3 class="title">share</h3><i class="icon fa fa-facebook-square"
                                    aria-hidden="true"></i><i class="icon fa fa-linkedin" aria-hidden="true"></i><i
                                    class="icon fa fa-twitter" aria-hidden="true"></i>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="sidebar sidebar-single-blog col-lg-3 col-md-4 col-sm-12 col-xs-12">
                    <div class="wrapper-sidebar">
                        <div class="widget widget-socials">
                            <h3 class="widgettitle">Follow us </h3>
                            <div class="content-socials">
                                <div class="social-list"><a href="#" target="_blank" class="social-item"><i
                                            class="fa fa-facebook-square" aria-hidden="true"></i></a><a href="#"
                                        target="_blank" class="social-item"><i class="fa fa-twitter"
                                            aria-hidden="true"></i></a><a href="#" target="_blank"
                                        class="social-item"><i class="fa fa-instagram" aria-hidden="true"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer style7">
        <div class="container">
            <div class="container-wapper">
                <div class="row">
                    <div class="box-footer col-xs-12 col-sm-4 col-md-4 col-lg-4 hidden-sm hidden-md hidden-lg">
                        <div class="teamo-newsletter style1">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="assets/js/jquery-1.12.4.min.js"></script>
    <script src="assets/js/jquery.plugin-countdown.min.js"></script>
    <script src="assets/js/jquery-countdown.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/magnific-popup.min.js"></script>
    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/jquery.scrollbar.min.js"></script>
    <script src="assets/js/jquery-ui.min.js"></script>
    <script src="assets/js/mobile-menu.js"></script>
    <script src="assets/js/chosen.min.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/jquery.elevateZoom.min.js"></script>
    <script src="assets/js/jquery.actual.min.js"></script>
    <script src="assets/js/fancybox/source/jquery.fancybox.js"></script>
    <script src="assets/js/lightbox.min.js"></script>
    <script src="assets/js/owl.thumbs.min.js"></script>
    <script src="assets/js/jquery.scrollbar.min.js"></script>
    <script src='http://www.google.cn/maps/api/js?key=AIzaSyC3nDHy1dARR-Pa_2jjPCjvsOR4bcILYsM'></script>
    <script src="assets/js/frontend-plugin.js"></script>
    <script src="howard/columnback.js"></script>
</body>

</html>