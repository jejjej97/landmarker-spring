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
.search input {
	width: 400px;
	height: 30px;
	border: 2px solid rgb(209, 207, 207);
	border-radius: 15px;
}

input::placeholder {
	text-align: center;
	font-size: 14px;
	opacity: 0.7;
}
#btn1 {
	width: 70px;
	padding: 2px;
	border-radius: 20px;
}
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
												<h5 class="fw-bold mb-0">홍 길 동</h5>
											</div></td>
										<td width="28%"><small style="color: #41CE96;">여
												행 중 독 자</small></td>
										<td rowspan="2" colspan="2" align="right"><a href="#"
											class="btn btn-outline-primary active" style="box-shadow: none;">수정하기</a>
											</button></td>
											

									</tr>
									<tr height="20px">
										<td colspan="2" align="left"><small><b>user01@naver.com</b></small></td>
									</tr>
									<tr height="0px">
										<td colspan="4"><div class="myline" width="100%"></div>
											<div style=""></div></td>
									</tr>
									<tr>
										<td></td>
										<td class="text-center"><b style="opacity: 0.8">올린게시글</b></td>
										<td width="28%" class="text-center"><b
											style="opacity: 0.8">스크랩</b></td>
										<td width="28%" class="text-center"><b
											style="opacity: 0.8">벳지</b></td>
									</tr>
									<tr>
										<td height="30px"></td>
										<td></td>
										<td class="text-center" style=""><div
												style="height: 70px;">
												<b class="mynum" style="font-size: 80px; color: #ADE8CE">30</b>
											</div></td>
										<td class="text-center" style=""><div
												style="height: 70px;">
												<b class="mynum" style="font-size: 80px; color: #ADE8CE">15</b>
											</div></td>
										<td class="text-center" style=""><div
												style="height: 70px;">
												<b class="mynum" style="font-size: 80px; color: #FFC154">6</b>
											</div></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-item rounded overflow-hidden">
							<div class=" p-4 mt-1">
								<table class="tdd">
									<tr>
										<td width="160px"><h5 class="fw-bold mb-0">올린게시물</h5></td>
										<td width="190px"></td>
										<td width="100px" align="right"><b style="color: orange;">30</b></td>
									</tr>
									<tr height="30px">
										<td colspan="3"><div class="myline"></div></td>
									</tr>
									<tr height="40px">
										<td><b>동대문역사문화공원</b></td>
										<td><b style="opacity: 0.6; font-size: 14px;">안녕하세요
												이번에 가본곳은..</td>
										<td align="right"><b>2022-04-22</b></td>
									</tr>
									<tr height="40px">
										<td><b>경복궁</b></td>
										<td><b style="opacity: 0.6; font-size: 14px;">안녕하세요
												이번에 가본곳은..</td>
										<td align="right"><b>2022-04-22</b></td>
									</tr>
									<tr height="40px">
										<td><b>흥인지문</b></td>
										<td><b style="opacity: 0.6; font-size: 14px;">안녕하세요
												이번에 가본곳은..</td>
										<td align="right"><b>2022-04-22</b></td>
									</tr>
									<tr height="40px">
										<td><b>월드컵경기장</b></td>
										<td><b style="opacity: 0.6; font-size: 14px;">안녕하세요
												이번에 가본곳은..</td>
										<td align="right"><b>2022-04-22</b></td>
									</tr>
									<tr height="40px">
										<td><b>독립기념관</b></td>
										<td><b style="opacity: 0.6; font-size: 14px;">안녕하세요
												이번에 가본곳은..</td>
										<td align="right"><b>2022-04-22</b></td>
									</tr>
									<tr height="20px">
										<td colspan="3"><div class="myline"></div></td>
									</tr>
									<tr>
										<td height="20px" colspan="3">
											<div>
												<ul style="justify-content: center; padding-top: 25px;"
													class="pagination">
													<!-- 1페이지로 이동처리 -->


													<c:url var="blf" value="/----.do">
														<c:param name="page" value="1" />
													</c:url>
													<li class="page-item"><a class="page-link"
														href="${ blf }"><i class="bi bi-chevron-double-left"></i></a></li>

													<!--  이전페이지 그룹으로 이동처리  -->

													<c:url var="blf2" value="/boardlist.do">
														<c:param name="page" value="${ startPage - 10 }" />
													</c:url>
													<li class="page-item"><a class="page-link"
														href="${ blf2 }"><i class="bi bi-chevron-left"></i></a></li>

													<!-- 현재 페이지가 속한 페이지 그룹 출력 -->
													<li class="page-item active"><a class="page-link"
														href="#">1</a></li>
													<li class="page-item"><a class="page-link"
														href="${ blf5 }">2</a></li>
													<li class="page-item"><a class="page-link"
														href="${ blf5 }">3</a></li>

													<!--  다음페이지 그룹으로 이동처리  -->

													<c:url var="blf3" value="/----.do">
														<c:param name="page" value="${ endPage + 10 }" />
													</c:url>
													<li class="page-item"><a class="page-link"
														href="${ blf3 }"><i class="bi bi-chevron-right"></i></a></li>


													<!-- 끝페이지로 이동처리 -->

													<c:url var="blf4" value="-----.do">
														<c:param name="page" value="${ maxPage }" />
													</c:url>
													<li class="page-item"><a class="page-link"
														href="${ blf4 }"><i class="bi bi-chevron-double-right"></i></a>
												</ul>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-item rounded overflow-hidden">
							<div class="p-4 mt-1">
								<table class="tdd">
									<tr>
										<td width="160px"><h5 class="fw-bold mb-0">스크랩</h5></td>
										<td width="190px"></td>
										<td width="100px" align="right"><b style="color: orange;">15</b></td>
									</tr>
									<tr height="30px">
										<td colspan="3"><div class="myline" /></td>
									</tr>
									<tr>
										<td colspan="3"></td>
									</tr>
								</table>
								<br>
								<div class="owl-carousel testimonial-carousel wow "
									data-wow-delay="0.1s">
									<div class="testimonial-item bg-light rounded p-0">
										<div class="bg-white rounded">
											<div
												style="background-color: gray; width: 220px; height: 225px;"></div>
										</div>
									</div>
									<div class="testimonial-item bg-light rounded p-0">
										<div class="bg-white rounded">
											<div
												style="background-color: gray; width: 220px; height: 225px;"></div>
										</div>
									</div>
									<div class="testimonial-item bg-light rounded p-0">
										<div class="bg-white rounded">
											<div
												style="background-color: gray; width: 220px; height: 225px;"></div>
										</div>
									</div>
								</div>
								<br>
								<br>
								<div class="myline"></div>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-item rounded overflow-hidden">
							<div class="p-4 mt-1">
								<div class="tab_content">
									<input type="radio" name="tabmenu" id="tab01" checked>
									<label for="tab01">랜드마커 벳지</label> <input type="radio"
										name="tabmenu" id="tab02"> <label for="tab02">등록된
										랜드마크 조회</label>

									<div class="conbox con1">
										<br>
										<div class="myline"></div>
										<br>
										<div style="height: 600px; width: 200px;"></div>

									</div>

									<div class="conbox con2">
										<br>
										<div class="myline"></div>
										<div style="padding: 30px;" align="center">
											<form action="searchHash.do" method="get">
												<div class="search">
													<input type="text" size="30"
														placeholder="search hashtag..."
														onfocus="this.placeholder=''"
														onblur="this.placeholder='search hashtag...'"
														name="hashtag" />
														&nbsp;
													<button id="btn1" class="btn btn-primary" type="submit">search</button>
												</div>
											</form>
										</div>
										<div class="myline"></div>
										<br>

										<div style="height: 500px; width: 200px;"></div>

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
</html>