<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body bgcolor="#4A4A4D">
<script type="text/javascript">
    alert('${result.message}(${result.status})');
<c:if test="${result.status == 'OK'}">
    window.close();
    window.opener.location.reload(false);
</c:if>
<c:if test="${result.status == 'FAIL'}">
    history.back();
</c:if>
</script>
</body>
