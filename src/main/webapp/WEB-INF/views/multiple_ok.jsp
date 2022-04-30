<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang='ko'>
<head>
<meta charset="utf-8" />
<title>Hello JSP</title>
</head>
<body>
<c:choose>
    <%-- 조회결과가 없는 경우 --%>
    <c:when test="${list == null || fn:length(list) == 0}">
        <h2>업로드 결과가 없습니다.</h2>
    </c:when>
    <%-- 조회결과가 있는  경우 --%>
    <c:otherwise>
        <%-- 조회 결과에 따른 반복 처리 --%>
        <c:forEach var="item" items="${list}" varStatus="status">
            <h2>원본 이미지</h2>
            <img src="${item.filePath}" width="240" />
        
            <h2>썸네일 이미지 </h2>
            <img src="${item.thumbnailUrl}" width="64" />
        
            <ul>
                <li>fieldName: ${item.fieldName}</li>
                <li>orginName: ${item.orginName}</li>
                <li>filePath: ${item.filePath}</li>
                <li>contentType: ${item.contentType}</li>
                <li>fileSize: ${item.fileSize}</li>
                <li>thumbnail: ${item.thumbnailPath}</li>
            </ul>
        </c:forEach>
    </c:otherwise>
</c:choose>
</body>
</html>



