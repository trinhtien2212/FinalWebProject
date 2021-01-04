<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page import="vn.thegioicaycanh.model.home_page.Home_page" %>
<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page import="vn.thegioicaycanh.model.header_footer.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.thegioicaycanh.model.blog.Blog_Con_DB" %>
<%@ page import="vn.thegioicaycanh.model.blog.Blog_Con_DB" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
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
<%--<div class="invisible_type_page">${type_page}</div>--%>
<%--<div class="invisible_url">${url}</div>--%>
<jsp:include page="Menu.jsp"></jsp:include>

<jsp:include page="search_bar.jsp"></jsp:include>
<!-- Breadcrumb Section End -->
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
                                <c:if test="${cate.id==cate_id}">
                                    <li><a class="set_choose" href="${type_page}?cate_id=${cate.id}&${url}">${cate.name}</a></li>
                                </c:if>
                                <c:if test="${cate.id != cate_id}">
                                    <li><a href="${type_page}?cate_id=${cate.id}&${url}">${cate.name}</a></li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="sidebar__item">
                        <h4>Giá</h4>
                        <div class="price-range-wrap">
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                 data-min="${price_min}" data-max="${price_max}" data-maxi="${max_price}" data-mini="${min_price}"
                                    data-type_page ="${type_page}" data-url="${url}">
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
                        <c:forEach var="i" begin="1" end="4">
                        <div class="sidebar__item__size">
                            <label for="${i}" <c:if test="${type_size==i}">class="set_choose"</c:if>>
                            <c:out value="${type_weight_map.get(i)}"></c:out>
                                <input  type="radio" id="${i}" onclick="radio_input('${type_page}?type_size=${i}&${url}')">
                            </label>
                        </div>
                        </c:forEach>
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
                                <select id="select_sort">
                                    <c:if test="${sort_id==0}">
                                        <option value="" disabled selected>Chọn sắp xếp</option>
                                        <option value="${type_page}?sort_id=1&${url}">Mới Nhất</option>
                                        <option value="${type_page}?sort_id=2&${url}">Giá thấp đến cao</option>
                                        <option value="${type_page}?sort_id=3&${url}">Giá cao đến thấp</option>
                                    </c:if>
                                    <c:if test="${sort_id==1}">
                                        <option value="" disabled selected>Chọn sắp xếp</option>
                                        <option value="${type_page}?sort_id=1&${url}" selected>Mới Nhất</option>
                                        <option value="${type_page}?sort_id=2&${url}">Giá thấp đến cao</option>
                                        <option value="${type_page}?sort_id=3&${url}">Giá cao đến thấp</option>
                                    </c:if>
                                    <c:if test="${sort_id==2}">
                                        <option value="" disabled selected>Chọn sắp xếp</option>
                                        <option value="${type_page}?sort_id=1&${url}">Mới Nhất</option>
                                        <option value="${type_page}?sort_id=2&${url}" selected>Giá thấp đến cao</option>
                                        <option value="${type_page}?sort_id=3&${url}">Giá cao đến thấp</option>
                                    </c:if>
                                    <c:if test="${sort_id==3}">
                                        <option value="" disabled selected>Chọn sắp xếp</option>
                                        <option value="${type_page}?sort_id=1&${url}">Mới Nhất</option>
                                        <option value="${type_page}?sort_id=2&${url}">Giá thấp đến cao</option>
                                        <option value="${type_page}?sort_id=3&${url}" selected>Giá cao đến thấp</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span>${sumOfItems}</span> sản phẩm đã tìm thấy</h6>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-3">
                            <div class="filter__option">
                                <c:if test="${type_view==1}">
                                    <a href="${type_page}?type_view=1&${url}"><span class="icon_grid-2x2 set_choose"></span></a>
                                    <a href="${type_page}?type_view=2&${url}"><span class="icon_ul "></span></a>
                                </c:if>
                                <c:if test="${type_view==2}">
                                    <a href="${type_page}?type_view=1&${url}"><span class="icon_grid-2x2 "></span></a>
                                    <a href="${type_page}?type_view=2&${url}"><span class="icon_ul set_choose"></span></a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="sgd" items="${data}">
                        <c:set var="p" value="${sgd.price}"></c:set>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="${sgd.img}">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-money"></i></a></li>
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="shop-details.html">${sgd.name}</a></h6>
                                <h5><%= Util.formatCurrency((double)pageContext.getAttribute("p")) %></h5>
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
                        <c:if test="${pages==i}"><a href="${type_page}?pages=${i}${url}" class="set_choose">${i}</a></c:if>
                        <c:if test="${pages!=i}"><a href="${type_page}?pages=${i}${url}">${i}</a></c:if>
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