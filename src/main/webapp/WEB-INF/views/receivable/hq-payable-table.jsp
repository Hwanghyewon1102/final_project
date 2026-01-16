<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<table class="table table-hover align-middle">
  <thead class="table-light">
    <tr>
      <th>거래처 코드</th>
      <th>거래처명</th>
      <th>기준월</th>
      <th class="text-end">총 미지급금액</th>
      <th class="text-center">관리</th>
    </tr>
  </thead>

  <tbody>
    <c:forEach var="row" items="${list}">
      <tr>
        <td class="fw-semibold">${row.vendorCode}</td>
        <td>${row.vendorName}</td>
        <td>${row.baseMonth}</td>
        <td class="text-end fw-bold text-primary">
          <fmt:formatNumber value="${row.totalUnpaidAmount}" />
        </td>
        <td class="text-center">
          <a
            class="btn btn-sm btn-outline-primary"
            href="/receivable/vendor/detail?vendorCode=${row.vendorCode}&baseMonth=${row.baseMonth}">
            상세
          </a>
        </td>
      </tr>
    </c:forEach>

    <c:if test="${empty list}">
      <tr>
        <td colspan="5" class="text-center text-muted py-4">
          조회된 데이터가 없습니다.
        </td>
      </tr>
    </c:if>
  </tbody>
</table>

 <jsp:include page="/WEB-INF/views/common/pagination.jsp" />
