<body bgcolor="#4A4A4D">
<%
if(session.getAttribute("userid")!=null) {
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/sasma/js/jquery-1.9.1.min.js"></script>
<script src="/sasma/js/jquery.form.min.js"></script>
<script>
function cancelUpload() {
    window.close();
}
</script>
<form id="policyForm" name="policyForm" method="post" target="_self" action="<%=request.getContextPath()%>/policy/insertDone2.sas">
<input type="hidden" name="policyCount" value="0">
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
    <tr height="40">
        <td width="1">&nbsp;</td>
        <td width="19">&nbsp;</td>
        <td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">정책 등록</font></b></td>
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
                    <th width="120" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">항목명</font></th>
                    <th align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">입력값</font></th>
                </tr>
                </thead>
                <tr>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">정책명 </font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><input type="text" id="polynm" name="polynm" width="430" style="width:430px;background-color:#4A4A4D;color:#FFFFFF"></font></td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">적용<br/><br/><br/>내용 </font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><textarea id="textareaApplyCnts" name="textareaApplyCnts" style="width:430px;height:150px;font-size:2;background-color:#4A4A4D;color:#FFFFFF"></textarea></font></td>
                </tr>
                <tr>
                    <td colspan='2' align="center" bgcolor="#4A4A4D">
<script>
function addRow(no) {
    var buttonText = $('#rowId'+no+'ButtonAddRow').html();
    //alert(buttonText);
    if(buttonText == '<font face="Malgun Gothic" color="#FFFFFF" size="2">삭제</font>') {
        $('#rowId'+no+'ButtonAddRow').parent().parent().remove();
        var count = 1*(document.policyForm.policyCount.value);
        document.policyForm.policyCount.value = count - 1;
    } else {
        var text = '<tr>'
                 + '    <td width="120" align="right" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">정책 :&nbsp;</font></td>'
                 + '    <td width="140" align="left" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">'
                 + '        <select id="columnName" name="columnName'+no+'" style="background-color:#4A4A4D;color:#FFFFFF;width:130px" width="130">'
<c:forEach var="row" items="${meta}" varStatus="status">
                 + '        <option value="<c:out value="${row.column_name}"/>|<c:out value="${row.data_type}"/>" style="background-color:#4A4A4D;color:#FFFFFF"><c:out value="${row.column_title}"/></option>'
</c:forEach>
                 + '        </select>'
                 + '    </font></td>'
                 + '    <td width="70" bgcolor="#4A4A4D">'
                 + '        <select id="operatorName" name="operatorName'+no+'" style="background-color:#4A4A4D;color:#FFFFFF">'
                 + '            <option value="=">=</option>'
                 + '            <option value="IN">IN</option>'
                 + '            <option value="NOT IN">NOT IN</option>'
                 + '        </select>'
                 + '    </td>'
                 + '    <td width="150" bgcolor="#4A4A4D">'
                 + '        <input type="text" id="inputValue" name="inputValue'+no+'" style="width:100px;background-color:#4A4A4D;color:#FFFFFF">'
                 + '    </td>'
                 + '    <td width="120">'
                 + '        <button id="rowId'+(no+1)+'ButtonAddRow" onclick="return addRow('+ (no+1) +');" style="background-color:#453A39;border:none;padding:5px"><font face="Malgun Gothic" size="2" color="#FFFFFF">추가</font></button>'
                 + '    </td>'
                 + '</tr>';
        $('#innerPolicy1 tr:last').after(text);
        $('#rowId'+no+'ButtonAddRow').html('<font face="Malgun Gothic" size="2" color="#FFFFFF">삭제</font>');
        var count = 1*(document.policyForm.policyCount.value);
        document.policyForm.policyCount.value = count + 1;
    }
}
</script>
                        <table id="innerPolicy1" cellspacing="3" cellpadding="10" width="100%">
                            <tr>
                                <td width="120" align="right" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">정책 :</font></td>
                                <td width="140" align="left" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">
                                    <select id="columnName" name="columnName0" style="background-color:#4A4A4D;color:#FFFFFF;width:130px" width="130">
                                    <c:forEach var="row" items="${meta}" varStatus="status">
                                        <c:if test="${row.column_title != '고객상태코드'}">
                                        <c:if test="${row.column_title != '갤러리아포인트'}">
                                            <option value="<c:out value="${row.column_name}"/>|<c:out value="${row.data_type}"/>" style="background-color:#4A4A4D;color:#FFFFFF"><c:out value="${row.column_title}"/></option>
                                        </c:if>
                                        </c:if>
                                    </c:forEach>
                                    </select>
                                </font></td>
                                <td width="70" bgcolor="#4A4A4D">
                                    <select id="operatorName" name="operatorName0" style="background-color:#4A4A4D;color:#FFFFFF">
                                        <option value="=">=</option>
                                        <option value=">">></option>
                                        <option value="<"><</option>
                                        <option value=">=">>=</option>
                                        <option value="<="><=</option>
                                        <option value="IN">IN</option>
                                        <option value="NOT IN">NOT IN</option>
                                    </select>
                                </td>
                                <td width="150" bgcolor="#4A4A4D">
                                    <input type="text" id="inputValue" name="inputValue0" style="width:100px;background-color:#4A4A4D;color:#FFFFFF">
                                </td>
                                <td width="120">
                                    <button id="rowId1ButtonAddRow" onclick="return addRow(1);" style="background-color:#453A39;border:none;padding:5px"><font face="Malgun Gothic" size="2" color="#FFFFFF">추가</font></button>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

<script type="text/javascript">
function confirmUpload() {
    var l_title = document.policyForm.polynm.value;
    var l_value = document.policyForm.inputValue0.value;
    if (l_title.match(/^\s*$/)) {
        alert('정책명을 입력하세요.');
    } else if(l_value.match(/^\s*$/)) {
        alert('정책 값을 입력하세요.');
    } else {
        document.policyForm.submit();
    }
}
</script>
<!--
                <tr height="30" valign="top">
                    <td colspan='2' align='left'>
                        ※ IN, NOT IN을 선택하시는 경우에는 값들을 콤마(,)로 구분해 주시기 바랍니다.<br/>
                        ※ 날짜의 경우 8자리의 숫자 (YYYYMMDD)를 사용하시기 바랍니다.
                    </td>
                </tr>
-->
                <tr height="10">
                    <td colspan='2' align='right'>
                        <button onclick="return confirmUpload();" style="background-color:#453A39;border:none;padding:5px">
                            <font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>저 장</b>&nbsp;
                            </font>
                        </button>&nbsp;
                        <button onclick="return cancelUpload();" style="background-color:#453A39;border:none;padding:5px">
                            <font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>취 소</b>&nbsp;
                            </font>
                        </button>
                    </td>
                </tr>
            </table>
        <td>&nbsp;</td>
    </tr>

    <tr height="40">
        <td>&nbsp;</td>
        <td colspan="2" bgcolor="#27292D">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</form>
<%
} else {
%>
<br/><br/><br/><br/><br/>
<center><font face="Malgun Gothic" size="20" color="#FFFFFF">세션이 종료되었습니다.<br/><br/>다시 로그인 하시기 바랍니다.</font></center>
<%
}
%>
</body>
