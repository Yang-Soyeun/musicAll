<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<div class="module-small bg-dark" style="margin-top:80px">
   <div class="container">
      <div class="row">
         <div class="col-sm-3">
            <div class="widget">
               <h5 class="widget-title font-alt">About Music,All</h5>
               <p>Phone: +1 234 567 89 10</p>
               <p>Email:<a href="#">info@example.com</a></p>
               <p>Address:<a href="#">115, Gasan digital 2-ro, Geumcheon-gu, Seoul, Republic of Korea</a></p>
            </div>
         </div>
         <div class="col-sm-3">
            <div class="widget">
               <h5 class="widget-title font-alt">Quicks Links</h5>
               <ul class="icon-list">
                  <li><a href="${path }/perfor/performanceList.do">공연</a></li>
                  <li><a href="#">예매</a></li>
                  <li><a href="#">스토어 </a></li>
                  <li><a href="#">1:1 문의 </a></li>
               </ul>
            </div>
         </div>
         <div class="col-sm-3">
            <div class="widget">
               <h5 class="widget-title font-alt">Profile</h5>
               <ul class="widget-posts">
                  <li class="clearfix">
                     <div class="widget-posts-image">
                        <a href="#">
                           <img src="${path}/resources/images/rp-1.jpg" alt="Post Thumbnail">
                        </a>
                     </div>
                     <div class="widget-posts-body">
                        <div class="widget-posts-title">
                           Yang Soyeun
                        </div>
                        <div class="widget-posts-meta"><a href="#">17 October</a></div>
                     </div>
                  </li>
                  <li class="clearfix">
                     <div class="widget-posts-image">
                        <a href="#">
                           <img src="${path}/resources/images/chihuahua.jpg" alt="Post Thumbnail">
                        </a>
                     </div>
                     <div class="widget-posts-body">
                        <div class="widget-posts-title">
                           Song Ihyeon
                        </div>
                        <div class="widget-posts-meta"><a href="#">24 February</a></div>
                     </div>
                  </li>
                  <li class="clearfix">
                     <div class="widget-posts-image">
                        <a href="#">
                           <img src="${path}/resources/images/rp-1.jpg" alt="Post Thumbnail">
                        </a>
                     </div>
                     <div class="widget-posts-body">
                        <div class="widget-posts-title">
                           Yoon Subin
                        </div>
                        <div class="widget-posts-meta"><a href="#">22 April</a></div>
                     </div>
                  </li>
               </ul>
            </div>
         </div>
         <div class="col-sm-3">
            <div class="widget">
               <h5 class="widget-title font-alt">Popular Posts</h5>
               <ul class="widget-posts">
                  <li class="clearfix">
                     <div class="widget-posts-image">
                        <a href="#">
                           <img src="${path}/resources/images/cha2.jpg" alt="Post Thumbnail">
                        </a>
                     </div>
                     <div class="widget-posts-body">
                        <div class="widget-posts-title">
                           Cha Jiyeon
                        </div>
                        <div class="widget-posts-meta"><a href="#">02 December</a></div>
                     </div>
                  </li>
                  <li class="clearfix">
                     <div class="widget-posts-image">
                        <a href="#">
                           <img src="${path}/resources/images/rp-1.jpg" alt="Post Thumbnail">
                        </a>
                     </div>
                     <div class="widget-posts-body">
                        <div class="widget-posts-title">
                           Hong Nari
                        </div>
                        <div class="widget-posts-meta"><a href="#">16 June</a></div>
                     </div>
                  </li>
               </ul>
            </div>
         </div>
      </div>
   </div>
</div>
</main>
</body>
</html>