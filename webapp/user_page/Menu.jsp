<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 26/12/2020
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Page Preloder -->
<%--<div id="preloder">--%>
<%--    <div class="loader"></div>--%>
<%--</div>--%>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">

        <a href="#"><img src="${applicationScope.header.logo}" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="user.html"><i class="fa fa-heart"></i> <span>1</span></a></li>
            <li><a href="shoping-cart.html"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
        </ul>
        <div class="header__cart__price">Tổng:<span>150.000 VNĐ</span></div>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__auth">
            <a href="sign-in.html"><i class="fa fa-user"></i>Đăng Nhập</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <%--            <c:set var="page_menu" scope="request" value="${requestScope.page_menu}"></c:set>--%>
            <c:choose>
                <c:when test="${page_menu=='home'}">
                    <li class="active"><a href="./home">Trang Chủ</a></li>
                    <li><a href="./direct?page_menu=discount">Giảm giá</a></li>
                    <li><a href="/direct?page_menu=shopping">Mua Sắm</a></li>
                    <li><a href="/direct?page_menu=blog">Bài Viết</a></li>
                    <li><a href="/direct?page_menu=contact">Liên Hệ</a></li>
                </c:when>
                <c:when test="${page_menu=='discount'}">
                    <li ><a href="/direct?page_menu=home">Trang Chủ</a></li>
                    <li class="active"><a href="/home?page_menu=discount">Giảm giá</a></li>
                    <li><a href="/direct?page_menu=shopping">Mua Sắm</a></li>
                    <li><a href="/direct?page_menu=blog">Bài Viết</a></li>
                    <li><a href="/direct?page_menu=contact">Liên Hệ</a></li>
                </c:when>
                <c:when test="${page_menu=='shopping'}">
                    <li ><a href="/direct?page_menu=home">Trang Chủ</a></li>
                    <li><a href="/direct?page_menu=discount">Giảm giá</a></li>
                    <li class="active"><a href="/direct?page_menu=shopping">Mua Sắm</a></li>
                    <li><a href="/direct?page_menu=blog">Bài Viết</a></li>
                    <li><a href="/direct?page_menu=contact">Liên Hệ</a></li>
                </c:when>
                <c:when test="${page_menu=='blog'}">
                    <li ><a href="/direct?page_menu=home">Trang Chủ</a></li>
                    <li><a href="/direct?page_menu=discount">Giảm giá</a></li>
                    <li><a href="/direct?page_menu=shopping">Mua Sắm</a></li>
                    <li class="active"><a href="/direct?page_menu=blog">Bài Viết</a></li>
                    <li><a href="/direct?page_menu=contact">Liên Hệ</a></li>
                </c:when>
                <c:when test="${page_menu=='contact'}">
                    <li ><a href="/direct?page_menu=home">Trang Chủ</a></li>
                    <li><a href="/direct?page_menu=discount">Giảm giá</a></li>
                    <li><a href="/direct?page_menu=shopping">Mua Sắm</a></li>
                    <li><a href="/direct?page_menu=blog">Bài Viết</a></li>
                    <li class="active"><a href="/direct?page_menu=contact">Liên Hệ</a></li>
                </c:when>

            </c:choose>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="${applicationScope.social_media.fb}"><i class="fa fa-facebook"></i></a>
        <a href="${applicationScope.social_media.in}"><i class="fa fa-instagram"></i></a>
        <a href="${applicationScope.social_media.tw}"><i class="fa fa-twitter"></i></a>
        <a href="${applicationScope.social_media.pi}"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> ${applicationScope.address.get(0).email}</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i>${applicationScope.address.get(0).email}</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="${applicationScope.social_media.fb}"><i class="fa fa-facebook"></i></a>
                            <a href="${applicationScope.social_media.in}"><i class="fa fa-instagram"></i></a>
                            <a href="${applicationScope.social_media.tw}"><i class="fa fa-twitter"></i></a>
                            <a href="${applicationScope.social_media.pi}"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__auth">
                            <a href="sign-in.html"><i class="fa fa-user"></i> Đăng Nhập</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="./index.html"><img src="${applicationScope.header.logo}" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <c:set var="page_menu" scope="request" value="${requestScope.page_menu}"></c:set>
                        <c:choose>
                            <c:when test="${page_menu=='home'}">
                                <li class="active"><a href="./home">Trang Chủ</a></li>
                                <li><a href="./direct?page_menu=discount">Giảm giá</a></li>
                                <li><a href="/direct?page_menu=shopping">Mua Sắm</a></li>
                                <li><a href="/direct?page_menu=blog">Bài Viết</a></li>
                                <li><a href="/direct?page_menu=contact">Liên Hệ</a></li>
                            </c:when>
                            <c:when test="${page_menu=='discount'}">
                                <li ><a href="/direct?page_menu=home">Trang Chủ</a></li>
                                <li class="active"><a href="/home?page_menu=discount">Giảm giá</a></li>
                                <li><a href="/direct?page_menu=shopping">Mua Sắm</a></li>
                                <li><a href="/direct?page_menu=blog">Bài Viết</a></li>
                                <li><a href="/direct?page_menu=contact">Liên Hệ</a></li>
                            </c:when>
                            <c:when test="${page_menu=='shopping'}">
                                <li ><a href="/direct?page_menu=home">Trang Chủ</a></li>
                                <li><a href="/direct?page_menu=discount">Giảm giá</a></li>
                                <li class="active"><a href="/direct?page_menu=shopping">Mua Sắm</a></li>
                                <li><a href="/direct?page_menu=blog">Bài Viết</a></li>
                                <li><a href="/direct?page_menu=contact">Liên Hệ</a></li>
                            </c:when>
                            <c:when test="${page_menu=='blog'}">
                                <li ><a href="/direct?page_menu=home">Trang Chủ</a></li>
                                <li><a href="/direct?page_menu=discount">Giảm giá</a></li>
                                <li><a href="/direct?page_menu=shopping">Mua Sắm</a></li>
                                <li class="active"><a href="/direct?page_menu=blog">Bài Viết</a></li>
                                <li><a href="/direct?page_menu=contact">Liên Hệ</a></li>
                            </c:when>
                            <c:when test="${page_menu=='contact'}">
                                <li ><a href="/direct?page_menu=home">Trang Chủ</a></li>
                                <li><a href="/direct?page_menu=discount">Giảm giá</a></li>
                                <li><a href="/direct?page_menu=shopping">Mua Sắm</a></li>
                                <li><a href="/direct?page_menu=blog">Bài Viết</a></li>
                                <li class="active"><a href="/direct?page_menu=contact">Liên Hệ</a></li>
                            </c:when>

                        </c:choose>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="user.html"><i class="fa fa-heart"></i> <span>1</span></a></li>
                        <li><a href="shoping-cart.html"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                    </ul>
                    <div class="header__cart__price">Tổng:<span>150.000 VNĐ</span></div>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->
