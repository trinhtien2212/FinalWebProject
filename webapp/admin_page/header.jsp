<%--
  Created by IntelliJ IDEA.
  User: TRAN NHAT THY
  Date: 18/01/2021
  Time: 7:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Header -->
<div class="header">
    <div class="header-left">
        <a href="dashboard.html" class="logo logo-small">
            <img src="assets/img/logo-icon.png" alt="Logo" width="30" height="30">
        </a>
    </div>
    <a href="javascript:void(0);" id="toggle_btn">
        <i class="fas fa-align-left"></i>
    </a>
    <a class="mobile_btn" id="mobile_btn" href="javascript:void(0);">
        <i class="fas fa-align-left"></i>
    </a>

    <ul class="nav user-menu">
        <!-- Notifications -->
        <li class="nav-item dropdown noti-dropdown">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                <i class="far fa-bell"></i> <span class="badge badge-pill"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right notifications">
                <div class="topnav-dropdown-header">
                    <span class="notification-title">Thông Báo</span>
                    <a href="javascript:void(0)" class="clear-noti"> xóa tất cả </a>
                </div>
                <div class="noti-content">
                    <ul class="notification-list">
                        <c:forEach items="" var="">
                            <li class="notification-message">
                                <a href="admin-notification.html">
                                    <div class="media">
                                        <span class="avatar avatar-sm">
                                            <img class="avatar-img rounded-circle" alt=""
                                                 src="assets/img/customer/ong.jpg">
                                        </span>
                                        <div class="media-body">
                                            <p class="noti-details">
                                                <span class="noti-title">Ung Thành Vũ đã gửi phản hồi</span>
                                            </p>
                                            <p class="noti-time">
                                                <span class="notification-time">15 Tháng Chín 2020 10:20</span>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="topnav-dropdown-footer">
                    <a href="admin-notification.html">Tất cả Thông báo</a>
                </div>
            </div>
        </li>
        <!-- /Notifications -->
        <!-- User Menu -->
        <li class="nav-item dropdown">
            <a href="javascript:void(0)" class="dropdown-toggle user-link  nav-link" data-toggle="dropdown">
						<span class="user-img">
							<img class="rounded-circle" src="${sessionScope.user_avatar}" width="40" alt="Admin">
						</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="admin-profile.html">Thông tin cá nhân</a>
                <a class="dropdown-item" href="login.html">Đăng xuất</a>
            </div>
        </li>
        <!-- /User Menu -->

    </ul>
</div>
<!-- /Header -->

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <div class="sidebar-logo">
        <a href="dashboard.html">
            <img src="${applicationScope.header.logo}" class="img-fluid" alt="">
        </a>
    </div>
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <c:choose>
                    <c:when test="${page_menu=='dashboard'}">
                        <li class="active">
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='cate'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li class="active"><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='product'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li class="active"><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='blogadmin'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li class="active"><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='coupontype'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li class="active"><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='coupon'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li class="active"><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='rating'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li class="active"><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='email'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li class="active"><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='orderlist'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li class="active"><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='shipment'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li class="active"><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='warranty'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li class="active"><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='review'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li class="active"><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='customer'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li class="active"><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='adminlist'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li class="active"><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='supplier'}">
                        <li class="active">
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li class="active"><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='profile'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li class="active">
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li>
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                    <c:when test="${page_menu=='settings'}">
                        <li>
                            <a href="/direct?page_menu=dashboard"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=cate">Danh mục</a></li>
                                <li><a href="/direct?page_menu=product">Sản phẩm</a></li>
                                <li><a href="/direct?page_menu=blogadmin">Blog</a></li>
                                <li><a href="/direct?page_menu=coupontype">Loại mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=coupon">Mã giảm giá</a></li>
                                <li><a href="/direct?page_menu=rating">Loại đánh giá</a></li>
                                <li><a href="/direct?page_menu=email">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=orderlist">Danh sách đặt hàng</a></li>
                                <li><a href="/direct?page_menu=shipment">Vận chuyển</a></li>
                                <li><a href="/direct?page_menu=warranty">Bảo hành</a></li>
                                <li><a href="/direct?page_menu=review">Đánh giá sản phẩm</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="/direct?page_menu=customer">Khách hàng</a></li>
                                <li><a href="/direct?page_menu=adminlist">Danh sách admin</a></li>
                                <li><a href="/direct?page_menu=supplier">Nhà cung cấp</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="/direct?page_menu=profile"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                        </li>
                        <li class="active">
                            <a href="/direct?page_menu=settings"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
        </div>
    </div>
</div>
<!-- /Sidebar -->