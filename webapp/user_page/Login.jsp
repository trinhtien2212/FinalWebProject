<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<!-- Sign In Section Begin -->
<section class="sign-in spad">
    <div class="container">
        <div class="row sign__in">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="sign__in__form">
                    <form action="handle-login" id="login-form" method="post" accept-charset="UTF-8">
                        <button><a href="sign-in.html" class="btn-dn">ĐĂNG NHẬP</a></button>
                        <button><a href="sign-up.html" class="btn-dk">ĐĂNG KÝ</a></button>
                        <br>
                        <input type="email" name="email" id="email" placeholder="Nhập email" required>
                        <br>
                        <input type="text" name="pass" id="pass" placeholder="Mật khẩu" required>
                        <label id="pw-notice" class="invisible notice">Mật khẩu phải dài từ 8 - 25 kí tự và phải chứa cả số và chữ in hoa</label>
                        <br>
                        <input type="submit" name="submit" id="submit" value="Đăng nhập"><br>
                        <button type="button" class=" forget-pass" data-toggle="modal" data-target="#change-pass">Quên Mật Khẩu</button>
                        <h4>Hoặc đăng nhập với</h4>
                        <a href="#" class="face"><i class="fa fa-facebook"></i></a>
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/thegioicaycanh.vn/handle-google-login&response_type=code
    &client_id=838091777445-oa4q61sod4fqgt5arqnk16nddhhak0v8.apps.googleusercontent.com&approval_prompt=force" class="google"><i class="fa fa-google"></i></a>
                        <!-- <a href="#"><i class="fa fa-instagram"></i></a> -->
                        <a href=""></a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Sign In Section End -->

<!-- Dialog Forget Password -->
<!-- Dialog Email -->
<%-- dang dang nhap thi phai co modal hien thi quen mat khau  --%>
<c:if test="${status==1}">
<div class="modal fade" id="change-pass" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog forget-dialog" role="document">
        <div class="modal-content forget-content">
            <div class="modal-header forget-header">
                <h5 class="modal-title forget-title">Quên Mật Khẩu?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="x">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="handle-login" method="get">
                <div class="modal-body forget-body">
                    <h5 class="forget-h5">Vui lòng nhập Email bạn đã đăng kí để lấy lại mật khẩu</h5>
                    <input type="email" name="email" id="mail" class="forget-mail" placeholder="thegioicaycanhNLU@gmail.com">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary forget-send" data-toggle="modal" data-target="#notify-forget">GỬI</button>
                </div>
            </form>
        </div>
    </div>
</div>
</c:if>
<%-- Xac thuc da gui email--%>
<c:if test="${status==3}">
<div class="modal fade" id="notify-forget" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog forget-dialog" role="document">
        <div class="modal-content forget-content">
            <div class="modal-header forget-header">
                <h5 class="modal-title forget-title" >Quên Mật Khẩu?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="x">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body forget-body">
                <!-- <h5 class="forget-h5">Vui lòng nhập Email bạn đã đăng kí để lấy lại mật khẩu</h5> -->
                <div>
                    <p>Email đã được gửi, bạn vui lòng kiểm tra hộp thư để cập nhật thông tin</p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary forget-send" data-dismiss="modal">ĐÓNG</button>
            </div>
        </div>
    </div>
</div>
</c:if>

<c:if test="${status==2}">
    <div class="modal fade" id="wrong_info_login" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog forget-dialog" role="document">
            <div class="modal-content forget-content">
                <div class="modal-header forget-header">
                    <h5 class="modal-title forget-title">Sai thông tin đăng nhập!</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="x">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body forget-body">
                    <!-- <h5 class="forget-h5">Vui lòng nhập Email bạn đã đăng kí để lấy lại mật khẩu</h5> -->
                    <div>
                        <p>Email hoặc mật khẩu sai. Vui lòng nhập lại!</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary forget-send" data-dismiss="modal">ĐÓNG</button>
                </div>
            </div>
        </div>
    </div>
</c:if>

<!-- Dialog Forget Password End -->


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