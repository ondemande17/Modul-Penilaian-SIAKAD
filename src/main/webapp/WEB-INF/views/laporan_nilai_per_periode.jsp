<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/resources/favicon_16.ico">
	<title>Lihat Nilai Per Periode</title>
	
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
			<h3>Laporan Nilai Per Periode</h3>
			<div class="page-breadcrumb">
				<ol class="breadcrumb">
					<li><a href="${pageContext.servletContext.contextPath}/">Beranda</a></li>
					<li class="active">Laporan Nilai Per Periode</li>
				</ol>
			</div>
		</div>
		<div id="main-wrapper">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-white">
							<div class="panel-heading">
								<h4 class="panel-title">Daftar Nilai</h4>
							</div>
							<div class="panel-body">
								<p>Nama : <c:out value="${pd.getNmPd()}"></c:out></p>
								<p>NIM : <c:out value="${pd.getNimPd()}"></c:out></p>
								
								<c:forEach var="ips" items="${daftarIps}">
									<div class="row">
										<div class="col-md-8 col-md-offset-2">
											<table class="table">
												<thead>
													<tr>
														<th colspan="4">
															Periode : <c:out value="${ips.getTglSmt().getSmt().getNmSmt()} ${ips.getTglSmt().getThnAjaran().getThnThnAjaran()}"></c:out><br />
															IPS : <fmt:formatNumber value="${ips.getNilaiIps()}" maxFractionDigits="2"></fmt:formatNumber>
														</th>
													</tr>
													<tr>
														<th>Kode MK</th>
														<th>Mata Kuliah</th>
														<th>SKS</th>
														<th>Nilai</th>
													</tr>
												</thead>
												<tbody>
													<c:set var="jumlahSks" value="0" scope="page"></c:set>
													<c:forEach var="krs" items="${daftarKrs}">
														<c:if test="${krs.getPemb().getTglSmt().getIdTglSmt() == ips.getTglSmt().getIdTglSmt()}">
														<tr>
															<td><c:out value="${krs.getPemb().getMk().getKodeMK()}"></c:out></td>
															<td><c:out value="${krs.getPemb().getMk().getNamaMK()}"></c:out></td>
															<td><c:out value="${krs.getPemb().getMk().getJumlahSKS()}"></c:out></td>
															<c:choose>
																<c:when test="${krs.getKonversiNilai() != null}">
																	<td><c:out value="${krs.getKonversiNilai().getHuruf()}"></c:out></td>
																</c:when>
																<c:otherwise>
																	<td>-</td>
																</c:otherwise>
															</c:choose>															
														</tr>
														<c:set var="jumlahSks" value="${jumlahSks + krs.getPemb().getMk().getJumlahSKS()}" scope="page"></c:set>
														</c:if>
													</c:forEach>
												</tbody>
												<tfoot>
													<tr>
														<th></th>
														<th>Jumlah SKS</th>
														<th><c:out value="${jumlahSks}"></c:out></th>
														<th></th>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
	<!-- end of content -->
	
	<%@include file="footer.jsp" %>
</body>
</html>