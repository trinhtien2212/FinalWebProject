<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
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

<!-- User Section -->
<div class="container">
    <div class="row my-2 user__border">
        <div class="col-lg-8 order-lg-2">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a href="" data-target="#profile" data-toggle="tab" class="nav-link active nav-link-2">Tài Khoản</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#messages" data-toggle="tab" class="nav-link nav-link-2">Đổi Mật Khẩu</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#edit" data-toggle="tab" class="nav-link nav-link-2">Đơn Hàng</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#my-coupon-code" data-toggle="tab" class="nav-link nav-link-2">Mã khuyến
                        mãi</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#like" data-toggle="tab" class="nav-link nav-link-2">Yêu Thích</a>
                </li>
            </ul>
            <div class="tab-content py-4">
                <div class="tab-pane active" id="profile">
                    <!-- <h5 class="mb-3">Thông Tin Tài Khoản</h5> -->
                    <div class="row">
                        <div class="col-md-12">
                            <header>
                                <h1>HỒ SƠ CỦA TÔI</h1>
                                <div class="content">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
                            </header>
                            <form id="formAcount" class="formAcount validate clearfix">
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label"> Họ tên: <span>(*)</span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="fullName" name="fullName"
                                                   value="${sessionScope.user_name}" placeholder="Họ tên"
                                                   class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Ngày sinh: <span></span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="date" id="birthday" name="birthday"
                                                   value="${sessionScope.user_birth}" placeholder="Ngày sinh"
                                                   class="validate[required] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Điện thoại: <span></span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="mobile" name="mobile"
                                                   value="0${sessionScope.user_phone}" placeholder="Điện thoại"
                                                   class="validate[required,custom[phone]] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Email: <span>(*)</span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="email" name="email" value="${sessionScope.user_mail}"
                                                   placeholder="Email"
                                                   class="validate[required,custom[email]] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Tỉnh/Thành phố : <span>(*)</span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <select name="cityID" id="cityID">
                                                <option value="">Tỉnh/Thành phố</option>
                                                <option value="254">An Giang</option>
                                                <option value="255">Bà Rịa - Vũng Tàu</option>
                                                <option value="256">Bắc Giang</option>
                                                <option value="257">Bắc Kạn</option>
                                                <option value="258">Bạc Liêu</option>
                                                <option value="259">Bắc Ninh</option>
                                                <option value="260">Bến Tre</option>
                                                <option value="261">Bình Định</option>
                                                <option value="262">Bình Dương</option>
                                                <option value="263">Bình Phước</option>
                                                <option value="264">Bình Thuận</option>
                                                <option value="265">Cần Thơ</option>
                                                <option value="266">Cà Mau</option>
                                                <option value="267">Cao Bằng</option>
                                                <option value="268">Đà Nẵng</option>
                                                <option value="269">Đắk Lắk</option>
                                                <option value="270">Đắk Nông</option>
                                                <option value="271">Điện Biên</option>
                                                <option value="272">Đồng Nai</option>
                                                <option value="273">Đồng Tháp</option>
                                                <option value="274">Gia Lai</option>
                                                <option value="275">Hải Phòng</option>
                                                <option value="276">Hà Nội</option>
                                                <option value="277">Hà Giang</option>
                                                <option value="278">Hà Nam</option>
                                                <option value="279">Hà Tĩnh</option>
                                                <option value="280">Hải Dương</option>
                                                <option value="281">Hậu Giang</option>
                                                <option value="282">Hòa Bình</option>
                                                <option value="283">Hưng Yên</option>
                                                <option value="284">Khánh Hòa</option>
                                                <option value="285">Kiên Giang</option>
                                                <option value="286">Kon Tum</option>
                                                <option value="287">Lai Châu</option>
                                                <option value="288">Lâm Đồng</option>
                                                <option value="289">Lạng Sơn</option>
                                                <option value="290">Lào Cai</option>
                                                <option value="291">Long An</option>
                                                <option value="292">Nam Định</option>
                                                <option value="293">Nghệ An</option>
                                                <option value="294">Ninh Bình</option>
                                                <option value="295">Ninh Thuận</option>
                                                <option value="296">Phú Thọ</option>
                                                <option value="297">Quảng Bình</option>
                                                <option value="298">Quảng Nam</option>
                                                <option value="299">Quảng Ngãi</option>
                                                <option value="300">Quảng Ninh</option>
                                                <option value="301">Quảng Trị</option>
                                                <option value="302">Sóc Trăng</option>
                                                <option value="303">Sơn La</option>
                                                <option value="304">Thành phố Hồ Chí Minh</option>
                                                <option value="305">Tây Ninh</option>
                                                <option value="306">Thái Bình</option>
                                                <option value="307">Thái Nguyên</option>
                                                <option value="308">Thanh Hóa</option>
                                                <option value="309">Thừa Thiên Huế</option>
                                                <option value="310">Tiền Giang</option>
                                                <option value="312">Trà Vinh</option>
                                                <option value="313">Tuyên Quang</option>
                                                <option value="314">Vĩnh Long</option>
                                                <option value="315">Vĩnh Phúc</option>
                                                <option value="316">Yên Bái</option>
                                                <option value="317">Phú Yên</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Quận/ Huyện: <span>(*)</span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="district" name="district" value=""
                                                   placeholder="Quận/ Huyện"
                                                   class="validate[required,custom[email]] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Xã/ Phường/ Thị trấn:
                                            <span>(*)</span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="ward" name="ward" value=""
                                                   placeholder="Xã/ Phường/ Thị trấn"
                                                   class="validate[required,custom[email]] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Địa chỉ chi tiết: <span>(*)</span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="address" name="address" value=""
                                                   placeholder="Địa chỉ chi tiết"
                                                   class="validate[required] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label"></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="submit" class="btn-update" value="CẬP NHẬT">
                                            <!-- <button type="submit" class="btn-update">CẬP NHẬT                                      -->
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--/row-->
                </div>
                <div class="tab-pane" id="messages">
                    <!-- <h5 class="mb-3">Thông Tin Tài Khoản</h5> -->
                    <div class="row">
                        <div class="col-md-12">
                            <header>
                                <h1>THAY ĐỔI MẬT KHẨU</h1>
                                <div class="content">Bạn nên cập nhật mật khẩu thường xuyên vì lí do bảo mật</div>
                            </header>
                            <form id="formAcount" class="formAcount validate clearfix">
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label"> Mật khẩu mới: </label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="password" id="pass" name="pass"
                                                   class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                            <label id="mk-notice" class="invisible notice">Mật khẩu phải dài từ 8 - 25
                                                kí tự và phải chứa cả số và chữ in hoa</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label"> Xác nhận mật khẩu: </label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="password" id="pass-again" name="pass"
                                                   class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                            <label id="mka-notice" class="invisible notice">Mật khẩu phải trùng khớp với
                                                mật khẩu mới đã nhập</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label"></label>
                                        <div class="col-lg-6 col-md-9">
                                            <button type="submit" class="btn-update">LƯU
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--/row-->
                </div>
                <div class="tab-pane myorder__style" id="edit">
                    <!-- <div class="heading">Đơn hàng của tôi</div> -->
                    <div class="inner">
                        <table>
                            <thead>
                            <tr>
                                <th>Mã đơn hàng</th>
                                <th>Ngày mua</th>
                                <th>Tổng tiền</th>
                                <th>Trạng thái đơn hàng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <a href="order-detail.html">673617832</a>
                                </td>
                                <td>30/10/2020</td>
                                <td>90.000 VNĐ</td>
                                <td>Giao hàng thành công</td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="#">219844147</a>
                                </td>
                                <td>12/04/2020</td>
                                <td>156.000 VNĐ</td>
                                <td>Giao hàng thành công</td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="#">972084147</a>
                                </td>
                                <td>09/09/2019</td>
                                <td>350.000 VNĐ</td>
                                <td>Đã hủy</td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="/sales/order/view/404252736">404252736</a>
                                </td>
                                <td>14/04/2018</td>
                                <td>172.000 VNĐ</td>
                                <td>Đã hủy</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane myorder__style " id="my-coupon-code">
                    <!-- <div class="heading">Đơn hàng của tôi</div> -->
                    <div class="inner">
                        <table>
                            <thead>
                            <tr>
                                <th>Tên mã giảm giá</th>
                                <th>Loại mã</th>
                                <th>Thời hạn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${coupon_code_data}" var="cd">
                                <tr>
                                    <td>${cd.name}</td>
                                    <td>Miễn phí vận chuyển</td>
                                    <td>Còn 8 ngày</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="tab-pane " id="like">
                    <div class="row">
                        <c:forEach items="${data}" var="d">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${d.img}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">${d.name}</a></h6>
                                    <h5>${d.price}</h5>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <!--/row-->
            </div>

        </div>
        <div class="col-lg-4 order-lg-1 text-center img-2">
            <div class="img-ava">
                <img src="${sessionScope.user_avatar}" class="mx-auto img-fluid img-circle d-block" alt="avatar">
                <label class="load-ava">
                    <span class="custom-file-control">Đổi Ảnh</span>
                    <input type="file" id="file" class="custom-file-input">

                </label>
            </div>
            <h6 class="mt-2">Nhật Thy</h6>

        </div>
    </div>
</div>
<!-- User Section End -->
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


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.js"></script>
<script>
    $(document).ready(function () {
        $("#formAcount").validate({
            rules: {
                fullname: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                cityID: {
                    required: true
                },
                district: {
                    required: true
                },
                ward: {
                    required: true
                },
                address: {
                    required: true
                }
            },
            messages: {
                fullname: {
                    required: "Xin vui lòng nhập tên"
                },
                email: {
                    required: "Xin vui lòng nhập email",
                    email: "Email không hợp lệ, xin vui lòng nhập lại"
                },
                cityID: {
                    required: "Xin chọn tỉnh/thành phố"
                },
                district: {
                    required: "Xin vui lòng nhập quận/huyện"
                },
                ward: {
                    required: "Xin vui lòng nhập xã/ phường/ thị trấn"
                },
                address: {
                    required: "Xin vui lòng nhập địa chỉ"
                }
            }
        });
    });
</script>
</body>
</html>
