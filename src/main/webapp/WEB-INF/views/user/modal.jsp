<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div align="center">
				<img
					src="${ pageContext.servletContext.contextPath }/resources/userImages/landmarker.PNG">
			</div>
			<div class="modal-body" align="center">
				<a
					href="https://kauth.kakao.com/oauth/authorize?client_id=53ae3074ebb4e336e3b34b90ab5d2f8c&redirect_uri=http://www.landmarker.p-e.kr:8888/landmarker/kakaoLogin.do&response_type=code"
					class="bt"><img
					src="${ pageContext.servletContext.contextPath }/resources/userImages/kakao(eng).png"></a><br>
				<a href=""><img
					src="${ pageContext.servletContext.contextPath }/resources/userImages/naver(eng).png"></a><br>
				<a href="" class="bt"><img
					src="${ pageContext.servletContext.contextPath }/resources/userImages/google.png"></a>
				<br> <br>
			</div>
		</div>
</body>
</html>