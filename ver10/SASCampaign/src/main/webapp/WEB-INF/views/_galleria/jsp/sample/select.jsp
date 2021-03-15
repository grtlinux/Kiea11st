<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="1">
<c:forEach items="${result}" var="notice" varStatus="status">
<tr>
    <td>${status.count}</td>
    <td>${notice.val1}</td>
    <td>${notice.val2}</td>
</tr>
</c:forEach>
</table>
