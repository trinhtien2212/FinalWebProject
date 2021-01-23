<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<title>${title}</title>
	<link href="assets/img/icon/icon-logo.png" rel="shortcut icon">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
	 
	<!-- Animate CSS -->
	<link rel="stylesheet" href="assets/css/animate.min.css">

	<!-- Main CSS -->
	<link rel="stylesheet" href="assets/css/admin.css">

</head>

<body>
	<div class="main-wrapper">
		<jsp:include page="menu.jsp"></jsp:include>

		<div class="page-wrapper">
			<div class="content container-fluid">
			
				<!-- Page Header -->
				<div class="page-header">
					<div class="row">
						<div class="col-12">
							<h3 class="page-title">Dashboard</h3>
						</div>
					</div>
				</div>
				<!-- /Page Header -->
				
				<div class="row">
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary">
										<i class="far fa-user"></i>
									</span>
									<div class="dash-widget-info">
										<h3>${c_user}</h3>
										<h6 class="text-muted">Người dùng</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary">
										<i class="fas fa-qrcode"></i>
									</span>
									<div class="dash-widget-info">
										<h3>${c_product}</h3>
										<h6 class="text-muted">Sản phẩm</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary">
										<i class="fas fa-user-shield"></i>
									</span>
									<div class="dash-widget-info">
										<h3>${c_supplier}</h3>
										<h6 class="text-muted">Nhà cung cấp</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 d-flex">
					
						<!-- Recent Bookings -->
						<div class="card card-table flex-fill">
							<div class="card-header">
								<h4 class="card-title">Đặt hàng gần đây</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-center">
										<thead>
											<tr>
												<th>Tên khách hàng</th>
												<th>Ngày đặt</th>
												<th>Tên sản phẩm</th>
												<th>Trạng thái</th>
												<th>Tổng tiền</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="text-nowrap">
													<img class="avatar-xs rounded-circle" src="assets/img/customer/user5.jpg" alt="User Image"> Annette Silva
												</td>
												<td class="text-nowrap">9 Sep 2020</td>
												<td>Cây Móng Rồng</td>
												<td>
													<span class="badge bg-danger inv-badge">chờ xử lý</span>
												</td>
												<td>
													<div class="font-weight-600">64.000 VNĐ</div>
												</td>
											</tr>
											<tr>
												<td class="text-nowrap">
													<img class="avatar-xs rounded-circle" src="assets/img/customer/user6.jpg" alt="User Image"> Stephen Wilson</td>
												<td class="text-nowrap">8 Sep 2020</td>
												<td>Sen Đá Mini Kèm Chậu</td>
												<td>
													<span class="badge bg-danger inv-badge">chờ xử lý</span>
												</td>
												<td>
													<div class="font-weight-600">50.000 VNĐ</div>
												</td>
											</tr>
											<tr>
												<td class="text-nowrap">
													<img class="avatar-xs rounded-circle" src="assets/img/customer/user7.jpg" alt="User Image"> Ryan Rodriguez</td>
												<td class="text-nowrap">7 Sep 2020</td>
												<td>Cây Cẩm Nhung</td>
												<td>
													<span class="badge bg-danger inv-badge">chờ xử lý</span>
												</td>
												<td>
													<div class="font-weight-600">39.000 VNĐ</div>
												</td>
											</tr>
											<tr>
												<td class="text-nowrap">
													<img class="avatar-xs rounded-circle" src="assets/img/customer/user8.jpg" alt="User Image"> Lucile Devera
												</td>
												<td class="text-nowrap">6 Sep 2020</td>
												<td>Xương Rồng Tai Thỏ</td>
												<td>
													<span class="badge bg-danger inv-badge">chờ xử lý</span>
												</td>
												<td>
													<div class="font-weight-600">36.000 VNĐ</div>
												</td>
											</tr>
											<tr>
												<td class="text-nowrap">
													<img class="avatar-xs rounded-circle" src="assets/img/customer/user9.jpg" alt="User Image"> Roland Storey</td>
												<td class="text-nowrap">5 Sep 2020</td>
												<td>Xương Rồng Astro</td>
												<td>
													<span class="badge bg-danger inv-badge">chờ xử lý</span>
												</td>
												<td>
													<div class="font-weight-600">79.000 VNĐ</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- /Recent Bookings -->
						
					</div>
					</div>
				</div> 
			</div>
		</div> 
	</div>

	<!-- jQuery -->
	<script src="assets/js/jquery-3.5.0.min.js"></script>

	<!-- Bootstrap Core JS -->
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

	<!-- Custom JS -->
	<script src="assets/js/admin.js"></script>

</body>

</html>