<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.*"%>
<%@page import="fourth.bean.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>

<html lang="en">

<head>
    <title>好學生專欄</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <style>
.post-format {
 width: 400px;
 height: 350px;
}
#pin{
float:right
}
</style>
</head>

<body class="inblog-page">
 <jsp:include page="Header.jsp" />

 <div class="header-device-mobile">
  <div class="wapper">
   <div class="item mobile-logo">
    <div class="logo">
     <a href="#"><img src="assets/images/logo.png" alt="img"></a>
    </div>
   </div>
   <div class="item item mobile-search-box has-sub">
    <a href="#"><span class="icon"><i class="fa fa-search"
      aria-hidden="true"></i></span></a>
    <div class="block-sub">
     <a href="#" class="close"><i class="fa fa-times"
      aria-hidden="true"></i></a>
     <div class="header-searchform-box">
      <form class="header-searchform">
       <div class="searchform-wrap">
        <input type="text" class="search-input"
         placeholder="Enter keywords to search..."><input
         type="submit" class="submit button" value="Search">
       </div>
      </form>
     </div>
    </div>
   </div>
   <div class="item mobile-settings-box has-sub">
    <a href="#"><span class="icon"><i class="fa fa-cog"
      aria-hidden="true"></i></span></a>
    <div class="block-sub">
     <a href="#" class="close"><i class="fa fa-times"
      aria-hidden="true"></i></a>
     <div class="block-sub-item">
      <h5 class="block-item-title">Currency</h5>
      <form class="currency-form teamo-language">
       <ul class="teamo-language-wrap">
        <li class="active"><a href="#"><span>English(USD)
         </span></a></li>
        <li><a href="#"><span>French(EUR) </span></a></li>
        <li><a href="#"><span>Japanese(JPY) </span></a></li>
       </ul>
      </form>
     </div>
    </div>
   </div>
   <div class="item menu-bar">
    <a class=" mobile-navigation  menu-toggle" href="#"><span></span><span></span><span></span></a>
   </div>
  </div>
 </div>
 <div class="main-content main-content-blog list right-sidebar">
  <div class="container">
   <div class="row">
    <div class="col-lg-12">
     <div class="breadcrumb-trail breadcrumbs">
      <ul class="trail-items breadcrumb">
       <!--                             <li class="trail-item trail-begin"><a href="index.html">Home</a></li> -->
       <!--                             <li class="trail-item trail-end active">好學生專欄</li> -->
      </ul>
     </div>
    </div>
   </div>
   <div class="row">
    <div
     class="content-area content-blog col-lg-9 col-md-8 col-sm-12 col-xs-12">
     <div class="site-main">
      <h1 class="custom_blog_title">所有貼文</h1>

      <c:forEach var="c" items="${queryall }">
       <c:if test="${c.pin ==0 }">
        <div class="blog-list list-style">
         <div class="blog-item">
          <div class="post-format">
           <a
            href="details?article_no=<c:out value="${c.article_no }"></c:out>"><img
            src="<c:out value="${c.picture}"></c:out>" alt="img"></a>
          </div>
          <div class="post-info">
           <img id="pin" width="50" height="50" src="images/speaker1.png" alt="error">

           <h3 class="post-title">
            <a
             href="details?article_no=<c:out value="${c.article_no }"></c:out>"><c:out
              value="${c.title }"></c:out></span></a>
           </h3>
           
           <div class="main-info-post">
            <p class="des">
             <c:out value="${c.summary }"></c:out>
            </p>
           </div>
           <div class="author-view">
            <div class="author">

             <h3 class="name">
              作者:
              <c:out value="${c.author }"></c:out>
             </h3>
            </div>
            <div class="review">
             <div class="view">
              <span class="icon-view"><i class="fa fa-eye"
               aria-hidden="true"></i></span><span class="count">631 </span>
             </div>
             <div class="s-comments">
              <span class="icon-cmt"><i class="fa fa-commenting"
               aria-hidden="true"></i></span><span class="count">82 </span>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </c:if>

      </c:forEach>
     </div>

     <div class="site-main">


      <c:forEach var="c" items="${queryall }">
       <c:if test="${c.status ==3 && c.pin==1 }">
        <div class="blog-list list-style">
         <div class="blog-item">
          <div class="post-format">
           <a
            href="details?article_no=<c:out value="${c.article_no }"></c:out>"><img
            src="<c:out value="${c.picture}"></c:out>" alt="img"></a>
          </div>
          <div class="post-info">

           <h3 class="post-title">
            <a
             href="details?article_no=<c:out value="${c.article_no }"></c:out>"><c:out
              value="${c.title }"></c:out></span></a>
           </h3>
           <div class="main-info-post">
            <p class="des">
             <c:out value="${c.summary }"></c:out>
            </p>
           </div>
           <div class="author-view">
            <div class="author">

             <h3 class="name">
              作者:
              <c:out value="${c.author }"></c:out>
             </h3>
            </div>
            <div class="review">
             <div class="view">
              <span class="icon-view"><i class="fa fa-eye"
               aria-hidden="true"></i></span><span class="count">631 </span>
             </div>
             <div class="s-comments">
              <span class="icon-cmt"><i class="fa fa-commenting"
               aria-hidden="true"></i></span><span class="count">82 </span>
             </div>
            </div>
           </div>
          </div>
         </div>





        </div>
       </c:if>

      </c:forEach>
     </div>
    </div>



    <div
     class="sidebar sidebar-blog col-lg-3 col-md-4 col-sm-12 col-xs-12">
     <div class="wrapper-sidebar">
      <div class="widget widget-socials">
       <h3 class="widgettitle">追蹤我們</h3>
       <div class="content-socials">
        <div class="social-list">
         <a href="#" target="_blank" class="social-item"><i
          class="fa fa-facebook-square" aria-hidden="true"></i></a><a
          href="#" target="_blank" class="social-item"><i
          class="fa fa-twitter" aria-hidden="true"></i></a><a href="#"
          target="_blank" class="social-item"><i
          class="fa fa-instagram" aria-hidden="true"></i></a>
        </div>
       </div>
      </div>
      <div class="widget widget-categories">
       <h3 class="widgettitle">科目分類</h3>
       <ul class="list-categories">




        <li><a href="queryEnglish?subject="英文""><h6>英文</h6></a></li>
        <li><h6>
          <a href="queryToeic">多益</a>
         </h6></li>
        <li><h6>
          <a href="queryMath">數學</a>
         </h6></li>

       </ul>
      </div>

      <div class="widget widget-post">
       <h3 class="widgettitle">精選文章</h3>
       <ul class="teamo-posts">
        <li class="widget-post-item">
         <div class="thumb-blog">
          <img src="assets/images/sidebar-post1.jpg" alt="img">
         </div>
         <div class="post-content">
          <div class="cat">
           <a href="#">英文</a>
          </div>
          <h5 class="post-title">
           <a href="#">改變英語學習的壞習慣 <span>[...]</span></a>
          </h5>
         </div>
        </li>
        <li class="widget-post-item">
         <div class="thumb-blog">
          <img src="assets/images/sidebar-post2.jpg" alt="img">
         </div>
         <div class="post-content">
          <div class="cat">
           <a href="#">多益</a>
          </div>
          <h5 class="post-title">
           <a href="#">高效情境單字 <span>[...]</span></a>
          </h5>
         </div>
        </li>
        <li class="widget-post-item">
         <div class="thumb-blog">
          <img src="assets/images/sidebar-post3.jpg" alt="img">
         </div>
         <div class="post-content">
          <div class="cat">
           <a href="#">英文</a>
          </div>
          <h5 class="post-title">
           <a href="#">這些日常用品怎麼說? <span>[...]</span></a>
          </h5>
         </div>
        </li>
       </ul>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
 <div class="footer-device-mobile">
  <div class="wapper">
   <div class="footer-device-mobile-item device-home">
    <a href="index.html"><span class="icon"><i
      class="fa fa-home" aria-hidden="true"></i></span>Home </a>
   </div>
   <div class="footer-device-mobile-item device-home device-wishlist">
    <a href="#"><span class="icon"><i class="fa fa-heart"
      aria-hidden="true"></i></span>Wishlist </a>
   </div>
   <div class="footer-device-mobile-item device-home device-cart">
    <a href="#"><span class="icon"><i
      class="fa fa-shopping-basket" aria-hidden="true"></i><span
      class="count-icon">0 </span></span><span class="text">Cart</span></a>
   </div>
   <div class="footer-device-mobile-item device-home device-user">
    <a href="#"><span class="icon"><i class="fa fa-user"
      aria-hidden="true"></i></span>Account </a>
   </div>
  </div>
 </div>
 <a href="#" class="backtotop"><i class="fa fa-angle-double-up"></i></a>
</body>

</html>