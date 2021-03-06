<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/resources/favicon_16.ico">
	<title>Update IP</title>
	
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<meta charset="UTF-8">
	<meta name="description" content="Admin Dashboard Template" />
	<meta name="keywords" content="admin,dashboard" />
	<meta name="author" content="Steelcoders" />
	
	<!-- Styles -->
	<link
		href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600'
		rel='stylesheet' type='text/css'>
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/uniform/css/uniform.default.min.css"
		rel="stylesheet" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/fontawesome/css/font-awesome.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/line-icons/simple-line-icons.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/waves/waves.min.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/switchery/switchery.min.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/3d-bold-navigation/css/style.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/slidepushmenus/css/component.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/toastr/toastr.min.css"
		rel="stylesheet" type="text/css" />
		<link href="${pageContext.servletContext.contextPath}/resources/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
		
	<!-- Theme Styles -->
	<link
		href="${pageContext.servletContext.contextPath}/resources/css/modern.min.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/css/themes/white.css"
		class="theme-color" rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/css/custom.css"
		rel="stylesheet" type="text/css" />
		
	<script
		src="${pageContext.servletContext.contextPath}/resources/plugins/3d-bold-navigation/js/modernizr.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/plugins/offcanvasmenueffects/js/snap.svg-min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/plugins/jquery/jquery-2.1.3.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/plugins/toastr/toastr.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	        <![endif]-->
</head>
<body style="page-header-fixed page-horizontal-bar">
	<%@include file="header.jsp" %>
	
	<!-- content -->
	<div class="page-inner">
		<div class="page-title">
			<h3>Pengaturan Indeks Prestasi</h3>
			<div class="page-breadcrumb">
				<ol class="breadcrumb">
					<li><a href="${pageContext.servletContext.contextPath}/">Beranda</a></li>
					<li class="active">Pengaturan Indeks Prestasi</li>
				</ol>
			</div>
		</div>
		<div id="main-wrapper">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="panel panel-white">
							<div class="panel-heading">
								<h4 class="panel-title">Daftar Perintah</h4>
							</div>
							<div class="panel-body">
								<button type="button" class="btn btn-primary" id="updateIPS" data-loading-text="Memperbaharui IPS...">Update IPS</button>
								<button type="button" class="btn btn-primary" id="updateIPK" data-loading-text="Memperbaharui IPK...">Update IPK</button>
								<button type="button" class="btn btn-primary" id="updateIPD" data-loading-text="Memperbaharui IPD...">Update IPD</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	<!-- end of content -->
	
	<!-- script -->
	<script>
	$(document).ready(function() {
		var contextPath = "${pageContext.servletContext.contextPath}";
		toastr.options = {
				  "closeButton": true,
				  "debug": false,
				  "newestOnTop": false,
				  "progressBar": false,
				  "positionClass": "toast-top-right",
				  "preventDuplicates": true,
				  "showDuration": "300",
				  "hideDuration": "1000",
				  "timeOut": 0,
				  "extendedTimeOut": 0,
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut",
				  "tapToDismiss": true
				};
		
		$("#updateIPS").click(function() {
			$("#updateIPS").button("loading");
			$.ajax({
				url : contextPath + "/update_ips/",
				type : "POST",
				success : function(data) {
					if(data.status=="ok") {
						toastr["success"](data.message, "Sukses");
					}
					$("#updateIPS").button("reset");
				}
			});
		});
		
		$("#updateIPK").click(function() {
			$("#updateIPK").button("loading");
			$.ajax({
				url : contextPath + "/update_ipk/",
				type : "POST",
				success : function(data) {
					if(data.status=="ok") {
						toastr["success"](data.message, "Sukses");
					}
					$("#updateIPK").button("reset");
				}
			});
		});
		
		$("#updateIPD").click(function() {
			$("#updateIPD").button("loading");
			$.ajax({
				url : contextPath + "/update_nilai_dosen/",
				type : "POST",
				success : function(data) {
					if(data.status=="ok") {
						toastr["success"](data.message, "Sukses");
					}
					$("#updateIPD").button("reset");
				}
			});
		});
	});
	</script>
	<!-- end of script -->
	
	<%@include file="footer.jsp" %>
</body>
</html>