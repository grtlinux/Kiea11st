<body bgcolor="#4A4A4D">
<%
if(session.getAttribute("userid")!=null) {
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/sasma/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
function deleteFile(docNo) {
    if (confirm("삭제 하시겠습니까?")) {
        jQuery.ajax({
            type:"POST",
            url:"<%=request.getContextPath()%>/mms/delete.sas",
            data:"file_seq="+docNo,
            dataType: "json",
            success:function(data) {
                alert('삭제되었습니다.');
                location.reload();
            },
            error: function(data, status, err) {
                //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }
}
</script>
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
    <tr height="40">
        <td width="1">&nbsp;</td>
        <td width="19">&nbsp;</td>
        <td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">MMS 업로드</font></b></td>
        <td width="1">&nbsp;</td>
    </tr>
    <tr height="20">
        <td>&nbsp;</td>
        <td colspan="2" bgcolor="#27292D">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="2" align="center" bgcolor="#27292D">
            <table cellspacing="3" cellpadding="10" width="90%">
                <thead>
                    <tr>
                        <th width="100" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">일련번호</font></th>
                        <th width="700" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">파일명</font></th>
                        <th width="140" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D">&nbsp;</th>
                    </tr>
                </thead>
<c:if test="${count != 0}">
    <c:forEach var="row" items="${result}" varStatus="status">
                <tr>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.file_seq}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.file_nm}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D">
                        <button onclick="return deleteFile('${row.file_seq}');" style="background-color:#453A39;border:none;padding:5px"><font face="Malgun Gothic" size="2" color="#FFFFFF">삭제</font></button>
                    </td>
                </tr>
    </c:forEach>
</c:if>
                <c:if test="${count == 0}">
                <tr>
                    <td colspan="4" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록된 파일이 없습니다.</font></td>
                </tr>
                </c:if>
                <c:if test="${empty count}">
                <tr>
                    <td colspan="4" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록된 파일이 없습니다.</font></td>
                </tr>
                </c:if>
            </table>
        <td>&nbsp;</td>
    </tr>

    <tr height="40">
        <td>&nbsp;</td>
        <td colspan="2" bgcolor="#27292D" align="right">
            <table width="100%" border="0" bgcolor="#27292D">
                <tr height="20">
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td width="20">&nbsp;</td>
                    <td align="right">
                        <button onclick="return openPopupForAppendPopup('excel');" style="background-color:#453A39;border:none;padding:5px">
                            <font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>MMS 파일 추가</b>&nbsp;
                            </font>
                        </button>
                    </td>
                    <td width="20">&nbsp;</td>
                </tr>
            </table>
        </td>
        <td>&nbsp;</td>
    </tr>

    <tr height="40">
        <td>&nbsp;</td>
        <td colspan="2" bgcolor="#27292D">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
<script type="text/javascript">
function openPopupForAppendPopup(fileType) {
    window.open('<%=request.getContextPath()%>/mms/insert.sas?type=' + fileType
              , "_blank"
              , "width=600,height=300,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no");
}
</script>
<%
} else {
%>
<br/><br/><br/><br/><br/>
<center><font face="Malgun Gothic" size="20" color="#FFFFFF">세션이 종료되었습니다.<br/><br/>다시 로그인 하시기 바랍니다.</font></center>
<%
}
%>
</body>
