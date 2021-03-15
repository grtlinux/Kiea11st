<body bgcolor="#4A4A4D">
<%
if(session.getAttribute("userid")!=null) {
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<script src="/sasma/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
function showHide(idValue,btnId) {
    if( document.getElementById(idValue).style.display=='none' ){
        document.getElementById(idValue).style.display = 'table-row';
        document.getElementById(btnId).html = "숨기기";
    } else {
        document.getElementById(idValue).style.display = 'none';
        document.getElementById(btnId).html = "내용보기";
    }
}
function deleteRow(policyName) {
    document.policyForm.polynm.value = policyName;
    document.policyForm.submit();
}
</script>
<form id="policyForm" name="policyForm" method="post" target="_self" action="<%=request.getContextPath()%>/policy/delete2.sas">
<input type="hidden" name="polynm" value="">
</form>
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
    <tr height="40">
        <td width="1">&nbsp;</td>
        <td width="19">&nbsp;</td>
        <td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">캠페인 정책 관리</font></b></td>
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
                        <th width="200" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">정책명</font></th>
                        <th width="490" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">적용내용</font></th>
                        <th width="120" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록자</font></th>
                        <th width="120" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록일</font></th>
                        <th width="100" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D">&nbsp;</th>
                    </tr>
                </thead>
                <c:if test="${count == 0}">
                <tr>
                    <td colspan="5" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록된 정책이 없습니다.</font></td>
                </tr>
                </c:if>
                <c:if test="${empty count}">
                <tr>
                    <td colspan="5" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록된 정책이 없습니다.</font></td>
                </tr>
                </c:if>
                <c:if test="${count != 0}">
                    <c:forEach var="row" items="${result}" varStatus="status">
                        <c:if test="${row.polyseq == 1}">
                <tr>
                    <td align="center" bgcolor="#4A4A4D">
                        <font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.polynm}"/></font>
                    </td>
                    <td align="center" bgcolor="#4A4A4D">
                        <font face="Malgun Gothic" size="2" color="#FFFFFF">${fn:replace(row.apply_cnts, newLineChar, "<br/>")}</font>
                    </td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.reg_user}"/>&nbsp;</font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.reg_dttm}"/>&nbsp;</font></td>
                    <td align="center" bgcolor="#4A4A4D">
                        <button id="rowIdBtn<c:out value="${status.count}"/>" onclick="return showHide('rowId<c:out value="${status.count}"/>','rowIdBtn<c:out value="${status.count}"/>');" style="background-color:#453A39;border:none;padding:5px">
                            <font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>보기</b>&nbsp;</font>
                        </button>
                    </td>
                </tr>
                <tr id="rowId<c:out value="${status.count}"/>" style="display:none;">
                    <td align="center" colspan="5">
                        <table id="innerPolicy<c:out value="${status.count}"/>" width="90%">
                            <tr height="25" valign="center">
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">정책 :&nbsp;(
                                <c:forEach var="metaRow" items="${meta}" varStatus="metaStatus">
                                    <c:if test="${row.target_flag_nm != null}">
                                        <c:if test="${row.target_flag_nm == metaRow.column_name}">
                                            <c:out value="${metaRow.column_title}"/>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                                        &nbsp;<c:out value="${row.target_calc_flag_cd}"/>&nbsp;<c:out value="${row.target_apply_val}"/>)</font></td>
                            </tr>
                        </c:if>
                        <c:if test="${row.polyseq != 1}">
                            <tr height="25" valign="center">
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">정책 :&nbsp;(
                                <c:forEach var="metaRow" items="${meta}" varStatus="metaStatus">
                                    <c:if test="${row.target_flag_nm != null}">
                                        <c:if test="${row.target_flag_nm == metaRow.column_name}">
                                            <c:out value="${metaRow.column_title}"/>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                                        &nbsp;<c:out value="${row.target_calc_flag_cd}"/>&nbsp;<c:out value="${row.target_apply_val}"/>)</font></td>
                            </tr>
                        </c:if>
                        <c:if test="${row.polyseq == row.cnt}">
                        </table>
                        <table style="width: 800px">
                            <tr>
                                <td align="center">
                                    <button onclick="return deleteRow('<c:out value="${row.polynm}"/>');" style="background-color:#453A39;border:none;padding:5px">
                                        <font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>삭제</b>
                                        </font>
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                        </c:if>
                    </c:forEach>
            </table>
        </td>
        <td>&nbsp;</td>
    </tr>
                </c:if>


    <tr height="20">
        <td>&nbsp;</td>
        <td colspan="2" bgcolor="#27292D">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr height="40">
        <td width="20">&nbsp;</td>
        <td colspan="2" bgcolor="#27292D" align="right">
            <button onclick="return openPopupForAppendPopup();" style="background-color:#453A39;border:none;padding:5px">
                <font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>정책 추가</b>&nbsp;
                </font>
            </button>&nbsp;&nbsp;
        </td>
        <td width="20">&nbsp;</td>
    </tr>

    <tr height="40">
        <td>&nbsp;</td>
        <td colspan="2" bgcolor="#27292D">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
<script type="text/javascript">
function openPopupForAppendPopup() {
    window.open('<%=request.getContextPath()%>/policy/insert.sas',
                    "_blank",
                    "width=700,height=600,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no,scrollbars=1");
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
