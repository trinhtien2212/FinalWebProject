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
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chi tiết đơn hàng</title>

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
    <c:out value="${applicationScope.address.get(0).address}"></c:out>
    <c:out value="${home_page_data.wel_img}"></c:out>
    <c:out value="${applicationScope.header.name}"></c:out>
    <c:out value="${discount_pros.size()}"></c:out>
    <jsp:include page="Menu.jsp"></jsp:include>

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

                    <div class="hero__item set-bg relative_pos" data-setbg="${home_page_data.wel_img}">
                        <div class="blur"></div>

                        <div class="hero__text relative_pos">
                            <span>${fn: toUpperCase(home_page_data.mes_1)}</span>
                            <h2 style="max-width: 60%">${home_page_data.mes_2}</h2>
                            <p>${home_page_data.mes_3}</p>
                            <a href="#" class="primary-btn">MUA NGAY</a>
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

    <!-- Categories Section Begin -->
    <section class="sale-intro container">
        <div class="section-title">
            <h4 class="tit-box">
                <a href="product-sale.html">Giảm giá</a>
            </h4>
        </div>
        <div class="row sale">
            <div class="categories__slider owl-carousel">
                <c:forEach var="dp" items="${discount_pros}">
                    <c:set var="price" value="${dp.price}"></c:set>
                    <c:set var="price_sale" value="${dp.price_sale}"></c:set>
                    <c:set var="c_id" value="${dp.category_id}"></c:set>
                <div class="col-lg-3">
                    <div class="product__discount__item">
                        <div class="product__discount__item__pic set-bg"
                             data-setbg="${dp.img}">
                            <div class="product__discount__percent">-${dp.percent_sale}%</div>
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-money"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__discount__item__text">
                            <h5><a href="#">${dp.name}</a></h5>

                            <div class="product__item__price"><%= Util.formatCurrency((double) pageContext.getAttribute("price_sale"))%><span><%= Util.formatCurrency((double)pageContext.getAttribute("price")) %></span></div>

                        </div>
<%--                        <div class="progress progress-style none-margin ">--%>
<%--                            <p class="text-muted">Còn ${dp.dayRest} ngày</p>--%>
<%--                            <div--%>
<%--                                    class="progress-bar bg-success pass_time"--%>
<%--                                    role="progressbar"--%>
<%--&lt;%&ndash;                                    style="width: ${dp.percent_sale_past}%"&ndash;%&gt;--%>
<%--                                    style="width:90%"--%>
<%--                            >--%>

<%--                            </div>--%>
<%--                            --%>
<%--                            <c:out value="${dp.percent_sale_past}"></c:out>--%>

