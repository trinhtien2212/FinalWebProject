<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page import="vn.thegioicaycanh.model.Product.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.thegioicaycanh.model.Product.ProductEntity" %><%--
  Created by IntelliJ IDEA.
  User: TRAN NHAT THY
  Date: 01/01/2021
  Time: 12:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${title}</title>
    <%-- Link icon --%>
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
<jsp:include page="search_bar.jsp"></jsp:include>
<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Danh Mục</h4>
                        <ul>
                            <c:forEach var="cate" items="${applicationScope.category}">
                                <li><a href="filter-category-shopping?id=${cate.id}&pages=1">${cate.name}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="sidebar__item">
                        <h4>Giá</h4>
                        <div class="price-range-wrap">
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                 data-min="10" data-max="900">
                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                            </div>
                            <div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount">
                                    <input type="text" id="maxamount">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar__item">
                        <h4>Kích Thước</h4>
                        <a href="">
                            <div class="sidebar__item__size">
                                <label for="large">
                                    Lớn
                                    <input type="radio" id="large">
                                </label>
                            </div>
                        </a>
                        <div class="sidebar__item__size">
                            <label for="medium">
                                Trung Bình
                                <input type="radio" id="medium">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="small">
                                Nhỏ
                                <input type="radio" id="small">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="tiny">
                                Rất nhỏ
                                <input type="radio" id="tiny">
                            </label>
                        </div>
                    </div>
                    <div class="sidebar__item">
                        <div class="latest-product__text">
                            <h4>Mới Nhất</h4>
                            <div class="latest-product__slider owl-carousel">
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
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="filter__sort">
                                <span>Sắp xếp</span>
                                <select>
                                    <option value="0">Mới Nhất</option>
                                    <option value="0">Giá Cả</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span>16</span> sản phẩm đã tìm thấy</h6>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-3">
                            <div class="filter__option">
                                <a href="shop-grid.html"><span class="icon_grid-2x2"></span></a>
                                <a href="shop-list.html"><span class="icon_ul"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row shop_wrapper grid_list ">
                    <c:forEach items="${data}" var="sl">
                        <c:set var="p" value="${sl.price}"></c:set>
                        <div class="col-custom product-area col-12">
                            <div class="single-product position-relative">
                                <div class="product-image">
                                    <a class="d-block" href="product-details.html">
                                        <img src="${sl.img}" alt="${sl.name}"
                                             class="product-image-1 w-100">
                                    </a>
                                </div>
                                <div class="product-content-listview">
                                    <div class="product-item-text">
                                        <h5><a href="shop-details.html">${sl.name}</a></h5>
                                        <h6><%= Util.formatCurrency((double)pageContext.getAttribute("p"))%></h6>
                                    </div>
                                    <div class="add-action-listview d-flex">
                                        <ul class="product__item__pic__hover-1">
                                            <li><a href="#"><i class="fa fa-money"></i></a></li>
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <p class="desc-content">
                                        ${sl.description}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="product__pagination">
                    <c:if test="${pages>1}">
                        <a href="${back}"><i class="fa fa-angle-left"></i></a>
                    </c:if>
                    <c:forEach var="i" begin="${start}" end="${end}">
                        <c:if test="${pages==i}"><a href="${type_page}?pages=${i}" class="set_choose">${i}</a></c:if>
                        <c:if test="${pages!=i}"><a href="${type_page}?pages=${i}">${i}</a></c:if>
                    </c:forEach>
                    <c:if test="${isStill==true}"><a class="noneHover" href="">...</a></c:if>
                    <c:if test="${pages!=end}">
                        <a href="${next}">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </c:if>
                </div>
            </div>

        </div>
    </div>
    </div>
</section>
<!-- Product Section End -->

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