<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 28/12/2020
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>${title}</title>
    <link href="${applicationScope.header.shortcut}" rel="shortcut icon">
    <!-- Css Styles -->
    <!-- Css Styles -->
    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">
<%--    <link rel="stylesheet" href="user_page/css/blog_style.css" type="text/css">--%>
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">
</head>

<body>
    <jsp:include page="Menu.jsp"></jsp:include>
    <jsp:include page="search_bar.jsp"></jsp:include>
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Tìm kiếm...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Danh Mục</h4>
                            <ul>
                                <li><a href="#">Tất Cả</a></li>
                                <li><a href="#">Chăm Sóc Cây (20)</a></li>
                                <li><a href="#">Trồng Cây (5)</a></li>
                                <li><a href="#">Lợi Ích Của Cây (9)</a></li>
                                <li><a href="#">Trang Trí Cây (10)</a></li>
                            </ul>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Tin Tức Mới</h4>
                            <div class="blog__sidebar__recent">
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/3-loai-cay-duoc-tang-trong-noen.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>3 loại cay được tang trong Noel</h6>
                                        <span>THÁNG SÁU 05, 2020</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/cach-cham-soc-hoa-hong.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Cách chăm sóc hoa hồng</h6>
                                        <span>THÁNG BA 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/cach-chon-dao-tet.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Cách chọn đào tết</h6>
                                        <span>THÁNG TƯ 12, 2020</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Tìm Kiếm Nhiều</h4>
                            <div class="blog__sidebar__item__tags">
                                <a href="#">Bạch Mã Hoàng Tử</a>
                                <a href="#">Dâu Tây</a>
                                <a href="#">Kim Tiền</a>
                                <a href="#">Lưỡi Hổ</a>
                                <a href="#">Mai</a>
                                <a href="#">Đẹp</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="title-blog">${blog.name}</div>
                    <div class="blog__details__text">
                        <img src="${blog.avatar}" style="width: 100%;" alt="" />
                        ${blog.content}
                    </div>
                    <div class="blog__details__content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="blog__details__author">
                                    <div class="blog__details__author__pic">
                                        <img src="img/blog/details/admin.jpg" alt="" />
                                    </div>
                                    <div class="blog__details__author__text">
                                        <h6>Nhật Thy</h6>
                                        <span>Admin</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="blog__details__widget">
                                    <ul>
                                        <li><span>Danh Mục:</span> Trang Trí Cây</li>
                                        <li>
                                            <span>Từ khóa:</span> Tất Cả, Trang Trí, Cây Xanh,
                                            Cách sống
                                        </li>
                                    </ul>
                                    <div class="blog__details__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-google-plus"></i></a>
                                        <a href="#"><i class="fa fa-linkedin"></i></a>
                                        <a href="#"><i class="fa fa-envelope"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->
<!-- Related Blog Section Begin -->
<section class="related-blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related-blog-title">
                    <h2>Bạn Có Thể Thích</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/cong-dung-cay-luoc-vang.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> Tháng Bảy 15,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5><a href="#">Cây trồng trong nhà đuổi muỗi
                        </a></h5>
                        <p>Muỗi là một trong những loại côn trùng mang đến nhiều bệnh tật cho sức khỏe của con người. Muỗi thích hợp với những nơi ẩm ướt, không sạch…</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/nhung-cay-treo-tren-ban-cong-dep.png" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> Tháng Mười 12,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5><a href="#">Những cây treo trên ban công</a></h5>
                        <p>Ban công là không gian để làm đẹp cho ngôi nhà của bạn, giúp bạn cảm thấy sảng khoái sau những giờ làm việc mệt nhọc. Trồng cây cảnh…</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/cay-trong-trong-nha-duoi-muoi.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> Tháng Bảy 15,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5><a href="#">Cây trồng trong nhà đuổi muỗi
                        </a></h5>
                        <p>Muỗi là một trong những loại côn trùng mang đến nhiều bệnh tật cho sức khỏe của con người. Muỗi thích hợp với những nơi ẩm ướt, không sạch…</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Related Blog Section End -->

<!-- Popup footer -->
<div class="popup-footer">
    <a href=""><i class="fa fa-comments" aria-hidden="true"></i></a>
    <button id="scroll-top" class="circle-wrap" href=""><i class="fa fa-angle-up " aria-hidden="true"></i></button>
</div>
<!-- End popup footer -->

<!-- Footer Section Begin -->
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="./index.html"><img src="img/banner/bieutuong_off.png" alt=""></a>
                    </div>
                    <ul>
                        <li>Địa chỉ: Đại học Nông Lâm TP.HCM</li>
                        <li>Điện thoại: +84353535355</li>
                        <li>Email: thegioicaycanhNLU@gmail.com</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 ">
                <div class="footer__widget no_flex">
                    <h6>Địa chỉ bán lẻ</h6>
                    <ul>
                        <li>Địa chỉ: KIOT 35, đường số 6, Đại học Nông Lâm</li>
                        <li>Điện thoại: +84353535355</li>
                        <li>Email: thegioicaycanhNLU@gmail.com</li>
                    </ul>

                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget no_flex">
                    <h6>Để lại thông tin liên hệ</h6>
                    <p>Sản phẩm mới nhất, chương trình khuyến mãi</p>
                    <form action="#">
                        <input type="text" placeholder="Email">
                        <button type="submit" class="site-btn">Gửi</button>
                    </form>
                    <a class="term" href="terms-and-conditions.html">Xem thêm chính sách và điều khoản <i class="fa fa-arrow-right"></i></a>
                    <div class="footer__widget__social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Footer Section End -->

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
