<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style>
table {
	width: 100%;
	border: 0px solid #444444;
	border-collapse: collapse;
}

.tdd td {
	border: 0px solid #444444;
}

.myline {
	height: 1px;
	opacity: 0.4;
	background-color: gray;
}

.ban {
	height:150px;
	width:250px;
	background-color:lightgray;
}

#face {
	border-radius: 49px;
	background-color: lightgray;
	margin: 10px;
	width: 100px;
	height: 100px;
}

.mynum {
	position: relative;
	top: -20px
}

input[type="radio"] {
	display: none;
}

input[type="radio"]+label {
	display: inline-block;
	font-size: 18px;
	font-weight: nomal;
	padding: 10px;
	opacity: 0.7;
	cursor: pointer;
}

input[type="radio"]:checked+label {
	color: black;
	font-size: 20px;
	opacity: 1;
	font-weight: bolder;
}

.conbox {
	margin: 0 auto;
	display: none;
}

input[id="tab01"]:checked ~ .con1 {
	display: block;
}

input[id="tab02"]:checked ~ .con2 {
	display: block;
}

input[id="tab03"]:checked ~ .con3 {
	display: block;
}

input[id="tab04"]:checked ~ .con4 {
	display: block;
}
textarea#t2 {
	width: 80%;
	height: 200px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px #1E90FF;
	border-radius: 5px;
	font-size: 14px;
	resize: none;
}



.fileBox input[type="file"] {position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}
</style>

