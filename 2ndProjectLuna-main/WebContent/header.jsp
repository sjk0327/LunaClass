<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>

<link
	href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<link rel="stylesheet" href="css/jquery.fancybox.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">

<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">


<style type="text/css">
#navProfile {
	height: 30px;
	width: 30px;
	border-radius: 50%;
}
</style>

<div class="site-mobile-menu site-navbar-target">
	<div class="site-mobile-menu-header">
		<div class="site-mobile-menu-close mt-3">
			<span class="icon-close2 js-menu-toggle"></span>
		</div>
	</div>
	<div class="site-mobile-menu-body"></div>
</div>

<div class="border-bottom top-bar py-2 bg-dark" id="home-section">
	<div class="container">
		<div class="row">
			<div class="col-md-6"></div>
			<div class="col-md-6">
				<ul class="social-media">
					<c:if test="${empty authUser}">
						<li><a href="login.do" style="font-weight: bold;"><span>?????????</span></a></li>
						<li><span> </span></li>
						<li><a href="Join.do" style="font-weight: bold;"><span>????????????</span></a></li>
					</c:if>
					<c:if test="${! empty authUser}">
						<c:if test="${authUser.id!='admin'}">
							<li class="mr-3"><c:set var="picRoot"
									value="${authUser.pic}" /> <c:choose>
									<c:when test="${empty picRoot}">
										<a href="myPage.do" style="font-weight: bold;"> <img
											id="navProfile" class="mr-1" src="images/profile.png" /> <span>${authUser.name}???</span>
										</a>
									</c:when>
									<c:otherwise>
										<a href="myPage.do" style="font-weight: bold;"> <img
											id="navProfile" class="mr-1"
											src="<%=request.getContextPath()%>/upload/profile/${authUser.pic}" />
											<span>${authUser.name}???</span>
										</a>
									</c:otherwise>
								</c:choose></li>
							<li><a href="logout.do"><span>????????????</span></a></li>
						</c:if>
						<c:if test="${authUser.id=='admin'}">
							<li><a href="Customer_List.do" style="font-weight: bold;"><span>${authUser.name}???</span></a></li>
							<li><span> </span></li>
							<li><a href="logout.do" style="font-weight: bold;"><span>Logout</span></a></li>

						</c:if>

					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>

<header
	class="site-navbar py-4 bg-white js-sticky-header site-navbar-target"
	role="banner">

	<div class="container">
		<div class="row align-items-center">

			<div class="col-11 col-xl-2">
			<c:if test="${authUser.id=='admin'}">
             <h1 class="mb-0 site-logo"><a href="MagQnAlist.do" class="text-black h2 mb-0">LunaClass<span class="text-primary">.</span> </a></h1>
             
              </c:if>
			
			<c:if test="${authUser.id!='admin'}">
				<h1 class="mb-0 site-logo">
					<a href="index.do" class="text-black h2 mb-0">LunaClass<span
						class="text-primary">.</span>
					</a>
				</h1>
				</c:if>
			</div>
			<div class="col-12 col-md-10 d-none d-xl-block">
				<nav class="site-navigation position-relative text-right"
					role="navigation">

					<ul
						class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
						<li><a href="index.do" class="nav-link" onclick="javascript:window.location='index.do'">???</a></li>
						 <% 
   		  
   		String path="myClassList.do";
			
			request.getSession().setAttribute("path", path);
			
			
			String path1="index.do";
			
			request.getSession().setAttribute("path1", path1);
   		  
   		   %>
						<li><a href="myClassList.do" class="nav-link" onclick="javascript:window.location='myClassList.do'">????????????</a></li>

						<li class="has-children"><a href="classList.do"
							class="nav-link" onclick="javascript:window.location='classList.do'">????????????</a>
							<ul class="dropdown">
								<li><a href="classList.do?CL_CATEGORY=art" onclick="javascript:window.location='classList.do?CL_CATEGORY=art'">??????</a></li>
								<li><a href="classList.do?CL_CATEGORY=life" onclick="javascript:window.location='classList.do?CL_CATEGORY=life'">??????, ??????</a></li>
								<li><a href="classList.do?CL_CATEGORY=health" onclick="javascript:window.location='classList.do?CL_CATEGORY=health'">??????, ??????</a></li>
								<li><a href="classList.do?CL_CATEGORY=development" onclick="javascript:window.location='classList.do?CL_CATEGORY=development'">IT/??????</a></li>
								<li><a href="classList.do?CL_CATEGORY=therapy" onclick="javascript:window.location='classList.do?CL_CATEGORY=therapy'">??????</a></li>
								<li><a href="classList.do?CL_CATEGORY=etc" onclick="javascript:window.location='classList.do?CL_CATEGORY=etc'">??????</a></li>
							</ul>
						<li class="has-children"><a href="Cus_Guide.do"
							class="nav-link" onclick="javascript:window.location='QnAlist.do'">????????????</a>
							<ul class="dropdown">
								<li><a href="Cus_Guide.do" onclick="javascript:window.location='Cus_Guide.do'">?????? ?????????</a></li>
								<li><a href="Notice_List.do" onclick="javascript:window.location='Notice_List.do'">????????????</a></li>
								<li><a href="FnQShow.do" onclick="javascript:window.location='FnQShow.do'">?????? ?????? ??????</a></li>
								<li><a href="QnAlist.do" onclick="javascript:window.location='QnAlist.do'">????????????</a></li>
								<li><a href="Cus_Location.do" onclick="javascript:window.location='Cus_Location.do'">?????? ?????? ??????</a></li>
							</ul>
					</ul>
				</nav>
			</div>
			<div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3"
				style="position: relative; top: 3px;">
				<a href="#" class="site-menu-toggle js-menu-toggle text-black"><span
					class="icon-menu h3"></span></a>
			</div>
		</div>
	</div>
</header>
