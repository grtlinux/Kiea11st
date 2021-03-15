<body bgcolor="#4A4A4D">
<c:if test="${result.status == 'OK'}">
<script type="text/javascript">
    alert('${result.message}');
    window.close();
    window.opener.location.reload(false);
</script>
</c:if>
<c:if test="${result.status != 'OK'}">
<br/><br/><br/>
${result.message}
</c:if>
</body>
