<body bgcolor="#4A4A4D">
<%
if(session.getAttribute("userid")!=null) {
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/sasma/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
function functStop(flag_cd, crm_no) {
    if (confirm("중단 하시겠습니까?")) {
        jQuery.ajax({
            type:"POST",
            url:"<%=request.getContextPath()%>/appendCustomer/delete.sas",
            data:"crm_no="+crm_no+"&cmpgn_flag_cd="+flag_cd+"&del_yn=Y",
            dataType: "json",
            success:function(data) {
                alert('중단되었습니다.');
                location.reload();
            },
            error: function(data, status, err) {
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }
}
function functStart(flag_cd, crm_no) {
    if (confirm("사용 하시겠습니까?")) {
        jQuery.ajax({
            type:"POST",
            url:"<%=request.getContextPath()%>/appendCustomer/delete.sas",
            data:"crm_no="+crm_no+"&cmpgn_flag_cd="+flag_cd+"&del_yn=N",
            dataType: "json",
            success:function(data) {
                alert('처리되었습니다.');
                location.reload();
            },
            error: function(data, status, err) {
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }
}
function search() {
    document.frmSearch.hidden_cmpgn_flag_cd.value = $('#cmpgn_flag_cd option:selected').val();
    document.frmSearch.submit();
}
</script>
<form name="frmSearch" action="<%=request.getContextPath()%>/appendCustomer/main.sas">
    <input type="hidden" name="last_crm_no"   id="last_crm_no"   value="${last_crm_no}" />
    <input type="hidden" name="hidden_cmpgn_flag_cd"   id="hidden_cmpgn_flag_cd"   value="${cmpgn_flag_cd}" />
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
    <tr height="40">
        <td width="1">&nbsp;</td>
        <td width="19">&nbsp;</td>
        <td valign="middle" width="100%"><b><font color="#FFFFFF">직원 등록</font></b></td>
        <td width="1">&nbsp;</td>
    </tr>
    <tr>
        <td></td>
        <td colspan="2">
            <table width="100%" border="0" bgcolor="#27292D">
                <tr height="20">
                    <td colspan="14">&nbsp;</td>
                </tr>
                <tr>
                    <td width="50">&nbsp;</td>
                    <td width="100"><font size="2" color="#FFFFFF">캠페인구분:</font></td>
                    <td width="150">
                        <select name="cmpgn_flag_cd" id="cmpgn_flag_cd" width="140" style="width: 140px">
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value=""><font size="2" color="#FFFFFF">모두</font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='01' <c:if test="${cmpgn_flag_cd == '01'}">checked="checked"</c:if>><font size="2" color="#FFFFFF">홍보 </font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='02' <c:if test="${cmpgn_flag_cd == '02'}">checked="checked"</c:if>><font size="2" color="#FFFFFF">세일안내 </font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='03' <c:if test="${cmpgn_flag_cd == '03'}">checked="checked"</c:if>><font size="2" color="#FFFFFF">CLM 프로그램 </font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='04' <c:if test="${cmpgn_flag_cd == '04'}">checked="checked"</c:if>><font size="2" color="#FFFFFF">VIP 프로그램 </font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='05' <c:if test="${cmpgn_flag_cd == '05'}">checked="checked"</c:if>><font size="2" color="#FFFFFF">실시간이벤트 </font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='06' <c:if test="${cmpgn_flag_cd == '06'}">checked="checked"</c:if>><font size="2" color="#FFFFFF">브랜드DM </font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='07' <c:if test="${cmpgn_flag_cd == '07'}">checked="checked"</c:if>><font size="2" color="#FFFFFF">온라인 캠페인 </font></option>
                        </select>
                    </td>

</form>
                    <td width="1000">&nbsp;</td>
                    <td width="100"><button onclick="return search();" style="background-color:#453A39;border:none;padding:5px"><font size="2" color="#FFFFFF">&nbsp;&nbsp;&nbsp;<b>검색</b>&nbsp;&nbsp;&nbsp;</font></button></td>
                    <td width="20">&nbsp;</td>
                </tr>
            </table>
        </td>
        <td></td>
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
                        <th width="400" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF">캠페인 구분</font></th>
                        <th width="200" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF">CRM 번호</font></th>
                        <th width="300" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF">직원명</font></th>
                        <th width="100" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF">사용여부</font></th>
                        <th width="140" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D">&nbsp;</th>
                    </tr>
                </thead>
<c:if test="${count != 0}">
    <c:forEach var="row" items="${result}" varStatus="status">
                <tr>
                    <td align="center" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF"><c:out value="${row.cmpgn_flag_nm}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF"><c:out value="${row.crm_no}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF"><c:out value="${row.emp_nm}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF"><c:out value="${row.del_yn_nm}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D">
<c:if test="${row.del_yn != 'Y'}">
                        <button onclick="return functStop('${row.cmpgn_flag_cd}','${row.crm_no}');" style="background-color:#453A39;border:none;padding:5px"><font size="2" color="#FFFFFF">중지</font></button>
</c:if>
<c:if test="${row.del_yn == 'Y'}">
                        <button onclick="return functStart('${row.cmpgn_flag_cd}','${row.crm_no}');" style="background-color:#453A39;border:none;padding:5px"><font size="2" color="#FFFFFF">사용</font></button>
</c:if>
                    </td>
                </tr>
    </c:forEach>
</c:if>
                <c:if test="${count == 0}">
                <tr>
                    <td colspan="5" align="center" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF">등록된 직원이 없습니다.</font></td>
                </tr>
                </c:if>
                <c:if test="${empty count}">
                <tr>
                    <td colspan="5" align="center" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF">등록된 직원이 없습니다.</font></td>
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
                        <button onclick="return openPopupForAppendPopup();" style="background-color:#453A39;border:none;padding:5px">
                            <font size="2" color="#FFFFFF">&nbsp;<b>직원 추가</b>&nbsp;
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
function openPopupForAppendPopup() {
    window.open('<%=request.getContextPath()%>/appendCustomer/insert.sas'
              , "_blank"
              , "width=600,height=500,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no");
}
</script>
<%
} else {
%>
<br/><br/><br/><br/><br/>
<center><font size="20" color="#FFFFFF">세션이 종료되었습니다.<br/><br/>다시 로그인 하시기 바랍니다.</font></center>
<%
}
%>
</body>
