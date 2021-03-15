<body bgcolor="#4A4A4D">
<%
if(session.getAttribute("userid")!=null) {
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/sasma/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
function runNow(cmpgn_id) {
  if (confirm("실행 하시겠습니까?\n실행 후에는 중지할 수 없습니다.")) {
    var url="<%=request.getContextPath()%>/approve/runCamp.sas";
    var params="campaign_id="+cmpgn_id;
    //alert(url+"?"+params);

    jQuery.ajax({
        type:"POST",
        url:url,
        data:params,
        dataType: "json",
        success:function(args){
            alert('실행되었습니다.');
            location.reload();
        },
        error:function(data, status, err) {
          //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
  }
}
function search() {
    if($("#monitorDate").val()=='') {
        document.frmSearch.searchDate.value='';
        document.frmSearch.submit();
    } else if(!$("#monitorDate").val().match(/^(\d{4})(\d{2})(\d{2})/)) {
        alert('등록일을 형식에 맞춰서 입력해 주세요.\n(YYYYMMDD)');
        return;
    } else {
        document.frmSearch.searchDate.value=$('#monitorDate').val();
        document.frmSearch.submit();
    }
}
function openPopupApprove() {
    var url = '<%=request.getContextPath()%>/approve/select.sas';
    var popOptions = "dialogWidth:1024px; dialogHeight:768px; center: yes; resizable: no; status: no; scroll: yes;";
    //var vReturn = window.showModalDialog(url, window,  popOptions );
    //if (vReturn == 'ok'){
    var vReturn = window.open(url, window,  popOptions );   // new 20201228
    if (vReturn != null){   // new 20201228
        updateDocument(cmpgn_id);
    } else {
    }
    location.reload();
}
</script>
<form name="frmSearch" action="<%=request.getContextPath()%>/approve/main.sas">
<input type="hidden" name="searchDate" id="searchDate" value="${searchDate}" />
</form>
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
    <tr height="40">
        <td width="1">&nbsp;</td>
        <td width="19">&nbsp;</td>
        <td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">캠페인 승인 대기 문서 조회</font></b></td>
        <td width="1">&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="2">
            <table width="100%" border="0" bgcolor="#27292D">
                <tr height="20">
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td width="20">&nbsp;</td>
                    <td width="80" align="right"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록일:</font></td>
                    <td width="150">

<c:if test="${empty searchDate}">
                        <input type="text" id="monitorDate" width="140" style="width:140px;background-color:#4A4A4D;color:#FFFFFF">
</c:if>
<c:if test="${not empty searchDate}">
                        <input type="text" id="monitorDate" width="140" style="width:140px;background-color:#4A4A4D;color:#FFFFFF" value="${searchDate}">
</c:if>
                    </td>

                    <td>&nbsp;</td>
                    <td width="100" align="right"><button onclick="return search();" style="background-color:#453A39;border:none;padding:5px"><font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;&nbsp;&nbsp;<b>검색</b>&nbsp;&nbsp;&nbsp;</font></button></td>
                    <td width="20">&nbsp;</td>
                </tr>
            </table>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr height="30">
        <td>&nbsp;</td>
        <td colspan="2" align="right" bgcolor="#27292D">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="2" align="center" bgcolor="#27292D">
            <table cellspacing="3" cellpadding="10" width="950">
                <thead>
                    <tr>
                        <th width="150" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">캠페인(그룹)<br/>코드</font></th>
                        <th width="150" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">실행부서</font></th>
                        <th width="340" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">캠페인(그룹)명</font></th>
                        <th width="110" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">행사<br/>시작일</font></th>
                        <th width="110" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">행사<br/>종료일</font></th>
                        <th width="140" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">상태</font></th>
                        <th width="90" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">신청자</font></th>
                        <th width="120" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">승인<br/>신청일</font></th>
                        <th width="100"  style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D">&nbsp;</th>
                    </tr>
                </thead>
<c:if test="${count != 0}">
    <c:forEach var="row" items="${result}" varStatus="status">
                <tr>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.cmpgn_id}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.exec_dept_cd}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.cmpgn_nm}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.schedule_strt_dt}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.schedule_end_dt}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.confirm_status_nm}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.req_emp_id}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.req_dt}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D">
<c:if test="${row.schedule_exec_type == '03'}">
    <c:if test="${row.confirm_status_cd == 'C'}">
        <button onclick="return runNow('<c:out value="${row.cmpgn_id}"/>');" style="background-color:#453A39;border:none;padding:5px">
            <font face="Malgun Gothic" size="2" color="#FFFFFF">실행</font>
        </button>
    </c:if>
    <c:if test="${row.confirm_status_cd != 'C'}">
        &nbsp;
    </c:if>
</c:if>
<c:if test="${row.schedule_exec_type != '03'}">
    &nbsp;
</c:if>
                    </td>
                </tr>
    </c:forEach>
</c:if>
<c:if test="${count == 0}">
                <tr>
                    <td colspan="9" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">승인 관련 캠페인이 없습니다.</font></td>
                </tr>
</c:if>
<c:if test="${empty count}">
                <tr>
                    <td colspan="9" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">승인 관련 캠페인이 없습니다.</font></td>
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
                    <td align="right"><button onclick="return openPopupApprove();" style="background-color:#453A39;border:none;padding:5px"><font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;&nbsp;&nbsp;<b>캠페인 추가 신청</b>&nbsp;&nbsp;&nbsp;</font></button></td>
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
<%
} else {
%>
<br/><br/><br/><br/><br/>
<center><font face="Malgun Gothic" size="20" color="#FFFFFF">세션이 종료되었습니다.<br/><br/>다시 로그인 하시기 바랍니다.</font></center>
<%
}
%>
</body>