<title>Makaan - Real Estate HTML Template</title>
<c:import url="/WEB-INF/views/parts/head.jsp" />
</head>
<body>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->

		<!-- Navbar Start -->
		<c:import url="/WEB-INF/views/parts/navi.jsp" />
		<!-- Navbar End -->

		<!-- Header Start -->
		<div class="container-fluid header bg-white p-5">
			<br>
		</div>


		<!-- Header End -->





		<!-- Team Start -->
		<div class="container-xxl py-3">
			<div class="container">
				<br>
				<div class="row g-4">
					<div class="col-lg-12 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-item rounded overflow-hidden">
							<div class="p-3 mt-1">
								<table class="tdd">
									<tr height="10px">
										<td rowspan="4" width="100px">
											<div id="face"></div>

										</td>
										<td width="76px"><div style="width: 75px;">
												<h5 class="fw-bold mb-0">관 리 자</h5>
											</div></td>
										<td width="28%"><small style="color: #41CE96;">01</small></td>
										<td rowspan="2" colspan="2" align="right"><a href="#"
											class="btn btn-outline-primary active" style="box-shadow: none;">수정하기</a>
										</td>
											

									</tr>
									<tr height="20px">
										<td colspan="2" align="left"><small><b>user01@naver.com</b></small></td>
									</tr>
									<tr height="0px">
										<td colspan="4"><div class="myline" style="width:100%"></div>
											<div style=""></div></td>
									</tr>
									<tr>
										
										<td colspan="2" class="text-center"><b style="opacity: 0.8">신고된사진</b></td>
										<td colspan="2" width="56%" class="text-center"><b
											style="opacity: 0.8">전체 게시글</b></td>
										
									</tr>
									<tr>
										<td height="30px"></td>
										
										<td colspan="2" class="text-center" style=""><div
												style="height: 70px;">
												<b class="mynum" style="opacity:0.5;font-size: 80px; color: red">30</b>
											</div></td>
										<td colspan="2" class="text-center" style=""><div
												style="height: 70px;">
												<b class="mynum" style="font-size: 80px; color: #ADE8CE">150</b>
											</div></td>
										
									</tr>
								</table>
							</div>
						</div>
					</div>
					
					<div class="col-lg-12 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-item rounded overflow-hidden">
							<div class="p-4 mt-1">
								<div class="tab_content">
									<input type="radio" name="tabmenu" id="tab01" checked>
									<label for="tab01">베너 등록</label> 
									<input type="radio" name="tabmenu" id="tab02"> 
									<label for="tab02">베너 삭제</label>
									<input type="radio" name="tabmenu" id="tab03"> 
									<label for="tab03">회원관리</label>
									<input type="radio" name="tabmenu" id="tab04"> 
									<label for="tab04">신고된 사진</label>

									<div class="conbox con1">
									<form>
										<br>
										<div class="myline"></div>
										<br><br>
										<!-- 베너등록창 -->
										<div class="fileBox" align="center">
											<div style="width:80%" align="left">
											<input type="text" class="fileName" readonly="readonly" style="width:400px; height:40px;padding-left:10px;margin-right:10px;">
											<label for="uploadBtn" class="btn btn-outline-primary active" style="padding:10px; height:42px; box-shadow: none;">베너이미지 업로드</label> <input
												type="file" id="uploadBtn" class="uploadBtn" accept="image/png, image/jpeg">
											</div>
										</div>
										<div style="padding-top:20px;" align="center">
										
										<input type="text" style="width:80%; padding:10px;"
														placeholder="제목을 입력하세요..."
														onfocus="this.placeholder=''"
														onblur="this.placeholder='제목을 입력하세요...'"
														name="title" />
										</div>
										<div style="padding-top:20px" align="center">
										<textarea style="font-size:16px;" rows="10" id="t2" name="board_content" placeholder="내용을 입력하세요..."
														onfocus="this.placeholder=''"
														onblur="this.placeholder='내용을 입력하세요...'"></textarea>
										</div>										
										<div style="padding-top:15px" align="center">
											<div style="width:80%" align="right">
											<a href="#"
												class="btn btn-outline-primary active" style="box-shadow: none;">&nbsp;등 록&nbsp;</a>
											</div>
										</div>
										<br>
									</form>
									</div>

									<div class="conbox con2">
										<br>
										<div class="myline"></div>
										<br>
										<div align="center">
										<!-- 베너삭제창 -->
										<table class="tdd" style="width:80%;">
											<!-- 분리 -->
											<tr>
												<td colspan="3">&nbsp;</td>
											</tr>
											<tr>
												<td rowspan="2" style="width:270px; padding-right: 20px;"><div class="ban"></div></td>
												<td style="height:15px; vertical-align:top; padding-bottom:10px;"><b style="font-size:18px;">제목 텍스트</b></td>
												<td rowspan="2" style="width:10%;vertical-align:top; text-align:center;"><a href="#"
												class="btn btn-outline-primary active" style="box-shadow: none;">&nbsp;삭제&nbsp;</a></td>
											</tr>
											<tr>
												<td style="vertical-align:top;"><div style="opacity:0.8;">
												내용 텍스트 들어갈곳 줄바꿈 포함으로 작성예정<br>
												내용 텍스트 들어갈곳 줄바꿈 줄바꿈 줄바꿈 포함으로 작성예정<br>
												내용 텍스트 들어갈곳줄바꿈  줄바꿈 포함으로 작성예정<br>												
												</div></td>												
											</tr>
											
											<!-- 분리 -->
											<tr>
												<td colspan="3">&nbsp;</td>
											</tr>
											<tr>
												<td rowspan="2" style="width:270px; padding-right: 20px;"><div class="ban"></div></td>
												<td style="height:15px; vertical-align:top; padding-bottom:10px;"><b style="font-size:18px;">제목 텍스트</b></td>
												<td rowspan="2" style="width:10%;vertical-align:top; text-align:center;"><a href="#"
												class="btn btn-outline-primary active" style="box-shadow: none;">&nbsp;삭제&nbsp;</a></td>
											</tr>
											<tr>
												<td style="vertical-align:top;"><div style="opacity:0.8;">
												내용 텍스트 들어갈곳 줄바꿈 포함으로 작성예정<br>
												내용 텍스트 들어갈곳 줄바꿈 줄바꿈 줄바꿈 포함으로 작성예정<br>
												내용 텍스트 들어갈곳줄바꿈  줄바꿈 포함으로 작성예정<br>												
												</div></td>												
											</tr>
											
											<!-- 분리 -->
											<tr>
												<td colspan="3">&nbsp;</td>
											</tr>
											<tr>
												<td rowspan="2" style="width:270px; padding-right: 20px;"><div class="ban"></div></td>
												<td style="height:15px; vertical-align:top; padding-bottom:10px;"><b style="font-size:18px;">제목 텍스트</b></td>
												<td rowspan="2" style="width:10%;vertical-align:top; text-align:center;"><a href="#"
												class="btn btn-outline-primary active" style="box-shadow: none;">&nbsp;삭제&nbsp;</a></td>
											</tr>
											<tr>
												<td style="vertical-align:top;"><div style="opacity:0.8;">
												내용 텍스트 들어갈곳 줄바꿈 포함으로 작성예정<br>
												내용 텍스트 들어갈곳 줄바꿈 줄바꿈 줄바꿈 포함으로 작성예정<br>
												내용 텍스트 들어갈곳줄바꿈  줄바꿈 포함으로 작성예정<br>												
												</div></td>												
											</tr>
											
											<!-- 분리 -->
											
										</table>									
										</div>
										<br><br>
										<div class="myline"></div>
										<br>
									</div>
									<div class="conbox con3">
										<br>
										<div class="myline"></div>
										<br>
										<div style="height: 600px; width: 200px;">
										회원관리창
										</div>

									</div>
									<div class="conbox con4">
										<br>
										<div class="myline"></div>
										<br>
										<div style="height: 600px; width: 200px;">
										신고된 사진 창
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- Team End -->


		<!-- Footer Start -->
		<c:import url="/WEB-INF/views/parts/footer.jsp" />
		<!-- Footer End -->


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

	<c:import url="/WEB-INF/views/parts/foot.jsp" />
</body>
<script type="text/javascript">
var uploadFile = $('.fileBox .uploadBtn');
uploadFile.on('change', function(){
	if(window.FileReader){
		var filename = $(this)[0].files[0].name;
	} else {
		var filename = $(this).val().split('/').pop().split('\\').pop();
	}
	$(this).siblings('.fileName').val(filename);
});
</script>
</html>