<%--                        </div>--%>
                        <div  class="progress-style progress none-margin">
                            <div class="progress-bar bg-success progress-past" role="progressbar" style="width: ${dp.percent_sale_past}%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            <p class="progress-text text-muted">Còn ${dp.dayRest} ngày</p>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>

    </section>
    <!-- Categories Section End -->
    <!-- Featured Section Begin -->
    <section class="featured spad container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h4 class="tit-box">
                        <a href="shop-grid.html">Nổi bật</a>
                    </h4>
                </div>
                <div class="featured__controls max-width">
                    <ul>
                        <li class="active" data-filter="*">Tất cả</li>
                        <li data-filter=".cay-de-ban">Cây để bàn</li>
                        <li data-filter=".cay-day-leo">Cây dây leo</li>
                        <li data-filter=".cay-tet">Cây tết</li>
                        <li data-filter=".cay-thuy-sinh">Cây thủy sinh</li>
                        <li data-filter=".cay-trong-nha">Cây trong nhà</li>
                        <li data-filter=".cay-ngoai-vuon">Cây ngoài vườn</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="featured__filter" id="smooth-scrollbar" data-scrollbar>
            <div class="row height-prevent ">
                <c:forEach var="c" items="${hight_light_pros}">
                <c:set var="price" value="${c.price}"></c:set>
                    <c:if test="${c.category_id==1}"><div class="col-lg-3 col-md-4 col-sm-6 mix cay-de-ban"></c:if>
                    <c:if test="${c.category_id==2}"><div class="col-lg-3 col-md-4 col-sm-6 mix cay-day-leo"></c:if>
                    <c:if test="${c.category_id==3}"><div class="col-lg-3 col-md-4 col-sm-6 mix cay-tet"></c:if>
                    <c:if test="${c.category_id==4}"><div class="col-lg-3 col-md-4 col-sm-6 mix cay-thuy-sinh"></c:if>
                    <c:if test="${c.category_id==5}"><div class="col-lg-3 col-md-4 col-sm-6 mix cay-trong-nha"></c:if>
                    <c:if test="${c.category_id==6}"><div class="col-lg-3 col-md-4 col-sm-6 mix cay-ngoai-vuon"></c:if>
                            <div class="featured__item">
                            <div class="featured__item__pic set-bg" data-setbg="${c.img}">
                                <ul class="featured__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-money"></i></a></li>
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="featured__item__text">
                                <h6><a href="#">${c.name}</a></h6>
                                <h5><%= Util.formatCurrency((double) pageContext.getAttribute("price"))%></h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>

    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <a href="">
                        <img src="${home_page_data.sep_img}" alt="">
                    </a>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <a href="">
                        <img src="${home_page_data.sep_img2}" alt="">
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad container">

        <div class="section-title">
            <h4 class="tit-box">
                <a href="">Xem Thêm</a>
            </h4>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Mới nhất</h4>
                    <div class="latest-product__slider owl-carousel">
                        <c:forEach var="i" begin="0" end="2" step="1">
                            <div class="latest-prdouct__slider__item">
                                <c:forEach var="j" begin="${i*3}" end="${i*3+2}" step="1">
                                    <c:set var="np" value="${new_pros.get(j)}"></c:set>
                                <c:set var="price_new_pos" value="${np.price}"></c:set>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic fix_size">
                                        <img src="${np.img}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <!-- Phần này chưa đổi tiếng việt nè -->
                                        <h6>${np.name}</h6>
                                        <span><%= Util.formatCurrency((double)pageContext.getAttribute("price_new_pos")) %></span>
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Đánh giá cao nhất</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic fix_size">
                                    <img src="img/latest-product/cuc-tan-an-do-35.jpg" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Cây cúc tần Ấn Độ</h6>
                                    <span>35.000 VNĐ</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic fix_size">
                                    <img src="img/latest-product/luoi-ho-thai-69.jpg" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Cây lưỡi hổ thái</h6>
                                    <span>69.000 VNĐ</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic fix_size">
                                    <img src="img/featured/xuong-rong-tai-tho.jpg" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Xương Rồng tai thỏ</h6>
                                    <span>36.000 VNĐ</span>
                                </div>
                            </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic fix_size">
                                    <img src="img/cay-de-ban/xuong-rong-nui.jpg" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Xương rồng núi</h6>
                                    <span>66.000 VNĐ</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic fix_size">
                                    <img src="img/cay-de-ban/cay-mong-rong.jpg" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Cây móng rồng</h6>
                                    <span>64.000 VNĐ</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic fix_size">
                                    <img src="img/featured/cay-binh-an.jpg" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Cây bình an</h6>
                                    <span>149.000 VNĐ</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Dành cho bạn</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic fix_size">
                                    <img src="img/cay-de-ban/xuong-rong-astro.jpg" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Cây xương rồng Astro</h6>
                                    <span>79.000 VNĐ</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic fix_size">
                                    <img src="img/latest-product/truc-day-leo-110.jpg" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Trúc dây leo</h6>
                                    <span>110.000 VNĐ</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic fix_size">
                                    <img src="img/latest-product/tieu-thao-xoan-19.jpg" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Cây tiểu thảo xoắn</h6>
                                    <span>39.000 VNĐ</span>
                                </div>
                            </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic fix_size">
                                    <img src="img/latest-product/cay-anh-duong.jpg" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Cây ánh dương</h6>
                                    <span>250.000 VNĐ</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic fix_size">
                                    <img src="img/latest-product/cam-tu-mai-30.jpg" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Cây cẩm tú mai</h6>
                                    <span>30.000 VNĐ</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic fix_size">
                                    <img src="img/latest-product/cay-bong-trang-90.jpg" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Cây bông trang</h6>
                                    <span>90.000 VNĐ</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- Latest Product Section End -->

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
