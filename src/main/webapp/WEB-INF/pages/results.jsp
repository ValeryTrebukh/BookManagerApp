
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Search Results</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        a:visited, a {
            color: blue;
            text-decoration: none;
        }
        a:hover {
            color: darkmagenta;
        }
    </style>
</head>
<body>

<h1>Search Results</h1>

<a href="<c:url value="/books"/>">Back</a>
<br>
<br>
<c:if test="${!empty listBooks}">
    <table class="tg">
        <tr>
            <th width="160">Title</th>
            <th width="200">Description</th>
            <th width="160">Author</th>
            <th width="120">ISBN</th>
            <th width="100">Print Year</th>
            <th width="100">Read Already</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.title}</td>
                <td>${book.description}</td>
                <td>${book.author}</td>
                <td>${book.isbn}</td>
                <td>${book.printYear}</td>
                <c:if test="${book.readAlready==false}">
                    <td><a href="<c:url value='/read/${book.id}'/>">Read now!</a></td>
                </c:if>
                <c:if test="${book.readAlready==true}">
                    <td><spring:message text="Already Read"/></td>
                </c:if>
                <td><a href="<c:url value='/edit/${book.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${empty listBooks}">
    No matches. <a href="http://www.google.com"/>Ask Google</a>
</c:if>
</body>
</html>
