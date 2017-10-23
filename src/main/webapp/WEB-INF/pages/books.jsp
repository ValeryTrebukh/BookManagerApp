
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Books List</title>

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


<h1>Books List</h1>

<c:url var="addAction" value="/search"/>

<form:form action="${addAction}" commandName="book">
    <table>
        <tr>
            <input type="text" name="search" id="search"
                   placeholder="Book title or Author"/>

            <input type="submit" value="<spring:message text="Search"/>"/>
        </tr>
    </table>
</form:form>

<a href="<c:url value="/prev/"/>">Prev page </a> - <a href="<c:url value="/next/"/>"> Next page</a>
<br>


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
    <c:if test="${!empty listBooks}">
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
    </c:if>
</table>



<h1>Add New Book</h1>

<c:url var="addAction" value="/books/add"/>


<form:form action="${addAction}" commandName="book">
    <table>
        <c:if test="${!empty book.title}">
            <tr>
                <td><form:label path="id"><spring:message text="id"/></form:label></td>
                <td><form:input path="id" readonly="true" size="8"/></td>
            </tr>
        </c:if>
        <tr>
            <td><form:label path="title"><spring:message text="Title"/></form:label></td>
            <td><form:input path="title"/></td>
        </tr>
        <tr>
            <td><form:label path="description"><spring:message text="Description"/></form:label></td>
            <td><form:input path="description"/></td>
        </tr>
        <tr>

            <td><form:label path="author"> <spring:message text="Author"/></form:label></td>
            <c:if test="${!empty book.author}">
                <td><form:input path="author" readonly="true"/></td>
            </c:if>
            <c:if test="${empty book.author}">
                <td><form:input path="author"/></td>
            </c:if>
        </tr>
        <tr>
            <td><form:label path="isbn"><spring:message text="ISBN"/></form:label></td>
            <td><form:input path="isbn"/></td>
        </tr>
        <tr>
            <td><form:label path="printYear"><spring:message text="Print Year"/></form:label></td>
            <td><form:input path="printYear"/></td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty book.title}">
                    <input type="submit" value="<spring:message text="Edit Book"/>"/>
                </c:if>
                <c:if test="${empty book.title}">
                    <input type="submit" value="<spring:message text="Add Book"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>