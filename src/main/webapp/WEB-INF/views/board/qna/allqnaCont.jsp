<%@ page import="com.jscd.app.board.qna.qnaDto.AllqnacDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>QnA</title>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/reset.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/allqnaView.css"/>">


    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>


<div id="content">
    <div class="board_title">
        <strong>Q&A</strong>
    </div>

    <div id="viewContainer">
        <div id="title">
            ${read.title}
        </div>
        <div id="info">
            <dl>
                <dt>글번호</dt>
                <dd>${read.allqnaNo}</dd>
            </dl>
            <dl>
                <dt>작성자</dt>
                <dd>${read.writer}</dd>
            </dl>
            <dl>
                <dt>작성일</dt>
                <dd>${read.regDate}</dd>
            </dl>
            <dl>
                <dt>조회수</dt>
                <dd>${read.hit}</dd>
            </dl>
        </div>

        <div id="cont">
            ${read.content}
        </div>
    </div>


    <div id="buttonContainer">
        <button id="list" onclick="location.href='${path}/board/qna/allqnaList'">목록</button>
        <%--    <c:forEach var="modify"  items="${modify}"> </c:forEach>  ///  modifiy?--%>
        <button id="edit" onclick="location.href='${path}/board/qna/allqnaModify?allqnaNo=${read.allqnaNo}'">수정하기
        </button>
        <button id="delete" onclick="deleteConfirmation()">삭제하기</button>
    </div>

    <script>
        function deleteConfirmation(allqnaNo) {
            if (confirm("${read.allqnaNo}번 글을 정말 삭제하시겠습니까?")) {
                location.href = "${path}/board/qna/allqnaDelete?allqnaNo=${read.allqnaNo}";
            }
        }


    </script>


    <form method="POST" id="commentForm" action="${path}/board/qna/cmmtWrite" target="_self">

        <input type="hidden" class="allqnaNo" name="allqnaNo" value="${read.allqnaNo}">
        <br><br>
        <label>댓글 작성자</label>
        <input id="cmtWriter" type="text" name="writer">
        <br> <br> <br>
        <textarea rows="5" cols="50" name="content"></textarea>

        <button id="cmtWrite" type="submit">댓글작성</button>

    </form>

    <br><br><br>


    <div id="cmtContainer">
        <c:forEach items="${comment}" var="comment">

            <div class="comment">
                <dl>
                    <dt>댓글번호</dt>
                    <dd class="cn" name="allqnaCNo">${comment.allqnaCNo}</dd>
                </dl>
                <dl>
                    <dt>작성자</dt>
                    <dd name="writer">${comment.writer}</dd>
                </dl>
                <dl>
                    <dt>등록일자</dt>
                    <dd name="regDate">${comment.regDate}</dd>
                </dl>
                <br><br><br>

                <div id="cmt" name="content">
                        ${comment.content}
                </div>
                <div id="cmtBtn">


                    <button type="button" id="cmtEdit" class="cmtEdit" data-allqnaCNo="${comment.allqnaCNo}">수정</button>
                    <button type="button" class="cmtDelete" data-allqnaCNo="${comment.allqnaCNo}">삭제
                    </button>
                </div>
            </div>


        </c:forEach>


        <div id="bottom"></div>
    </div>


</body>
</html>
