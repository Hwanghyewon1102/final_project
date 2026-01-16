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
    content="width=device-width, initial-scale=1.0, user-scalable=no"
  />
  <title>HQ Payable Detail</title>

  <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700&display=swap"
    rel="stylesheet"
  />

  <link rel="stylesheet" href="/vendor/fonts/boxicons.css" />
  <link rel="stylesheet" href="/vendor/css/core.css" />
  <link rel="stylesheet" href="/vendor/css/theme-default.css" />
  <link rel="stylesheet" href="/css/demo.css" />
  <link rel="stylesheet" href="/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

  <script src="/vendor/js/helpers.js"></script>
  <script src="/js/config.js"></script>
</head>

<body>
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">

    <c:import url="/WEB-INF/views/template/aside.jsp"/>

    <div class="layout-page">
      <c:import url="/WEB-INF/views/template/header.jsp"/>

      <div class="content-wrapper">
        <div class="container-xxl container-p-y">

          <!-- ================= 상단 요약 ================= -->
          <div class="row mb-4">
            <div class="col-12">
              <div class="card">
                <div class="card-body d-flex justify-content-between">
                  <div>거래처 코드 : <strong>${vendor.vendorCode}</strong></div>
                  <div>거래처명 : <strong>${vendor.vendorName}</strong></div>
                  <div>조회 월 : <strong>${baseMonth}</strong></div>
                </div>
              </div>
            </div>
          </div>

          <!-- ================= 물품대금 미지급 ================= -->
          <div class="row mb-4">
            <div class="col-12">
              <div class="card">
                <h5 class="card-header">물품대금 미지급 내역</h5>
                <div class="table-responsive">
                  <table class="table align-middle">
                    <thead>
                      <tr>
                        <th>채권코드</th>
                        <th>발주일자</th>
                        <th class="text-end">품목 수</th>
                        <th class="text-end">공급가액</th>
                        <th class="text-end">세액</th>
                        <th class="text-end">합계</th>
                        <th class="text-end">남은 금액</th>
                        <th class="text-center">상세</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:choose>
                        <c:when test="${empty orderList}">
                          <tr>
                            <td colspan="8" class="text-center text-muted">
                              데이터가 없습니다.
                            </td>
                          </tr>
                        </c:when>
                        <c:otherwise>
                          <c:forEach items="${orderList}" var="row">
                            <tr>
                              <td>${row.receivableId}</td>
                              <td>
                                <fmt:formatDate value="${row.orderDate}" pattern="yyyy-MM-dd"/>
                              </td>
                              <td class="text-end">${row.itemCount}</td>
                              <td class="text-end">
                                <fmt:formatNumber value="${row.supplyAmount}"/>
                              </td>
                              <td class="text-end">
                                <fmt:formatNumber value="${row.taxAmount}"/>
                              </td>
                              <td class="text-end fw-bold">
                                <fmt:formatNumber value="${row.totalAmount}"/>
                              </td>
                              <td class="text-end text-danger fw-bold">
                                <fmt:formatNumber value="${row.remainAmount}"/>
                              </td>
                              <td class="text-center">
                                <button
                                  class="btn btn-sm btn-outline-primary"
                                  data-bs-toggle="modal"
                                  data-bs-target="#itemModal"
                                  data-receivable-id="${row.receivableId}"
                                  data-order-date="<fmt:formatDate value='${row.orderDate}' pattern='yyyy-MM-dd'/>">
                                  보기
                                </button>
                              </td>
                            </tr>
                          </c:forEach>
                        </c:otherwise>
                      </c:choose>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

          <!-- ================= 지급 이력 + 금액 요약 ================= -->
          <div class="row">
            <div class="col-lg-6 mb-4">
              <div class="card">
                <h5 class="card-header">지급 이력</h5>
                <div class="table-responsive">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>지급일</th>
                        <th>담당자</th>
                        <th class="text-end">금액</th>
                        <th>구분</th>
                        <th>비고</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:choose>
                        <c:when test="${empty transactionList}">
                          <tr>
                            <td colspan="5" class="text-center text-muted">
                              데이터가 없습니다.
                            </td>
                          </tr>
                        </c:when>
                        <c:otherwise>
                          <c:forEach items="${transactionList}" var="tx">
                            <tr>
                              <td>
                                <fmt:formatDate value="${tx.transactionDate}" pattern="yyyy-MM-dd"/>
                              </td>
                              <td>${tx.memberName}</td>
                              <td class="text-end">
                                <fmt:formatNumber value="${tx.transactionAmount}"/>
                              </td>
                              <td>${tx.transactionTypeName}</td>
                              <td>${tx.transactionMemo}</td>
                            </tr>
                          </c:forEach>
                        </c:otherwise>
                      </c:choose>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

            <div class="col-lg-6 mb-4">
              <div class="card">
                <h5 class="card-header">금액 요약</h5>
                <table class="table">
                  <tbody>
                    <tr>
                      <th>총 거래 금액</th>
                      <td class="text-end">
                        <fmt:formatNumber value="${amountSummary.totalAmount}"/>
                      </td>
                    </tr>
                    <tr>
                      <th>지급 금액</th>
                      <td class="text-end">
                        <fmt:formatNumber value="${amountSummary.paidAmount}"/>
                      </td>
                    </tr>
                    <tr>
                      <th class="text-danger">미지급 금액</th>
                      <td class="text-end text-danger fw-bold">
                        <fmt:formatNumber value="${amountSummary.unpaidAmount}"/>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>

        <c:import url="/WEB-INF/views/template/footer.jsp"/>
      </div>
    </div>
  </div>
</div>

<c:import url="/WEB-INF/views/receivable/receivable-item-modal.jsp"/>
<c:import url="/WEB-INF/views/receivable/receivable-payment-modal.jsp"/>

<script src="/vendor/libs/jquery/jquery.js"></script>
<script src="/vendor/libs/popper/popper.js"></script>
<script src="/vendor/js/bootstrap.js"></script>
<script src="/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/vendor/js/menu.js"></script>
<script src="/js/main.js"></script>

</body>
</html>
