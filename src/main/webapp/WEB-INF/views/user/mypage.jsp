<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="board_count" value="${ board_count }" />
<c:set var="startPage" value="${ startPage }" />
<c:set var="endPage" value="${ endPage }" />
<c:set var="maxPage" value="${ maxPage }" />
<c:set var="currentPage" value="${ currentPage }" />

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
	margin: 10px;
	width: 120px;
	height: 120px;
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

.btncheck {
	display: block;
}

input[id="tab03"]:checked ~ .btn03 {
	display: none;
}

input[id="tab04"]:checked ~ .btn04 {
	display: none;
}

.search input {
	width: 60%;
	height: 30px;
	border: 2px solid rgb(209, 207, 207);
	border-radius: 15px;
}

#searchtag::placeholder {
	text-align: center;
	font-size: 14px;
	opacity: 0.7;
}

#nametag::placeholder {
	text-align: center;
	font-size: 18px;
	font-weight: 700;
}

#btn1 {
	width: 70px;
	padding: 2px;
	border-radius: 20px;
}

img.photo {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
<script type="text/javascript" 
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js">
</script>
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
		<div class="container-xxl py-3">
			<div class="container">
				<br>
				<div class="row g-4">
					<!-- ---------------------------------------- -->
					<div class="col-lg-12 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-item rounded overflow-hidden">
							<div class="tab_content">
								<input type="radio" name="mymenu" id="tab04">
								<div class="btncheck btn04"
									style="text-align: right; margin: -30px 17px 0px 0px; position: relative; top: 65px">
									<label for="tab04"> <a
										class="btn btn-outline-primary active"
										style="box-shadow: none;">수정하기</a>
									</label>
								</div>
								<input type="radio" name="mymenu" id="tab03" checked>
								<div class="btncheck btn03"
									style="text-align: right; margin: -30px 17px 0px 0px; position: relative; top: 92px; width: 100px; float: right;">
									<label for="tab03"> <a
										class="btn btn-outline-primary active"
										style="box-shadow: none;">취 소</a>
									</label>
								</div>
								<div class="p-3 mt-1 conbox con3">
									<table class="tdd">
										<tr height="10px">
											<td rowspan="4" width="100px">
												<div>
													<!-- --------------------벳지이미지 이프문 시작---------------- -->
													<c:if test="${ user.user_badge eq '소통왕' }">
														<img
															style="width: 90%; height: 90%; object-fit: cover; position: relative; top: -10px;"
															src="${ pageContext.servletContext.contextPath }/resources/badge/sotong.png">
													</c:if>
													<c:if test="${ user.user_badge eq '여행의 첫걸음' }">
														<img
															style="width: 90%; height: 90%; object-fit: cover; position: relative; top: -10px;"
															src="${ pageContext.servletContext.contextPath }/resources/badge/chobo.png">
													</c:if>
													<c:if test="${ user.user_badge eq '갈곳은 많다' }">
														<img
															style="width: 90%; height: 90%; object-fit: cover; position: relative; top: -10px;"
															src="${ pageContext.servletContext.contextPath }/resources/badge/scrap.png">
													</c:if>
													<c:if test="${ user.user_badge eq '어디까지 가봤니?' }">
														<img
															style="width: 90%; height: 90%; object-fit: cover; position: relative; top: -10px;"
															src="${ pageContext.servletContext.contextPath }/resources/badge/kor.png">
													</c:if>
													<c:if test="${ user.user_badge eq '여행중독자' }">
														<img
															style="width: 90%; height: 90%; object-fit: cover; position: relative; top: -10px;"
															src="${ pageContext.servletContext.contextPath }/resources/badge/dok.png">
													</c:if>
													<c:if test="${ user.user_badge eq '주기적 일상탈출' }">
														<img
															style="width: 90%; height: 90%; object-fit: cover; position: relative; top: -10px;"
															src="${ pageContext.servletContext.contextPath }/resources/badge/lover.png">
													</c:if>
													<!-- --------------------벳지이미지 이프문 끝---------------- -->
												</div>

											</td>
											<td colspan="2">
												<div style="width: 220px;">
													<b class="fw-bold mb-0"
														style="font-size: 19px; letter-spacing: 4px;">${ user.user_name }</b>
													<small style="color: #41CE96;"><span
														style="letter-spacing: 3px;">${ user.user_badge }</span></small>
												</div>
											</td>
											<td rowspan="2" colspan="2" align="right"></td>


										</tr>
										<tr height="20px">
											<td colspan="2" align="left"><small><b
													style="text-transform: lowercase; letter-spacing: 0.5px; opacity: 0.5;">${ user.user_email }</b></small></td>
										</tr>
										<tr height="0px">
											<td colspan="4"><div class="myline" width="100%"></div>
												<div style=""></div></td>
										</tr>
										<tr>
											<td style="width: 80px;"></td>
											<td class="text-center"><b style="opacity: 0.8">올린게시글</b></td>
											<td width="28%" class="text-center"><b
												style="opacity: 0.8">스크랩</b></td>
											<td width="28%" class="text-center"><b
												style="opacity: 0.8">댓글</b></td>
										</tr>
										<tr>
											<td height="30px"></td>
											<td></td>
											<td class="text-center" style=""><div
													style="height: 70px;">
													<b class="mynum" style="font-size: 80px; color: #ADE8CE">${ board_count }</b>
												</div></td>
											<td class="text-center" style=""><div
													style="height: 70px;">
													<b class="mynum" style="font-size: 80px; color: #ADE8CE">${ scrap_count }</b>
												</div></td>
											<td class="text-center" style=""><div
													style="height: 70px;">
													<b class="mynum" style="font-size: 80px; color: #ADE8CE">${ reply_count }</b>
												</div></td>
										</tr>
									</table>
								</div>
								<div class="p-3 mt-1 conbox con4">
									<form action="userupdate.do" method="post">
										<table class="tdd">
											<tr height="10px">
												<td rowspan="4" width="100px">
													<div id="face">
														<c:if test="${ user.user_badge eq '소통왕' }">
															<img
																style="width: 90%; height: 90%; object-fit: cover; position: relative; top: -10px;"
																src="${ pageContext.servletContext.contextPath }/resources/badge/sotong.png">
														</c:if>
														<c:if test="${ user.user_badge eq '여행의 첫걸음' }">
															<img
																style="width: 90%; height: 90%; object-fit: cover; position: relative; top: -10px;"
																src="${ pageContext.servletContext.contextPath }/resources/badge/chobo.png">
														</c:if>
														<c:if test="${ user.user_badge eq '갈곳은 많다' }">
															<img
																style="width: 90%; height: 90%; object-fit: cover; position: relative; top: -10px;"
																src="${ pageContext.servletContext.contextPath }/resources/badge/scrap.png">
														</c:if>
														<c:if test="${ user.user_badge eq '어디까지 가봤니?' }">
															<img
																style="width: 90%; height: 90%; object-fit: cover; position: relative; top: -10px;"
																src="${ pageContext.servletContext.contextPath }/resources/badge/kor.png">
														</c:if>
														<c:if test="${ user.user_badge eq '여행중독자' }">
															<img
																style="width: 90%; height: 90%; object-fit: cover; position: relative; top: -10px;"
																src="${ pageContext.servletContext.contextPath }/resources/badge/dok.png">
														</c:if>
														<c:if test="${ user.user_badge eq '주기적 일상탈출' }">
															<img
																style="width: 90%; height: 90%; object-fit: cover; position: relative; top: -10px;"
																src="${ pageContext.servletContext.contextPath }/resources/badge/lover.png">
														</c:if>
													</div>

												</td>
												<td width="76px"><div style="width: 75px;">
														<h5 class="fw-bold mb-0" style="letter-spacing: 4px;">
															<input id="nametag" type="text" name="username"
																style="letter-spacing: 4px; width: 80px; text-align: center; position: relative; top: 10px;"
																placeholder="${ user.user_name }">
														</h5>
													</div></td>
												<td width="28%"><small style="color: #41CE96;"></small></td>
												<td colspan="2" align="right">
													<button class="btn btn-outline-primary active"
														type="submit"
														style="box-shadow: none; color: white; background-color: #0CAC82;">저
														장</button>
												</td>


											</tr>
											<tr height="20px">
												<td colspan="2" align="left"><small><b
														style="text-transform: lowercase; letter-spacing: 0.5px; opacity: 0.5;">${ user.user_email }</b></small>
												</td>
												<td colspan="2" align="right" style="height: 50px;"></td>
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
													style="opacity: 0.8">댓글</b></td>
											</tr>
											<tr>
												<td height="30px"></td>
												<td></td>
												<td class="text-center" style=""><div
														style="height: 70px;">
														<b class="mynum" style="font-size: 80px; color: #ADE8CE">${ board_count }</b>
													</div></td>
												<td class="text-center" style=""><div
														style="height: 70px;">
														<b class="mynum" style="font-size: 80px; color: #ADE8CE">${ scrap_count }</b>
													</div></td>
												<td class="text-center" style=""><div
														style="height: 70px;">
														<b class="mynum" style="font-size: 80px; color: #ADE8CE">${ reply_count }</b>
													</div></td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!--  -------------------------------------------------------------------- -->
					<div class="col-lg-12 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-item rounded overflow-hidden">
							<div class=" p-4 mt-1">
								<table class="tdd">
									<tr>
										<td width="160px"><h5 class="fw-bold mb-0">올린게시물</h5></td>
										<td width="190px"></td>
										<td width="100px" align="right"><b style="color: orange;">${ board_count }</b></td>
									</tr>
									<tr height="30px">
										<td colspan="3"><div class="myline"></div></td>
									</tr>
								</table>
								<br>
								<div class="tab-content">
									<div id="tab-1" class="tab-pane fade show p-0 active">
										<div class="row g-4">
											<!-- -----------------------올린게시물 컨텐츠----------------------------------- -->
											<c:forEach items="${ requestScope.gallerylist }" var="g">
												<div class="col-lg-4 col-md-6 wow fadeInUp"
													data-wow-delay="0.1s">
													<div class="property-item rounded overflow-hidden"
														style="box-shadow: 3px 4px 12px 3px gray; width: 100%; height: 100%; padding: 0px; margin: 0 auto;">
														<div style="margin: 10 auto; position: relative;">															
															<a role="button" style="overflow: hidden;" href="http://www.landmarker.p-e.kr:8080/landmarker/gdetailview.do?g_no=${ g.gallery_no }"> <img
																style="width: 400px; height: 400px; object-fit: cover; margin: -4px; align: center; vertical-align: middle;"
																src="http://www.landmarker.p-e.kr:8080/static/gallery_images/${ g.photo_path }"></a>

															<b
																style="transform: translate(-50%, -50%); position: absolute; bottom: 45%; left: 50%; color: white; text-align: center; text-shadow: 1px 1px 6px black;">${ g.hashtag }</b>

														</div>
													</div>
												</div>

											</c:forEach>

											<!-- 올린게시물 컨텐츠 끝---------------------------------------------- -->

										</div>
									</div>
								</div>
								<br>
								<table class="tdd">
									<tr height="30px">
										<td colspan="3"><div class="myline"></div></td>
									</tr>
									<tr>
										<td height="20px" colspan="3">
											<div>
												<ul style="justify-content: center; padding-top: 25px;"
													class="pagination">
													<!-- 1페이지로 이동처리 -->
													<c:if test="${ currentPage eq 1 }">
														<li class="page-item disabled"><a class="page-link"
															href="#"><i class="bi bi-chevron-double-left"></i></a></li>
													</c:if>
													<c:if test="${ currentPage > 1 }">
														<c:url var="blf" value="/mypage.do">
															<c:param name="page" value="1" />
														</c:url>
														<li class="page-item"><a class="page-link"
															href="${ blf }"><i class="bi bi-chevron-double-left"></i></a></li>
													</c:if>
													<!--  이전페이지 그룹으로 이동처리  -->
													<c:if
														test="${ (currentPage -10) < startPage and (currentPage - 10) > 1 }">
														<c:url var="blf2" value="/mypage.do">
															<c:param name="page" value="${ startPage - 10 }" />
														</c:url>
														<li class="page-item"><a class="page-link"
															href="${ blf2 }"><i class="bi bi-chevron-left"></i></a></li>
													</c:if>
													<c:if
														test="${ !((currentPage -10) < startPage and (currentPage - 10) > 1) }">
														<li class="page-item disabled"><a class="page-link"
															href="${ blf2 }"><i class="bi bi-chevron-left"></i></a></li>
													</c:if>
													<!-- 현재 페이지가 속한 페이지 그룹 출력 -->
													<c:forEach var="p" begin="${ startPage }"
														end="${ endPage }" step="1">
														<c:if test="${ p eq currentPage }">
															<li class="page-item active"><a class="page-link"
																href="#">${ p }</a></li>
														</c:if>
														<c:if test="${ p ne currentPage }">
															<c:url var="blf5" value="/mypage.do">
																<c:param name="page" value="${ p }" />
															</c:url>
															<li class="page-item"><a class="page-link"
																href="${ blf5 }">${ p }</a></li>
														</c:if>
													</c:forEach>
													<!--  다음페이지 그룹으로 이동처리  -->
													<c:if
														test="${ (currentPage +10) > endPage and (currentPage + 10) < maxPage }">
														<c:url var="blf3" value="/mypage.do">
															<c:param name="page" value="${ endPage + 10 }" />
														</c:url>
														<li class="page-item"><a class="page-link"
															href="${ blf3 }"><i class="bi bi-chevron-right"></i></a></li>
													</c:if>
													<c:if
														test="${ !((currentPage +10) > endPage and (currentPage + 10) < maxPage) }">
														<li class="page-item disabled"><a class="page-link"
															href=""><i class="bi bi-chevron-right"></i></a></li>
													</c:if>
													<c:if test="${ currentPage eq maxPage }">
														<li class="page-item disabled"><a class="page-link"
															href=""><i class="bi bi-chevron-double-right"></i></a>
													</c:if>
													<!-- 끝페이지로 이동처리 -->
													<c:if test="${ currentPage < maxPage }">
														<c:url var="blf4" value="/mypage.do">
															<c:param name="page" value="${ maxPage }" />
														</c:url>
														<li class="page-item"><a class="page-link"
															href="${ blf4 }"><i
																class="bi bi-chevron-double-right"></i></a>
													</c:if>
												</ul>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- -------------------------------------------------------------------------- -->
					<div class="col-lg-12 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-item rounded overflow-hidden">
							<div class="p-4 mt-1">
								<table class="tdd">
									<tr>
										<td width="160px"><h5 class="fw-bold mb-0">스크랩</h5></td>
										<td width="190px"></td>
										<td width="100px" align="right"><b style="color: orange;">${ scrap_count }</b></td>
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
									<c:forEach items="${ requestScope.likelist }" var="b">
										<a href="http://www.landmarker.p-e.kr:8080/landmarker/gdetailview.do?g_no=${ b.gallery_no }">
										<div class="testimonial-item rounded p-2"
											style="width: 95%; height: 310px; box-shadow: 3px 4px 11px 3px #C3C3C3; margin: 12px 3px 15px 3px;">
															<div style="float:left;width:50%; height:100%;">
																<img class="photo"
																	src="http://www.landmarker.p-e.kr:8080/static/gallery_images/${b.photo_path}" />
															</div>
															
														
															<div style="float:left;width:50%;">																
																<b style="padding-left: 8px; font-size: 18px; color:black;">${ b.hashtag }</b>
																<div style="height:5px;"></div>
																<div style="padding-left: 8px; width:100%;">
																<span style="word-wrap: break-word;float:none;color:black;font-size: 16px; opacity: 0.8;">${ b.gallery_content }</span><br>
																</div>
																<span style="position:absolute;color:black; bottom:6%; right:7%;padding-left: 8px;font-size: 16px; opacity: 0.8;"><b
																	style="opacity: 0.5;">${ b.gallery_date }</b></span>	
															</div>
										</div>
										</a>
									</c:forEach>

								</div>
								<br> <br>
								<div class="myline"></div>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 wow fadeInUp mb-4" data-wow-delay="0.1s">
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
										<br> <br>
										<div class="tab-content">
											<div class="tab-pane fade show p-0 active">
												<div class="row g-4">
													<!-- -----------------------벳지 컨텐츠----------------------------------- -->
													<div class="col-lg-4 col-md-6 wow fadeInUp"
														data-wow-delay="0.1s">
														<div class="rounded overflow-hidden"
															style="width: 100%; height: 100%;">
															<c:choose>
																<c:when test="${ user.user_badge eq '여행의 첫걸음' }">																	
																	<div class="position-relative" style="text-align: center; border: dashed 3px #31D288; border-radius: 30px;">
																		<div style="text-align: right;"><b style="position:relative;top:10px; right:20px;color: #31D288; font-size: 18px;">장착중</b></div>
																		<img
																			style="width: 60%; height: 60%; object-fit: cover;"
																			src="${ pageContext.servletContext.contextPath }/resources/badge/chobo.png">
																		<br> <br> <b
																			style="margin-right: 2px; opacity: 0.9; font-size: 19px;">여행의
																			첫걸음</b>
																	
																	</div>
																</c:when>
																<c:when test="${ user.user_badge ne '여행의 첫걸음' }">
																	<div class="position-relative"
																		style="text-align: center;">

																		<form id="bdg" action="badgeupdate.do">
																			<input type="hidden" name="badge_name"
																				value="여행의 첫걸음"> <a href="#"
																				onclick="badge_form()" class="detail" role="button"
																				style="overflow: hidden; margin: 0 auto;"> 
																				<div style="height:25px;"></div>
																				<img
																				style="width: 60%; height: 60%; object-fit: cover;"
																				src="${ pageContext.servletContext.contextPath }/resources/badge/chobo.png">
																				<br> <br> <b
																				style="margin-right: 2px; color: gray; opacity: 0.7; font-size: 19px;">여행의
																					첫걸음</b>
																			</a>
																		</form>
																	</div>
																</c:when>
															</c:choose>
														</div>
													</div>
													<!-- -------------------------------------------------1번끝 -->
													<div class="col-lg-4 col-md-6 wow fadeInUp"
														data-wow-delay="0.1s">
														<div class="rounded overflow-hidden"
															style="width: 100%; height: 100%;">
															<c:choose>
																<c:when test="${ user.user_badge eq '갈곳은 많다' }">
																	<div
																		style="text-align: RIGHT; position: relative; top: 30px; right: 7%;">
																		
																	</div>
																	<div class="position-relative"
																		style="text-align: center; border: dashed 3px #31D288; border-radius: 30px;">
																		<div style="text-align: right;"><b style="position:relative;top:10px; right:20px;color: #31D288; font-size: 18px;">장착중</b></div>
																		<img
																			style="width: 60%; height: 60%; object-fit: cover;"
																			src="${ pageContext.servletContext.contextPath }/resources/badge/scrap.png">
																		<br> <br> <b
																			style="margin-right: 2px; opacity: 0.9; font-size: 19px;">갈곳은
																			많다</b>
																	</div>

																</c:when>
																<c:when test="${ user.user_badge ne '갈곳은 많다' }">
																	<div class="position-relative"
																		style="text-align: center;">

																		<c:if test="${ scrap_count gt 9 }">
																			<form id="bdg2" action="badgeupdate.do">
																				<input type="hidden" name="badge_name"
																					value="갈곳은 많다"> <a href="#"
																					onclick="badge_form2()" class="detail"
																					role="button"
																					style="overflow: hidden; margin: 0 auto;"> 
																					<div style="height:25px;"></div>
																					<img
																					style="width: 60%; height: 60%; object-fit: cover;"
																					src="${ pageContext.servletContext.contextPath }/resources/badge/scrap.png">
																					<br> <br> <b
																					style="margin-right: 2px; color: gray; opacity: 0.7; font-size: 19px;">갈곳은
																						많다</b>
																				</a>
																			</form>
																		</c:if>

																		<c:if test="${ scrap_count le 9 }">
																		<div style="height:25px;"></div>
																			<img class="tolltip"
																				style="width: 60%; height: 60%; object-fit: cover;"
																				title="10개 스크랩시 오픈"
																				src="${ pageContext.servletContext.contextPath }/resources/badge/scraprock.png">
																			<br>
																			<br>
																			<b
																				style="margin-right: 2px; color: gray; opacity: 0.7; font-size: 19px;">갈곳은
																				많다</b>
																			<span class="tooltiptext tooltip-top"></span>
																		</c:if>
																	</div>
																</c:when>
															</c:choose>
														</div>
													</div>
													<!-- -------------------------------------------- -->
													<div class="col-lg-4 col-md-6 wow fadeInUp"
														data-wow-delay="0.1s">
														<div class="rounded overflow-hidden"
															style="width: 100%; height: 100%;">
															<c:choose>
																<c:when test="${ user.user_badge eq '주기적 일상탈출' }">																	
																		
																	<div class="position-relative" style="text-align: center; border: dashed 3px #31D288; border-radius: 30px;">
																		<div style="text-align: right;"><b style="position:relative;top:10px; right:20px;color: #31D288; font-size: 18px;">장착중</b></div>
																		<img
																			style="width: 60%; height: 60%; object-fit: cover;"
																			src="${ pageContext.servletContext.contextPath }/resources/badge/lover.png">
																		<br> <br> <b
																			style="margin-right: 2px; opacity: 0.9; font-size: 19px;">주기적
																			일상탈출</b>
																	</div>

																</c:when>
																<c:when test="${ user.user_badge ne '주기적 일상탈출' }">
																	<div class="position-relative"
																		style="text-align: center;">

																		<c:if test="${ board_count gt 4 }">
																			<form id="bdg3" action="badgeupdate.do">
																				<input type="hidden" name="badge_name"
																					value="주기적 일상탈출"> <a href="#"
																					onclick="badge_form3()" class="detail"
																					role="button"
																					style="overflow: hidden; margin: 0 auto;"> 
																					<div style="height:25px;"></div>
																					<img
																					style="width: 60%; height: 60%; object-fit: cover;"
																					src="${ pageContext.servletContext.contextPath }/resources/badge/lover.png">
																					<br> <br> <b
																					style="margin-right: 2px; color: gray; opacity: 0.7; font-size: 19px;">주기적
																						일상탈출</b>
																				</a>
																			</form>
																		</c:if>

																		<c:if test="${ board_count le 4 }">
																		<div style="height:25px;"></div>
																			<img class="tolltip"
																				style="width: 60%; height: 60%; object-fit: cover;"
																				title="게시글 5개 작성시 오픈"
																				src="${ pageContext.servletContext.contextPath }/resources/badge/loverrock.png">
																			<br>
																			<br>
																			<b
																				style="margin-right: 2px; color: gray; opacity: 0.7; font-size: 19px;">주기적
																				일상탈출</b>
																			<span class="tooltiptext tooltip-top"></span>
																		</c:if>
																	</div>
																</c:when>
															</c:choose>
														</div>
													</div>
													<!-- --------------------------- -->
													<div class="col-lg-4 col-md-6 wow fadeInUp"
														data-wow-delay="0.1s">
														<div class="rounded overflow-hidden"
															style="width: 100%; height: 100%;">
															<c:choose>
																<c:when test="${ user.user_badge eq '어디까지 가봤니?' }">
																	<div
																		style="text-align: RIGHT; position: relative; top: 30px; right: 7%;">
																		
																	</div>
																	<div class="position-relative"
																		style="text-align: center; border: dashed 3px #31D288; border-radius: 30px;">
																		<div style="text-align: right;"><b style="position:relative;top:10px; right:20px;color: #31D288; font-size: 18px;">장착중</b></div>
																		<img
																			style="width: 60%; height: 60%; object-fit: cover;"
																			src="${ pageContext.servletContext.contextPath }/resources/badge/kor.png">
																		<br> <br> <b
																			style="margin-right: 2px; opacity: 0.9; font-size: 19px;">어디까지
																			가봤니?</b>
																	</div>

																</c:when>
																<c:when test="${ user.user_badge ne '어디까지 가봤니?' }">
																	<div class="position-relative"
																		style="text-align: center;">

																		<c:if test="${ board_count gt 9 }">
																			<form id="bdg4" action="badgeupdate.do">
																				<input type="hidden" name="badge_name"
																					value="어디까지 가봤니?"> <a href="#"
																					onclick="badge_form4()" class="detail"
																					role="button"
																					style="overflow: hidden; margin: 0 auto;"> 
																					<div style="height:25px;"></div>
																					<img
																					style="width: 60%; height: 60%; object-fit: cover;"
																					src="${ pageContext.servletContext.contextPath }/resources/badge/kor.png">
																					<br> <br> <b
																					style="margin-right: 2px; color: gray; opacity: 0.7; font-size: 19px;">어디까지
																						가봤니?</b>
																				</a>
																			</form>
																		</c:if>

																		<c:if test="${ board_count le 9 }">
																		<div style="height:25px;"></div>
																			<img class="tolltip"
																				style="width: 60%; height: 60%; object-fit: cover;"
																				title="게시글 10개 작성시 오픈"
																				src="${ pageContext.servletContext.contextPath }/resources/badge/korrock.png">
																			<br>
																			<br>
																			<b
																				style="margin-right: 2px; color: gray; opacity: 0.7; font-size: 19px;">어디까지
																				가봤니?</b>
																			<span class="tooltiptext tooltip-top"></span>
																		</c:if>
																	</div>
																</c:when>
															</c:choose>
														</div>
													</div>
													<!-- ------------------- -->
													<div class="col-lg-4 col-md-6 wow fadeInUp"
														data-wow-delay="0.1s">
														<div class="rounded overflow-hidden"
															style="width: 100%; height: 100%;">
															<c:choose>
																<c:when test="${ user.user_badge eq '소통왕' }">
																	<div
																		style="text-align: RIGHT; position: relative; top: 30px; right: 7%;">
																	</div>
																	<div class="position-relative"
																		style="text-align: center; border: dashed 3px #31D288; border-radius: 30px;">
																		<div style="text-align: right;"><b style="position:relative;top:10px; right:20px;color: #31D288; font-size: 18px;">장착중</b></div>
																		<img
																			style="width: 60%; height: 60%; object-fit: cover;"
																			src="${ pageContext.servletContext.contextPath }/resources/badge/sotong.png">
																		<br> <br> <b
																			style="margin-right: 2px; opacity: 0.9; font-size: 19px;">소통왕</b>
																	</div>

																</c:when>
																<c:when test="${ user.user_badge ne '소통왕' }">
																	<div class="position-relative"
																		style="text-align: center;">

																		<c:if test="${ reply_count gt 9 }">
																			<form id="bdg5" action="badgeupdate.do">
																				<input type="hidden" name="badge_name" value="소통왕">
																				<a href="#" onclick="badge_form5()" class="detail"
																					role="button"
																					style="overflow: hidden; margin: 0 auto;"> 
																					<div style="height:25px;"></div>
																					<img
																					style="width: 60%; height: 60%; object-fit: cover;"
																					src="${ pageContext.servletContext.contextPath }/resources/badge/sotong.png">
																					<br> <br> <b
																					style="margin-right: 2px; color: gray; opacity: 0.7; font-size: 19px;">소통왕</b>
																				</a>
																			</form>
																		</c:if>

																		<c:if test="${ reply_count le 9 }">
																		<div style="height:25px;"></div>
																			<img class="tolltip"
																				style="width: 60%; height: 60%; object-fit: cover;"
																				title="댓글 10개 작성시 오픈"
																				src="${ pageContext.servletContext.contextPath }/resources/badge/sotongrock.png">
																			<br>
																			<br>
																			<b
																				style="margin-right: 2px; color: gray; opacity: 0.7; font-size: 19px;">소통왕</b>
																			<span class="tooltiptext tooltip-top"></span>
																		</c:if>
																	</div>
																</c:when>
															</c:choose>
														</div>
													</div>
													<!-- ------------------------------- -->
													<div class="col-lg-4 col-md-6 wow fadeInUp"
														data-wow-delay="0.1s">
														<div class="rounded overflow-hidden"
															style="width: 100%; height: 100%;">
															<c:choose>
																<c:when test="${ user.user_badge eq '여행중독자' }">
																	<div
																		style="text-align: RIGHT; position: relative; top: 30px; right: 7%;">
																	</div>
																	<div class="position-relative"
																		style="text-align: center; border: dashed 3px #31D288; border-radius: 30px;">
																		<div style="text-align: right;"><b style="position:relative;top:10px; right:20px;color: #31D288; font-size: 18px;">장착중</b></div>
																		<img
																			style="width: 60%; height: 60%; object-fit: cover;"
																			src="${ pageContext.servletContext.contextPath }/resources/badge/dok.png">
																		<br> <br> <b
																			style="margin-right: 2px; opacity: 0.9; font-size: 19px;">여행중독자</b>
																	</div>

																</c:when>
																<c:when test="${ user.user_badge ne '여행중독자' }">
																	<div class="position-relative"
																		style="text-align: center;">

																		<c:if test="${ board_count gt 20 }">
																			<form id="bdg6" action="badgeupdate.do">
																				<input type="hidden" name="badge_name" value="여행중독자">
																				<a href="#" onclick="badge_form6()" class="detail"
																					role="button"
																					style="overflow: hidden; margin: 0 auto;"> 
																					<div style="height:25px;"></div>
																					<img
																					style="width: 60%; height: 60%; object-fit: cover;"
																					src="${ pageContext.servletContext.contextPath }/resources/badge/dok.png">
																					<br> <br> <b
																					style="margin-right: 2px; color: gray; opacity: 0.7; font-size: 19px;">여행중독자</b>
																				</a>
																			</form>
																		</c:if>

																		<c:if test="${ board_count le 20 }">
																		<div style="height:25px;"></div>
																			<img class="tolltip"
																				style="width: 60%; height: 60%; object-fit: cover;"
																				title="게시글 20개 작성시 오픈"
																				src="${ pageContext.servletContext.contextPath }/resources/badge/dokrock.png">
																			<br>
																			<br>
																			<b
																				style="margin-right: 2px; color: gray; opacity: 0.7; font-size: 19px;">여행중독자</b>
																			<span class="tooltiptext tooltip-top"></span>
																		</c:if>
																	</div>
																</c:when>
															</c:choose>
														</div>
													</div>
													<!-- 벳지 컨텐츠 끝---------------------------------------------- -->

												</div>
											</div>
										</div>

									</div>

									<div class="conbox con2">
										<br>
										<div class="myline"></div>
										<div style="padding: 30px;" align="center">											
											<div class="search">
												<input id="searchtag" type="text" size="30"
													placeholder="검색어를 입력하세요..." onfocus="this.placeholder=''"
													onblur="this.placeholder='검색어를 입력하세요...'" name="hashtag"  style="padding-left:12px; margin-bottom:10px"/>
												&nbsp;
												<button id="btn1" class="btn btn-primary" type="submit" style="box-shadow: none;">search</button>
											</div>
										</div>
										<div class="myline"></div>
										<br>
										<div>
											<table id="landmarklist">
												
											</table>
										</div>										
										<br>
										<div class="myline"></div>
										<br>
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
	
	<script>	
		 $('#searchtag').keypress(function(e){
	        if(e.keyCode == 13){
	            $('#btn1').click();
	        }
	    })

	    $('#btn1').click(function(){
	        var search = $('#searchtag').val();
	        console.log(search);

	        $.ajax({
	            url: 'landmarkSearch.do',
	            type: "post",
	            data: {'search': search},
	            dataType: "json",
	            success:function(data){
	                
                    console.log("success : "+ data);
                   
                    var jsonStr = JSON.stringify(data);
                    
                    var json = JSON.parse(jsonStr);
                    
                    var values = "";
                    if(jsonStr.length == 11){
                    	alert("검색결과가 없습니다.");                    	
                    }else{
	                   for(var i in json.list){
	                   	if(i % 2 == 0){
	                   	values += "<tr style='height:50px; background: #E8FBF2;'><td style='width:380px;'><b style='padding-left:20px; font-size:17px;'>"
	                   			+decodeURIComponent(json.list[i].landmark_name).replace(/\+/gi, " ")
	                   			+ "</b><b style='font-size:14px; opacity:0.6'>&nbsp;"+decodeURIComponent(json.list[i].landmark_address).replace(/\+/gi, " ")+"</b></td></tr>"
	                   	}else{
	                  		values += "<tr style='height:50px;'><td style='width:380px;'><b style='padding-left:20px; font-size:17px;'>"
	                  			+decodeURIComponent(json.list[i].landmark_name).replace(/\+/gi, " ")
	                  			+ "</b><b style='font-size:14px; opacity:0.6'>&nbsp;&nbsp;"+decodeURIComponent(json.list[i].landmark_address).replace(/\+/gi, " ")+"</b></td></tr>"	
	                   		
	                   	}                    
	                   }
	                   $("#landmarklist").empty();
	                   $("#landmarklist").html($("#landmarklist").html()+values);
                    }
	            },
	            error:function(jqXHR, textstatus, errorthrown){
	    			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
	    		}
	        });
	    })
		
		function badge_form() {
			document.getElementById('bdg').submit();
		}

		function badge_form2() {
			document.getElementById('bdg2').submit();
		}

		function badge_form3() {
			document.getElementById('bdg3').submit();
		}

		function badge_form4() {
			document.getElementById('bdg4').submit();
		}

		function badge_form5() {
			document.getElementById('bdg5').submit();
		}

		function badge_form6() {
			document.getElementById('bdg6').submit();
		}
	</script>
</body>

</html>