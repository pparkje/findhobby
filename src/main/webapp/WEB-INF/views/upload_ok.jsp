<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang='ko'>
<head>
<meta charset="utf-8" />
<title>Hello JSP</title>
</head>
<body>
    <h1>${subject}</h1>

    <h2>원본 이미지</h2>
    <img src="${item.fileUrl}" width="240" />

    <ul>
        <li>fieldName: ${item.fieldName}</li>
        <li>orginName: ${item.orginName}</li>
        <li>contentType: ${item.contentType}</li>
        <li>fileSize: ${item.fileSize}</li>
        <li>filePath: ${item.filePath}</li>
    </ul>
</body>
</html>



