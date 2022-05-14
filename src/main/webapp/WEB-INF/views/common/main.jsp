<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	    <title>Makaan - Real Estate HTML Template</title>
		<c:import url="/WEB-INF/views/parts/head.jsp" />
		<style type="text/css">
			.img-wrapper {
			    width: 100%;
				height: 75vh;			    
			    background-repeat: no-repeat;
			    background-size: cover;
			    background-position: center;
			}
			
			img.photo {
				width:100%;
				height:100%;				
				padding:0px;
				object-fit: cover;				
				align:center;
			}
			#btnwhite:hover{
			color:white;
			}
		</style>
	</head>
	<body>
	    <div class="container-xxl bg-white p-0">
	        <!-- Spinner Start -->
	        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
	            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
	                <span class="sr-only">Loading...</span>
	            </div>
	        </div>
	        <!-- Spinner End -->
	
	        <!-- Navbar Start -->
			<c:import url="/WEB-INF/views/parts/navi.jsp" />
	        <!-- Navbar End -->
	
	        <!-- Header Start -->
	        <div class="container-fluid header bg-white p-0">
		        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-indicators">
						<c:forEach items="${ requestScope.banner }" var="b" varStatus="st">
						<c:if test="${ st.index eq 0 }">
							<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						</c:if>
						<c:if test="${ st.index ne 0 }">
							<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${ st.index }" aria-label="Slide ${ st.count }"></button>
						</c:if>
						</c:forEach>						
					</div>
					<div class="carousel-inner">
					<!-- -------------------------- -->					
						<c:forEach items="${ requestScope.banner }" var="b" varStatus="st">
						<c:if test="${ st.count eq 1 }"> 
							<div class="carousel-item active img-wrapper" style="background-image: url('${ pageContext.servletContext.contextPath }/resources/banner/${ b.photo_path }');">
								<div class=" d-md-block" style="position:absolute;bottom:4%; left:3%;text-shadow: 2px 2px 4px black; color:white;">
									<div class="mb-2 wow slideInLeft" data-wow-delay="0.2s">
										<b style="font-size:22px;">${ b.banner_title }</b>
									</div>
									<div class="mb-2 wow fadeInUp" data-wow-delay="0.3s">
										${ b.banner_content }
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${ st.count ne 1 }">
							<div class="carousel-item img-wrapper" style="background-image: url('${ pageContext.servletContext.contextPath }/resources/banner/${ b.photo_path }');">
								<div class=" d-md-block wow fadeInUp" data-wow-delay="0.2s" style="position:absolute;bottom:4%; left:3%;text-shadow: 2px 2px 4px black; color:white;">
									<div class="mb-2">
										<b style="font-size:22px;">${ b.banner_title }</b>
									</div>
									${ b.banner_content }
								</div>
							</div>
						</c:if>									
						</c:forEach>
					<!-- -------------------------- -->	
						
						
					<!-- ----------------------------- -->	
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
	        </div>
	        <!-- Header End -->
	
	
	        <!-- Property List Start -->
	        <div class="container-xxl py-5">
	            <div class="container">
 	                <div class="row g-0 gx-5 wow fadeInUp"data-wow-delay="0.3s">
	                    <div class="col-lg-12" >
	                        <div class="text-center mx-auto mb-5 ">
	                            <span style="font-weight:500; font-size:26px; opacity:0.9">New Post</span>
	                        </div>
	                    </div>    
	                </div>
	                <div class="tab-content">
	                    <div id="tab-1" class="tab-pane fade show p-0 active">
	                        <div class="row g-4">
	                            <!-- ----------------- -->
	                            <c:forEach items="${ requestScope.new3 }" var="n">
	                            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
	                                <div class="property-item rounded overflow-hidden" style="align: center; vertical-align: middle;">
	                                    <div class="position-relative overflow-hidden" style="align: center; vertical-align: middle;">
	                                        <a href="http://www.landmarker.p-e.kr:8080/landmarker/gdetailview.do?g_no=${ n.gallery_no }">
	                                        	<img style="width: 520px; height: 400px; object-fit: cover; padding:0px; align: center; vertical-align: middle;" 
	                                        	class="img-fluid photo" src="http://www.landmarker.p-e.kr:8080/static/gallery_images/${ n.photo_path }" >
	                                        </a>
	                                        <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-2 py-1 px-2">${ n.hashtag }</div>
	                                    </div>
	                                    <div class="p-3 pb-0">
	                                        <h5 class="text-primary mb-2" style="float:left; margin:0px 10px 0px 0px;">${ n.user_name }</h5>
											<h8 class="text-primary mb-3" style="float:left; margin:0px 10px 0px 0px;">${ n.user_badge }</h8>
											<c:if test="${ n.user_like ne 0 }">
												<c:url var="heartX" value="heart.do">
													<c:param name="heart" value="0" />
													<c:param name="g_no" value="${ n.gallery_no }" />
												</c:url>										
												<a href="${ heartX }"><i class="bi bi-heart-fill fs-5" style="float:right; color:#e06666;"></i></a>
											</c:if>
											<c:if test="${ n.user_like eq 0 }">
												<c:url var="heartO" value="heart.do">
													<c:param name="heart" value="1" />
													<c:param name="g_no" value="${ n.gallery_no }" />
												</c:url>
											<a href="${ heartO }"><i class="bi bi-heart fs-5" style="float:right;"></i></a>
											</c:if>
	                                    </div>
	                                </div>
	                            </div>
	                            </c:forEach>
	                            <div class="col-lg-12 text-end wow slideInRight" style="height:30px;" data-wow-delay="0.1s">
	                             <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
			                           <li>
			                               <a id="btnwhite"class="btn btn-outline-primary" href="${ pageContext.servletContext.contextPath }/resources/#tab-1">더보기</a>
			                           </li>
			                       </ul>
	                               <!-- <a class="btn btn-outline-primary" href="${ pageContext.servletContext.contextPath }/resources/#tab-1">더보기</a>-->
			                   </div>
	                            <!-- ----------------- -->
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- Property List End -->

	
	        <!-- Testimonial Start -->
	        <div class="container-xxl py-4 wow fade show fadeInUp" style="background:#EEEEEE;" data-wow-delay="0.3s">
	            <div class="container">
	                <div class="row g-0 gx-5 wow fadeInUp"data-wow-delay="0.4s">
	                    <div class="col-lg-12" style="padding">
	                        <div class="text-center mx-auto mb-3 ">
	                            <span style="font-weight:900; font-size:28px; opacity:0.9; color:#00B98E;">"Hot Post"</span>
	                        </div>
	                    </div>    
	                </div>
	                <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
                   	    <!-- --------------- -->
                   	    <c:forEach items="${ requestScope.hot }" var="n">
                   	    <div class="testimonial-ite wow fadeInUp rounded p-3" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden" style="background:white;">
                                <div class="position-relative overflow-hidden" style="max-width:600px; max=height:400px; padding:0px; align:center; vertical-align:middle;">
                                    <a href="http://www.landmarker.p-e.kr:8080/landmarker/gdetailview.do?g_no=${ n.gallery_no }">
                                    	<img style="height:400px; width:600px; object-fit: cover; align: center; vertical-align: middle;" class="img-fluid photo" src="http://www.landmarker.p-e.kr:8080/static/gallery_images/${ n.photo_path }" style="padding:0px;">
                                    </a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-2 py-1 px-2">${ n.hashtag }</div>
