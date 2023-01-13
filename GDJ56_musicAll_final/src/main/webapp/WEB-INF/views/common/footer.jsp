<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<div class="module-small bg-dark">
   <div class="container">
      <div class="row">
         <div class="col-sm-3">
            <div class="widget">
               <h5 class="widget-title font-alt">About Music,All</h5>
               <p>The languages only differ in their grammar, their pronunciation and their most common words.</p>
               <p>Phone: +1 234 567 89 10</p>Fax:+012 345 67890
               <p>Email:<a href="#">info@example.com</a></p>
               <p>Address:<a href="#">115, Gasan digital 2-ro, Geumcheon-gu, Seoul, Republic of Korea</a></p>
            </div>
         </div>
         <div class="col-sm-3">
            <div class="widget">
               <h5 class="widget-title font-alt">Quicks Links</h5>
               <ul class="icon-list">
                  <li><a href="#">Home</a></li>
                  <li><a href="#">공연</a></li>
                  <li><a href="#">예매</a></li>
                  <li><a href="#">스토어 </a></li>
                  <li><a href="#">1:1 문의 </a></li>
               </ul>
            </div>
         </div>
         <div class="col-sm-3">
            <div class="widget">
               <h5 class="widget-title font-alt">Newsletter</h5>
               <ul class="icon-list">
                  <li><a href="#">news1 </a></li>
                  <li><a href="#">news2 </a></li>
                  <li><a href="#">news3 </a></li>
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
                           <img src="${path}/resources/images/rp-1.jpg" alt="Post Thumbnail">
                        </a>
                     </div>
                     <div class="widget-posts-body">
                        <div class="widget-posts-title">
                           <a href="#">Designer Desk Essentials</a>
                        </div>
                        <div class="widget-posts-meta">23 january</div>
                     </div>
                  </li>
                  <li class="clearfix">
                     <div class="widget-posts-image">
                        <a href="#">
                           <img src="${path}/resources/images/rp-2.jpg" alt="Post Thumbnail">
                        </a>
                     </div>
                     <div class="widget-posts-body">
                        <div class="widget-posts-title">
                           <a href="#">Realistic Business Card Mockup</a>
                        </div>
                        <div class="widget-posts-meta">15 February</div>
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