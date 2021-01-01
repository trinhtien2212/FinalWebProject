
<%@ page import="vn.thegioicaycanh.model.home_page.Home_page" %>
<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page import="vn.thegioicaycanh.model.header_footer.Category" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 25/12/2020
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--<%@ page import="vn.thegioicaycanh.model.util.Util" %>--%>
<!DOCTYPE html>
<html lang="vi-VN">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Blog</title>

    <%--    <c:set var="header" scope="application" value="${applicationScope.header}"></c:set>--%>
    <link href="${applicationScope.header.shortcut}" rel="shortcut icon">



    <!-- Css Styles -->
    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">
</head>
<body>
<jsp:include page="Menu.jsp"></jsp:include>
<%--<jsp:include page="search_bar.jsp"></jsp:include>--%>
<!-- Hero Section Begin -->
<section class="hero">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Danh Mục</span>
                    </div>
                    <ul>
                        <c:forEach var="cate" items="${applicationScope.category}">
                            <li><a href="/${cate.slug}">${cate.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <input type="text" placeholder="Tên cây cảnh">
                            <button type="submit" class="site-btn">TÌM KIẾM</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>${applicationScope.address.get(0).phone}</h5>
                            <span>Hỗ trợ 24/7</span>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Begin banner top -->
<section class="container ">
    <div class=" banner_top row set-bg" data-setbg="imgs/home/bg1.png">
        <div class="col-lg-12">
            <h2>${applicationScope.header.name}</h2>
            <div class="row">
                <c:forEach var="mes" items="${home_page_data.mes_sep}">
                    <p>${mes}</p>
                </c:forEach>
            </div>
        </div>
    </div>
</section>


<!-- Blog Section Begin -->
<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-5">
                <div class="blog__sidebar">
                    <div class="blog__sidebar__search">
                        <form action="#">
                            <input type="text" placeholder="Tìm kiếm...">
                            <button type="submit"><span class="icon_search"></span></button>
                        </form>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>Danh Mục</h4>
                        <ul>
                            <li><a href="#">Tất Cả</a></li>
                            <li><a href="#">Chăm Sóc Cây (20)</a></li>
                            <li><a href="#">Trồng Cây (5)</a></li>
                            <li><a href="#">Lợi Ích Của Cây (9)</a></li>
                            <li><a href="#">Trang Trí Cây (10)</a></li>
                        </ul>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>Tin Tức Mới</h4>
                        <div class="latest-product__slider owl-carousel">
                            <c:forEach var="i" begin="0" end="2" step="1">
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach var="j" begin="${i*4}" end="${i*4+3}" step="1">
                                        <c:set var="nb" value="${newBlog.get(j)}"></c:set>

                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic fix_size blog__sidebar__recent__item__pic">
                                                <img src="${nb.avatar}" alt="blog-avatar">
                                            </div>
                                            <div class="blog__sidebar__recent__item__text">
                                                <h6>${nb.name}</h6>
                                                <span>${nb.date_created}</span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>Tìm Kiếm Nhiều</h4>
                        <div class="blog__sidebar__item__tags">
                            <a href="#">Bạch Mã Hoàng Tử</a>
                            <a href="#">Dâu Tây</a>
                            <a href="#">Kim Tiền</a>
                            <a href="#">Lưỡi Hổ</a>
                            <a href="#">Mai</a>
                            <a href="#">Đẹp</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-7">
                <div class="row">
                    <c:forEach var="b" items="${blog_data}">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="${b.avatar}" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i>${b.date_created}</li>
                                    <li><i class="fa fa-comment-o"></i> ${b.id}</li>
                                </ul>
                                <h5><a href="blog-details.html">${b.name}</a></h5>
                                    <%--                    <p>Trong nhà của bạn không thể thiếu cây xanh phải không. Cây xanh mang đến không gian sống trong lành, thư thái và thoải mái. Cây xanh còn giúp…</p>--%>
                                <a href="blog-details.html" class="blog__btn">ĐỌC THÊM <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="col-lg-12">
                        <div class="product__pagination blog__pagination">
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->

<jsp:include page="footer.jsp"></jsp:include>
<!-- Js Plugins -->
<script src="user_page/js/jquery-3.3.1.min.js"></script>
<script src="user_page/js/bootstrap.min.js"></script>
<script src="user_page/js/jquery.nice-select.min.js"></script>
<script src="user_page/js/jquery-ui.min.js"></script>
<script src="user_page/js/jquery.slicknav.js"></script>
<script src="user_page/js/mixitup.min.js"></script>
<script src="user_page/js/owl.carousel.min.js"></script>
<script src="user_page/js/main.js"></script>

</body>
</html>
