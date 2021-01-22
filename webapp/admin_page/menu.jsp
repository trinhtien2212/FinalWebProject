<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 22/01/2021
  Time: 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% System.out.println("Co dang vao menu.jsp");%>
<!-- Header -->
<div class="header">
    <div class="header-left">
        <a href="dashboard.html" class="logo logo-small">
            <img src="../${applicationScope.header.logo}" alt="Logo" width="30" height="30">
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
							<img class="rounded-circle" src="../${sessionScope.user_avatar}" width="40" alt="Admin">
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
            <img src="../${applicationScope.header.logo}" class="img-fluid" alt="">
        </a>
    </div>
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li>
                    <a href="admin-page?direct-to=dashboard"
                       <c:if test="${current_page=='dashboard'}">class="active"</c:if>>
                    <i class="fas fa-columns"></i> <span>Dashboard</span></a>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a href="admin-page?direct-to=category"
                               <c:if test="${current_page=='category'}">class="active"</c:if>>Danh mục</a></li>
                        <li><a href="admin-page?direct-to=product"
                               <c:if test="${current_page=='product'}">class="active"</c:if>>Sản phẩm</a></li>
                        <li><a href="admin-page?direct-to=blog"
                               <c:if test="${current_page=='blog'}">class="active"</c:if>>Blog</a></li>
                        <li><a href="admin-page?direct-to=coupon-code-type"
                               <c:if test="${current_page=='coupon-code-type'}">class="active"</c:if>>Loại mã giảm giá</a></li>
                        <li><a href="admin-page?direct-to=coupon-code"
                               <c:if test="${current_page=='coupon-code'}">class="active"</c:if>>Mã giảm giá</a></li>
                        <li><a href="admin-page?direct-to=rating-type"
                               <c:if test="${current_page=='rating-type'}">class="active"</c:if>>Loại đánh giá</a></li>
                        <li><a href="admin-page?direct-to=email"
                               <c:if test="${current_page=='email'}">class="active"</c:if>>Email</a></li>

                    </ul>
                </li>

                <li class="submenu">
                    <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                            class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a href="admin-page?direct-to=total-report"
                               <c:if test="${current_page=='total-report'}">class="active"</c:if>>Danh sách đặt hàng</a></li>
                        <li><a href="admin-page?direct-to=shipment"
                               <c:if test="${current_page=='shipment'}">class="active"</c:if>>Vận chuyển</a></li>
                        <li><a href="admin-page?direct-to=dashboard"
                               <c:if test="${current_page=='warranty'}">class="active"</c:if>>Bảo hành</a></li>
                        <li><a href="admin-page?direct-to=dashboard"
                               <c:if test="${current_page=='review-report'}">class="active"</c:if>>Đánh giá sản phẩm</a></li>


                    </ul>
                </li>

                <li class="submenu">
                    <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a href="admin-page?direct-to=dashboard"
                               <c:if test="${current_page=='user'}">class="active"</c:if>>Khách hàng</a></li>
                        <li><a href="admin-page?direct-to=dashboard"
                               <c:if test="${current_page=='admin-list'}">class="active"</c:if>>Danh sách admin</a></li>
                        <li><a href="admin-page?direct-to=dashboard"
                               <c:if test="${current_page=='supplier'}">class="active"</c:if>>Nhà cung cấp</a></li>

                    </ul>
                </li>
                <li>
                    <a href="admin-page?direct-to=dashboard"
                       <c:if test="${current_page=='user-info'}">class="active"</c:if>><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                </li>
                <li>
                    <a href="admin-page?direct-to=dashboard"
                       <c:if test="${current_page=='setting'}">class="active"</c:if>><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                </li>
            </ul>
        </div>
    </div>
</div>
<%System.out.println("Da ra menu");%>
<!-- /Sidebar -->