<!--	                            <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">Appartment</div>-->
                                </div>
                                <div class="p-3 pb-0">
                                    <h5 class="text-primary mb-2" style="float:left; margin:0px 10px 0px 0px;">${ n.user_name }</h5>
									<h8 class="text-primary mb-3" style="float:left; margin:0px 10px 0px 0px;">${ n.user_badge }</h8>
									<c:if test="${ n.user_like ne 0 }">
										<c:url var="heartX" value="heart.do">
											<c:param name="heart" value="0" />
											<c:param name="g_no" value="${ n.gallery_no }" />
										</c:url>										
										<a href="${ heartX }"><i class="bi bi-heart-fill fs-5" style="float:right; color:#e06666;"></i></a>
									</c:if>
									<c:if test="${ n.user_like eq 0 }">
										<c:url var="heartO" value="heart.do">
											<c:param name="heart" value="1" />
											<c:param name="g_no" value="${ n.gallery_no }" />
										</c:url>
									<a href="${ heartO }"><i class="bi bi-heart fs-5" style="float:right;"></i></a>
									</c:if>
 
                                </div>

                            </div>
                        </div>
                        </c:forEach>
                        <!-- ------- -->
                   	    
	                </div>
	            </div>
	        </div>
	        <!-- Testimonial End -->
	        
	
	        <!-- Footer Start -->
	        <c:import url="/WEB-INF/views/parts/footer.jsp" />
	        <!-- Footer End -->
	
	
	        <!-- Back to Top -->
	        <!-- <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a> -->
	    </div>
	    
		<c:import url="/WEB-INF/views/parts/foot.jsp" />
	</body>
</html>