<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
		<c:import url="/WEB-INF/views/template/aside.jsp"></c:import>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
		<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
        
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
				    <div class="card">
				      <div class="card-header d-flex justify-content-between align-items-center">
				        <h5 class="card-title mb-0">채권 목록 (미수금)</h5>
				        <small class="text-muted">기준일: 2025-12-29</small>
				      </div>

				      <div class="card-body">
				        <div class="table-responsive">
				          <table class="table table-hover align-middle">
				            <thead class="table-light">
				              <tr>
				                <th>채권 ID</th>
				                <th>유형</th>
				                <th class="text-end">공급가액</th>
				                <th class="text-end">세액</th>
				                <th class="text-end">합계</th>
				                <th>발생일</th>
				                <th>상태</th>
				                <th class="text-center">관리</th>
				              </tr>
				            </thead>
				            <tbody>
				              <c:forEach var="r" items="${receivables}">
				                <tr>
				                  <td class="fw-semibold">${r.receivableId}</td>
				
				                  <td>
				                    <span class="badge bg-label-primary">미수금</span>
				                  </td>
				
				                  <td class="text-end">
				                    <fmt:formatNumber value="${r.receivableSupplyAmount}" type="number" />
				                  </td>
				
				                  <td class="text-end">
				                    <fmt:formatNumber value="${r.receivableTaxAmount}" type="number" />
				                  </td>
				
				                  <td class="text-end fw-bold text-primary">
				                    <fmt:formatNumber value="${r.receivableTotalAmount}" type="number" />
				                  </td>
				
				                  <td>${r.receivableDate}</td>
				
				                  <td>
				                    <c:choose>
				                      <c:when test="${r.receivableStatus eq 'O'}">
				                        <span class="badge bg-label-warning">미지급</span>
				                      </c:when>
				                      <c:when test="${r.receivableStatus eq 'P'}">
				                        <span class="badge bg-label-info">부분지급</span>
				                      </c:when>
				                      <c:when test="${r.receivableStatus eq 'C'}">
				                        <span class="badge bg-label-success">완납</span>
				                      </c:when>
				                    </c:choose>
				                  </td>
				
				                  <td class="text-center">
				                    <a href="/receivable/detail?id=${r.receivableId}"
				                       class="btn btn-sm btn-outline-primary">
				                      상세
				                    </a>
				                  </td>
				                </tr>
				              </c:forEach>
				
				              <c:if test="${empty receivables}">
				                <tr>
				                  <td colspan="8" class="text-center text-muted py-4">
				                    조회된 채권 데이터가 없습니다.
				                  </td>
				                </tr>
				              </c:if>
				            </tbody>
				          </table>
				        </div>
				      </div>
				    </div>
              </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->
            <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->


    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="/vendor/libs/jquery/jquery.js"></script>
    <script src="/vendor/libs/popper/popper.js"></script>
    <script src="/vendor/js/bootstrap.js"></script>
    <script src="/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="/js/main.js"></script>

    <!-- Page JS -->
    <script src="/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>