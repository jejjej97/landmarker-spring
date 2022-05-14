<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<style type="text/css">
.bt {
	border: none;
	outline: none;
	background-color: white;
}

img {
	width: 300px;
	padding: 1%;
}

hr {
	background-color: grey;
}
</style>
<form id="test"></form>
<div class="container-fluid nav-bar bg-transparent">
    <nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
        <a href="/landmarker/" class="navbar-brand d-flex align-items-center text-center">
            <div class="me-2">
                <img src="${ pageContext.servletContext.contextPath }/resources/img/Llogo.png" style="width: 180px;">
            </div>            
        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div id="modal" class="modal fade" tabindex="-1" role="dialog"> <div class="modal-dialog"> <div class="modal-content"> </div> </div> </div>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto">
                <a href="/landmarker/" class="nav-item nav-link active">Home</a>
                <a href="http://www.landmarker.p-e.kr:8080/landmarker/gallery.do" class="nav-item nav-link">Gallery</a>
                <c:if test="${ empty sessionScope.loginUser }">
                	<a href="#" class="nav-item nav-link" id="aa" data-bs-toggle="modal" data-bs-target="#exampleModal">login</a>
                </c:if>
                <c:if test="${ !empty sessionScope.loginUser }">
	                <a href="mypage.do" class="nav-item nav-link">Mypage</a>
	 	            <c:if test="${ loginUser.user_admin eq 'Y' }">
	                	<a href="admin.do" class="nav-item nav-link">Admin</a>
	               	</c:if>
	                <a href="http://www.landmarker.p-e.kr:8080/landmarker/logout.do" class="nav-item nav-link" >logout</a>
                </c:if>
            </div>
            <a href="http://www.landmarker.p-e.kr:8080/landmarker/photoSearch.do" class="btn btn-primary px-3 d-none d-lg-flex">사진으로 랜드마크 검색</a>
        </div>
    </nav>
    <div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div align="center">
					<img style="width: 290px;height: 127px;" src="${ pageContext.servletContext.contextPath }/resources/userImages/landmarker.PNG">
				</div>
				<div id="modal-body" class="modal-body" align="center">
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=53ae3074ebb4e336e3b34b90ab5d2f8c&redirect_uri=http://www.landmarker.p-e.kr:8888/landmarker/kakaoLogin.do&response_type=code" class="bt">
						<img src="${ pageContext.servletContext.contextPath }/resources/userImages/kakao(eng).png">
					</a><br>
					<a href="http://www.landmarker.p-e.kr:8888/landmarker/naverlogin.do">
						<img src="${ pageContext.servletContext.contextPath }/resources/userImages/naver(eng).png">
					</a><br>
<%--	 				<a href=" + result.googleUrl + ">
						<img src="${ pageContext.servletContext.contextPath }/resources/userImages/google.png">
					</a><br> --%>
					<br>
				</div>
			</div>
		</div>
	</div>
</div>
