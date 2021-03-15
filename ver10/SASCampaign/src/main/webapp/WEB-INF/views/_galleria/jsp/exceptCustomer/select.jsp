<body bgcolor="#4A4A4D">
<%
if(session.getAttribute("userid")!=null) {
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/sasma/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
function deleteFile(docNo) {
    if (confirm("삭제 하시겠습니까?")) {
        jQuery.ajax({
            type:"POST",
            url:"<%=request.getContextPath()%>/exceptCustomer/delete.sas",
            data:"crm_no="+docNo,
            dataType: "json",
            success:function(data) {
                alert('삭제되었습니다.');
                location.reload();
            },
            error: function(data, status, err) {
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        }
        );
    }
}
</script>
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
    <tr height="40">
        <td width="1">&nbsp;</td>
        <td width="19">&nbsp;</td>
        <td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">대상자 제외</font></b></td>
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
						<th width="110" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">CRM_NO</th>
						<th width="110" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">성명 </font></th>
						<th width="60" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">성별 </font></th>
						<th width="60" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">연령 </font></th>
						<th width="105" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">적용 기간 </font></th>
						<th width="87" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">상태 </font></th>
						<th width="87" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록자</font></th>
						<th width="87" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록일 </font></th>
						<th width="91" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;</font></th>
                    </tr>
                </thead>
<c:if test="${count != 0}">
    <c:forEach var="row" items="${result}" varStatus="status">
                <tr>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.crm_no}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">***(<c:out value="${row.mem_no}"/>)</font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.gndr_cd}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.age_cd}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><fmt:formatDate pattern="yyyy-MM-dd" value="${row.apply_strt_dt}"/><br />~<fmt:formatDate pattern="yyyy-MM-dd" value="${row.apply_end_dt}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.status}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.reg_user_no}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><fmt:formatDate pattern="yyyy-MM-dd" value="${row.reg_dt}"/></font></td>
					<td align="center" bgcolor="#4A4A4D">
					    <button onclick="return deleteFile('${row.crm_no}');" style="background-color:#453A39;border:none;padding:5px">
					        <font face="Malgun Gothic" size="2" color="#FFFFFF"><b>삭제</font>
					    </button>
					</td>
                </tr>
    </c:forEach>
</c:if>
                <c:if test="${count == 0}">
                <tr>
                    <td colspan="9" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록된 고객이 없습니다.</font></td>
                </tr>
                </c:if>
                <c:if test="${empty count}">
                <tr>
                    <td colspan="9" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록된 고객이 없습니다.</font></td>
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
                            <font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>제외고객 추가</b>&nbsp;</font>
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
function openPopupForAppendPopup() {
    window.open('<%=request.getContextPath()%>/exceptCustomer/insert.sas'
              , "_blank"
              , "width=600,height=500,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no");
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
