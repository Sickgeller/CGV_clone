<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CGV</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
	<div id="cgvwrap">
		<!-- 헤더 영역 -->
		<header class="header">
			<div class="header_content">
				<div class="contents">
					<h1>
						<a href="${pageContext.request.contextPath}/"><img
							src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png"
							alt="CGV" /></a>
					</h1>
					<ul class="memberInfo_wrap">
						<li><a href="${pageContext.request.contextPath}/member/loginForm.do">로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/member/registerForm.do">회원가입</a></li>
						<li><a href="${pageContext.request.contextPath}/user/mycgv">MY
								CGV</a></li>
						<li><a href="${pageContext.request.contextPath}/support">고객센터</a></li>
					</ul>
				</div>
			</div>
			<!-- 메인 네비게이션 -->
			<nav class="nav_menu">
				<ul>
					<li><a href="${pageContext.request.contextPath}/movies">영화</a></li>
					<li><a href="${pageContext.request.contextPath}/theaters">극장</a></li>
					<li><a href="${pageContext.request.contextPath}/ticket">예매</a></li>
					<li><a href="${pageContext.request.contextPath}/event">이벤트</a></li>
				</ul>
			</nav>
		</header>

		<!-- 메인 컨텐츠 영역 -->
		<div id="container">
			<!-- 현재 상영작 -->
			<section class="movie_current">
				<h2>현재 상영작</h2>
				<div class="movie_list">
					<!-- 영화 목록이 들어갈 자리 -->
				</div>
			</section>

			<!-- 개봉 예정작 -->
			<section class="movie_upcoming">
				<h2>개봉 예정작</h2>
				<div class="movie_list">
					<!-- 영화 목록이 들어갈 자리 -->
				</div>
			</section>

			<!-- 이벤트 섹션 -->
			<section class="event_section">
				<h2>이벤트</h2>
				<div class="event_list">
					<!-- 이벤트 목록이 들어갈 자리 -->
				</div>
			</section>
		</div>

		<!-- 푸터 영역 -->


		
	</div>
	<footer class="footer">
		<div class="footer_content">
			<div class="footer_info">
				<p>&copy; CJ CGV. All Rights Reserved</p>
			</div>
		</div>
		<!-- 상단으로 이동 버튼 -->
		<div class="btn_gotoTop">
			<a href="${pageContext.request.contextPath}#" title="최상단으로 이동">↑</a>
		</div>
	</footer>
	<script>
        $(document).ready(function() {
            // 스크롤 이벤트 처리
            $(window).scroll(function() {
                var headerOffsetT = $('.header').offset().top;
                var headerOuterH = $('.header').outerHeight(true);
                var fixedHeaderPosY = headerOffsetT + headerOuterH;
                var scrollT = $(this).scrollTop();
                var scrollL = $(this).scrollLeft();

                // 헤더 고정
                if (scrollT >= fixedHeaderPosY) {
                    $('.nav_menu').addClass('fixed');
                    $('.btn_gotoTop').addClass('show');
                } else {
                    $('.nav_menu').removeClass('fixed');
                    $('.btn_gotoTop').removeClass('show');
                }

                // 좌우 스크롤 처리
                if ($('.nav_menu').hasClass('fixed')) {
                    $('.nav_menu').css({ 'left': -1 * scrollL });
                } else {
                    $('.nav_menu').css({ 'left': 0 });
                }
            });

            // 상단으로 이동 버튼
            $('.btn_gotoTop').on('click', function(e) {
                e.preventDefault();
                $('html, body').stop().animate({
                    scrollTop: '0'
                }, 400);
            });
        });
    </script>
</body>
</html>