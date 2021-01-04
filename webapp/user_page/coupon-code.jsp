<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 04/01/2021
  Time: 2:06 CH
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
    <title>${title}</title>

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

<body>
<jsp:include page="Menu.jsp"></jsp:include>
<jsp:include page="search_bar.jsp"></jsp:include>

<!-- Edit code here -->
<div>
    <!-- Stick element -->
    <div class="sticky-top">
        <div class="container">
            <div class="row">
                <select id="selectest" class="mdb-select md-form col-md-2 mx-3">
                    <c:if test="${cat_id==0}">
                    <option value="" disabled selected>Chọn loại</option>
                    <option value="${type_page}?cat_id=1&${url}" >Sản phẩm khuyến mãi</option>
                    <option value="${type_page}?cat_id=2&${url}">Mã khuyến mãi</option>
                    </c:if>
                    <c:if test="${cat_id==1}">
                        <option value="" disabled selected>Chọn loại</option>
                        <option value="${type_page}?cat_id=1&${url}" selected >Sản phẩm khuyến mãi</option>
                        <option value="${type_page}?cat_id=2&${url}">Mã khuyến mãi</option>
                    </c:if>
                    <c:if test="${cat_id==2}">
                        <option value="" disabled selected>Chọn loại</option>
                        <option value="${type_page}?cat_id=1&${url}" >Sản phẩm khuyến mãi</option>
                        <option value="${type_page}?cat_id=2&${url}" selected>Mã khuyến mãi</option>
                    </c:if>
                </select>
                <select class="mdb-select md-form col-md-2 mx-3">
                    <c:if test="${sortedprice_id==0}">
                    <option value="" disabled selected>Sắp xếp</option>
                    <option value="${type_page}?sortedprice_id=1&${url}">Giá Cao xuống thấp</option>
                    <option value="${type_page}?sortedprice_id=2&${url}">Giá thấp xuống cao</option>
                    </c:if>
                    <c:if test="${sortedprice_id==1}">
                        <option value="" disabled selected>Sắp xếp</option>
                        <option value="${type_page}?sortedprice_id=1&${url}" selected>Giá Cao xuống thấp</option>
                        <option value="${type_page}?sortedprice_id=2&${url}">Giá thấp xuống cao</option>
                    </c:if>
                    <c:if test="${sortedprice_id==2}">
                        <option value="" disabled selected>Sắp xếp</option>
                        <option value="${type_page}?sortedprice_id=1&${url}">Giá Cao xuống thấp</option>
                        <option value="${type_page}?sortedprice_id=2&${url}" selected>Giá thấp xuống cao</option>
                    </c:if>
                </select>
                <select class="mdb-select md-form col-md-2 mx-3">
                    <c:if test="${sorteddate_id==0}">
                    <option value="" disabled selected>Ngày hết hạn</option>
                    <option value="${type_page}?sorteddate_id=1&${url}">Hôm nay</option>
                    <option value="${type_page}?sorteddate_id=2&${url}">> 1 ngày</option>
                    <option value="${type_page}?sorteddate_id=3&${url}">> 1 Tuần</option>
                    <option value="${type_page}?sorteddate_id=4&${url}">> nửa tháng</option>
                    <option value="${type_page}?sorteddate_id=5&${url}"> 1 tháng</option>
                    </c:if>
                    <c:if test="${sorteddate_id==1}">
                        <option value="" disabled selected>Ngày hết hạn</option>
                        <option value="${type_page}?sorteddate_id=1&${url}" selected>Hôm nay</option>
                        <option value="${type_page}?sorteddate_id=2&${url}">> 1 ngày</option>
                        <option value="${type_page}?sorteddate_id=3&${url}">> 1 Tuần</option>
                        <option value="${type_page}?sorteddate_id=4&${url}">> nửa tháng</option>
                        <option value="${type_page}?sorteddate_id=5&${url}"> 1 tháng</option>
                    </c:if>
                    <c:if test="${sorteddate_id==2}">
                        <option value="" disabled selected>Ngày hết hạn</option>
                        <option value="${type_page}?sorteddate_id=1&${url}">Hôm nay</option>
                        <option value="${type_page}?sorteddate_id=2&${url}" selected>> 1 ngày</option>
                        <option value="${type_page}?sorteddate_id=3&${url}">> 1 Tuần</option>
                        <option value="${type_page}?sorteddate_id=4&${url}">> nửa tháng</option>
                        <option value="${type_page}?sorteddate_id=5&${url}"> 1 tháng</option>
                    </c:if>
                    <c:if test="${sorteddate_id==3}">
                        <option value="" disabled selected>Ngày hết hạn</option>
                        <option value="${type_page}?sorteddate_id=1&${url}">Hôm nay</option>
                        <option value="${type_page}?sorteddate_id=2&${url}">> 1 ngày</option>
                        <option value="${type_page}?sorteddate_id=3&${url}" selected>> 1 Tuần</option>
                        <option value="${type_page}?sorteddate_id=4&${url}">> nửa tháng</option>
                        <option value="${type_page}?sorteddate_id=5&${url}"> 1 tháng</option>
                    </c:if>
                    <c:if test="${sorteddate_id==4}">
                        <option value="" disabled selected>Ngày hết hạn</option>
                        <option value="${type_page}?sorteddate_id=1&${url}">Hôm nay</option>
                        <option value="${type_page}?sorteddate_id=2&${url}">> 1 ngày</option>
                        <option value="${type_page}?sorteddate_id=3&${url}">> 1 Tuần</option>
                        <option value="${type_page}?sorteddate_id=4&${url}" selected>> nửa tháng</option>
                        <option value="${type_page}?sorteddate_id=5&${url}"> 1 tháng</option>
                    </c:if>
                    <c:if test="${sorteddate_id==5}">
                        <option value="" disabled selected>Ngày hết hạn</option>
                        <option value="${type_page}?sorteddate_id=1&${url}">Hôm nay</option>
                        <option value="${type_page}?sorteddate_id=2&${url}">> 1 ngày</option>
                        <option value="${type_page}?sorteddate_id=3&${url}">> 1 Tuần</option>
                        <option value="${type_page}?sorteddate_id=4&${url}">> nửa tháng</option>
                        <option value="${type_page}?sorteddate_id=5&${url}" selected> 1 tháng</option>
                    </c:if>
                </select>
            </div>
        </div>
    </div>
    <!-- Stick element -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <img src="img/sale/flash.gif" alt="flash sale" />
                        <img src="img/sale/giamSoc.png" alt="gia soc" />
                    </div>
                    <!-- Sửa featured_controls thành code_sale_controls -->
                    <div class="code_sale_controls">
                        <ul>
                            <li class="active" id="addShow_imme" data-filter="*">
                                Tất cả
                            </li>
                            <li data-filter=".code-percen">Mã giảm giá</li>
                            <li data-filter=".code-momo">Mã giảm giá momo</li>
                            <li data-filter=".code-freeship">Miễn phí vận chuyển</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Sửa featured__filter thành code_sale_filter -->
            <div class="code_sale_filter">
                <div class="row">
                    <c:forEach var="c" items="${jk}">

                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-percen">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/coupon-code.png"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-percen">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/coupon-code.png"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-percen">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/coupon-code.png"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-percen">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/coupon-code.png"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- -------------------Viet moi -->
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-momo">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/momo.jpg"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-momo">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/momo.jpg"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-momo">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/momo.jpg"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-momo">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/momo.jpg"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-momo">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/momo.jpg"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-freeship">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/freeship.png"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-freeship">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/freeship.png"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-freeship">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/freeship.png"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-freeship">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/freeship.png"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 mix code-freeship">
                        <div class="card mb-3 bg-ligh mx-2" style="max-width: 540px">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img
                                            src="img/sale/freeship.png"
                                            class="card-img full-height"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body row">
                                        <div class="col-md-12">
                                            <h5 class="card-title none-margin">Giảm 8%</h5>
                                            <p class="none-margin"><i>Mã: c683y2</i></p>
                                            <p class="card-text none-margin">
                                                Giảm tối đa 50.000 VNĐ cho tất cả đơn hàng
                                            </p>
                                            <div
                                                    class="progress progress-style none-margin"
                                            >
                                                <div
                                                        class="progress-bar bg-success"
                                                        role="progressbar"
                                                        style="width: 25%"
                                                        aria-valuenow="25"
                                                        aria-valuemin="0"
                                                        aria-valuemax="100"
                                                ></div>
                                                <p class="text-muted">Còn 5 ngày</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success">Lấy mã</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- End edit -->


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
