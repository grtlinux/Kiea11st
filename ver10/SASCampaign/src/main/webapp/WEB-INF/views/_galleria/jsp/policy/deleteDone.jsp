<body bgcolor="#4A4A4D">
<c:if test="${result.status == 'OK'}">
<script type="text/javascript">
    alert('${result.message}');
    location.href='<%=request.getContextPath()%>/policy/main.sas';
</script>
</c:if>
<c:if test="${result.status != 'OK'}">
<br/><br/><br/>
${result.message}
</c:if>
</body>
