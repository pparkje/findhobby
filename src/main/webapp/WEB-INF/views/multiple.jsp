<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Hello JSP</title>
</head>
<body>
    <h1>JSP 파일업로드</h1>

    <form method="post" action="${pageContext.request.contextPath}/multiple_ok.do" enctype="multipart/form-data">
        <div>
            <label for="photo">사진선택</label>
            <input type="file" name="photo" id="photo" multiple/>
        </div>
        <button type="submit">업로드하기</button>
    </form>
</body>
</html>

