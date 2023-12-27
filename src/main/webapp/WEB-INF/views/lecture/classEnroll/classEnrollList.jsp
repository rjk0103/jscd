<%--
  Created by IntelliJ IDEA.
  User: george
  Date: 12/3/23
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Noto+Serif+KR:wght@900&display=swap"
          rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/reset.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/jscdReset.css"/>">
    <link rel="stylesheet" tyep="text/css" href="<c:url value="/css/admin/home.css"/>">
<%--    <link rel="stylesheet" tyep="text/css" href="<c:url value="/css/regist.css"/>">--%>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/adminInfo.css"/>">
    <!-- 탭 아이콘 & 글자 지정 -->
    <link rel="icon" href="/img/white_mainlogo.png"/>
    <link rel="apple-touch-icon" href="/img/white_mainlogo.png"/>
    <title>정석코딩 관리자 | 강의 과목 목록</title>
    <%--폰트어썸 라이브러리 불러오기--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script>
        let msg = "${msg}";
        if(msg == "DEL_ERR") alert("삭제되었거나 없는 게시물입니다.");
        if(msg == "DEL_OK") alert("성공적으로 삭제되었습니다.");
        if(msg == "WRT_OK") alert("성공적으로 등록되었습니다.");
        if(msg == "MOD_OK") alert("해당 게시물을 정상적으로 수정하였습니다.");
    </script>
</head>
<body>
<header>
    <jsp:include page="../../admin/header.jsp"/>
</header>
<div id="adminContent">
    <nav>
        <jsp:include page="../../admin/sidebar.jsp"/>
    </nav>
    <main>
        <div id="memberInfo">
            <div id="infoTitleBox">
                <h1>
                    <i class="fa-solid fa-book" style="color: #353739;"></i>
                    &nbsp;&nbsp;정석코딩 과목 목록</h1>
            </div>
            <div id="main_content_controll">
                <div id="lectureSearchBox">
                    <%--검색 부분--%>
                </div>
                <div id="lectureWriteBox">
                    <input type="button" class="registeBtn" value="강의 추가" onclick="location.href='<c:url value="/adminManage/classEnroll/write"/>'">
                </div>

            </div>
            <div id="memberListBox">
                <table>
                    <tr>
                        <th>과목 번호</th>
                        <th>등록된 과목 이름</th>
                        <th>최초 등록일</th>
                        <th>최종 수정일</th>
                    </tr>
                    <c:forEach var="classEnrollDto" items="${classEnrollList}">
                        <tr>
                            <td>
                                    ${classEnrollDto.classCode}
                            </td>
                            <td>
                                <a class="subject_name" href="<c:url value='/adminManage/classEnroll/read?classCode=${classEnrollDto.classCode}'/>">${classEnrollDto.className}</a>
                            </td>
                            <td>
                                <fmt:formatDate value="${classEnrollDto.regDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
                            </td>
                            <td>
                                <fmt:formatDate value="${classEnrollDto.modifyDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div id="NaviBox">
                <%--내비게이션 부분--%>
            </div>
        </div>
    </main>
</div>
</body>
</html>
