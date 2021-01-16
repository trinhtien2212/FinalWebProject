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

<!-- Bao hanh -->
<!-- Sign In Section Begin -->
<section class="sign-in spad">
    <div class="container">
        <div class="title-all">Thông tin đổi trả</div>
        <div class="guarantee_wrap sign__in sign__up">

            <div class="sign__in__form sign__up__form">
                <form action="warranty" method="post">
                    <input type="email" name="mail" id="mail" placeholder="Email (*)" required><br>
                    <input type="number" name="order-id" id="order-id" placeholder="Mã đơn hàng" required><br>
                    <input type="text" name="guarantee_title" id="guarantee-title" placeholder="Tiêu đề">
                    <textarea name="description" id="description" cols="30" rows="10" placeholder="Mô tả"
                              required></textarea>
                    <button id="add-img" type="button" name="war_img">Thêm ảnh</button>
                    <input type="submit" name="submit" id="submit" value="Gửi"><br>
                </form>
            </div>

        </div>
    </div>
</section>
<!-- Sign In Section End -->

<!-- End Bao hang -->

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