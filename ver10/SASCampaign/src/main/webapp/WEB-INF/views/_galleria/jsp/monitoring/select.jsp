<body bgcolor="#4A4A4D">
<%
if(session.getAttribute("userid")!=null) {
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
function stopExecuting(campaignNo, sourceType) {
  if (confirm("중지 하시겠습니까?\n중지 후에는 재실행할 수 없습니다.")) {
    jQuery.ajax({
      type:"POST",
      url:"<%=request.getContextPath()%>/monitoring/update.sas",
      data:"campaign_id="+campaignNo+"&campaign_source_type=" + sourceType,
      dataType: "json",
      success:function(data) {
        alert('중지되었습니다.');
        location.reload();
      },
      error: function(data, status, err) {
          //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
    });
  }
}
function search() {
    document.frmSearch.searchEmp.value=$('#comboMember option:selected').val();
    document.frmSearch.searchChannel.value=$('#comboChannel option:selected').val();
    document.frmSearch.submit();
}
</script>
<form name="frmSearch" action="<%=request.getContextPath()%>/monitoring/main.sas">
<input type="hidden" name="searchEmp" id="searchEmp" value="${searchEmp}" />
<input type="hidden" name="searchChannel" id="searchChannel" value="${searchChannel}" />
</form>
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
    <tr height="40">
        <td width="1">&nbsp;</td>
        <td width="19">&nbsp;</td>
        <td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">캠페인 모니터링</font></b></td>
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
<!--
                    <td width="100"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록자:</font></td>
                    <td width="150">
                        <select name="comboMember" id="comboMember" width="140" style="width: 140px">
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value=""><font face="Malgun Gothic" size="2" color="#FFFFFF">모두</font></option>
                            <c:forEach var="empRow" items="${emp}" varStatus="status">
                                <c:if test="${empRow.emp_id == searchEmp}">
                                    <option selected="selected" style="background-color:#4A4A4D;color:#FFFFFF" value="<c:out value="${empRow.emp_id}"/>"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${empRow.emp_nm}"/></font></option>
                                </c:if>
                                <c:if test="${empRow.emp_id != searchEmp}">
                                    <option style="background-color:#4A4A4D;color:#FFFFFF" value="<c:out value="${empRow.emp_id}"/>"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${empRow.emp_nm}"/></font></option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </td>
                    <td width="20">&nbsp;</td>
-->
                    <td width="100"><font face="Malgun Gothic" size="2" color="#FFFFFF">채널:</font></td>
                    <td width="150">
                        <select name="comboChannel" id="comboChannel" width="140" style="width: 140px">
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value=""><font face="Malgun Gothic" size="2" color="#FFFFFF">모두</font></option>
                            <c:forEach var="chnlRow" items="${chnl}" varStatus="status">
                                <c:if test="${chnlRow.chnl_nm == searchChannel}">
                                    <option selected="selected" style="background-color:#4A4A4D;color:#FFFFFF" value="<c:out value="${chnlRow.chnl_nm}"/>"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${chnlRow.chnl_nm}"/></font></option>
                                </c:if>
                                <c:if test="${chnlRow.chnl_cd != searchChannel}">
                                    <option style="background-color:#4A4A4D;color:#FFFFFF" value="<c:out value="${chnlRow.chnl_nm}"/>"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${chnlRow.chnl_nm}"/></font></option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </td>

                    <td width="1000">&nbsp;</td>
                    <td width="100"><button onclick="return search();" style="background-color:#453A39;border:none;padding:5px"><font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;&nbsp;&nbsp;<b>검색</b>&nbsp;&nbsp;&nbsp;</font></button></td>
                    <td width="20">&nbsp;</td>
                </tr>
            </table>
        </td>
        <td></td>
    </tr>
    <tr height="30">
        <td>&nbsp;</td>
        <td colspan="2" align="right" bgcolor="#27292D">
            <font face="Malgun Gothic" size="2" color="#FFFFFF">
                생성기준일시:
<c:if test="${empty last_date}">
----/--/-- --:--:--
</c:if>
<c:if test="${not empty last_date}">
<c:out value="${fn:replace(last_date, '-', ' ')}"/>
</c:if>
            </font>&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="2" align="center" bgcolor="#27292D">
            <table cellspacing="3" cellpadding="10" width="90%">
                <thead>
                    <tr>
                        <th width="100" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">캠페인(그룹)<br/>코드 </font></th>
                        <th width="200" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">캠페인(그룹)명 </font></th>
                        <th width="80"  style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">반복<br/>주기 </font></th>
                        <th width="100" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">행사<br/>시작일 </font></th>
                        <th width="100" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">행사<br/>종료일 </font></th>
                        <th width="80"  style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">발송<br/>고객수 </font></th>
<%/*
                        <th width="80"  style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">반응<br/>고객수 </font></th>
*/%>
                        <th width="80"  style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D">&nbsp;</th>
                    </tr>
                </thead>
<c:if test="${count != 0}">
    <c:forEach var="row" items="${result}" varStatus="status">
        <c:if test="${row.rownum == 1}">
                <tr>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.cmpgn_id}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.cmpgn_nm}"/></font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.schedule_exec_cd}"/></font>&nbsp;</td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.exec_strt_dt}"/></font>&nbsp;</td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.exec_end_dt}"/></font>&nbsp;</td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.sum_send_psn_no_no}"/></font>&nbsp;</td>
<%/*
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.sum_resp_psn_no_no}"/></font>&nbsp;</td>
*/%>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">
                        <button style="width:70px;height:30px;background-color:#453A39;border:none;padding:5px" onclick="return stopExecuting('${row.cmpgn_id}','${row.campaign_source_type}');"><b><font face="Malgun Gothic" size="2" color="#FFFFFF">중지</font></b></button>&nbsp;
                        <button style="width:70px;height:30px;background-color:#453A39;border:none;padding:5px" id="rowIdBtn<c:out value="${status.count}"/>" onclick="return showHide('rowId<c:out value="${status.count}"/>','rowIdBtn<c:out value="${status.count}"/>');"><b><font face="Malgun Gothic" size="2" color="#FFFFFF">보기</font></b></button>
                    </font></td>
                </tr>
                <tr id="rowId<c:out value="${status.count}"/>" style="display:none;">
                    <td align="center" colspan="10">
                        <table border="0" cellspacing="2" cellpadding="10" width="90%">
                            <thead>
                            <tr>
                                <th width="150" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">채널 </font></th>
                                <th width="400" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">캠페인(셀)명 /<br/>캠페인(셀)ID </font></th>
                                <th width="140" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">실행일시 </font></th>
                                <th width="90"  style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">대상<br/>고객수 </font></th>
                                <th width="90"  style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">발송<br/>고객수 </font></th>
                                <th width="90"  style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">제외<br/>고객수 </font></th>
<%/*
                                <th width="90"  style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">반응<br/>고객수 </font></th>
*/%>
                            </tr>
                            </thead>
                            <tr>
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.chnl_id}"/></font></td>
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.grp_id}" escapeXml="false"/></font></td>
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.last_exec_dttm}"/></font></td>
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.send_target_cust_cnt}"/></font></td>
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.send_cust_cnt}"/></font></td>
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.except_cust_cnt}"/></font></td>
<%/*
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.resp_cust_cnt}"/></font></td>
*/%>
                            </tr>
        </c:if>
        <c:if test="${row.rownum != 1}">
                            <tr>
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.chnl_id}"/></font></td>
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.grp_id}" escapeXml="false"/></font></td>
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.last_exec_dttm}"/></font></td>
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.send_target_cust_cnt}"/></font></td>
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.send_cust_cnt}"/></font></td>
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.except_cust_cnt}"/></font></td>
<%/*
                                <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.resp_cust_cnt}"/></font></td>
*/%>
                            </tr>
        </c:if>
        <c:if test="${row.rownum == row.cnt}">
                        </table>
                    </td>
                </tr>
        </c:if>
    </c:forEach>
</c:if>
                <c:if test="${count == 0}">
                <tr>
                    <td colspan="8" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">실행중인 캠페인이 없습니다.</font></td>
                </tr>
                </c:if>
                <c:if test="${empty count}">
                <tr>
                    <td colspan="8" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">실행중인 캠페인이 없습니다.</font></td>
                </tr>
                </c:if>
            </table>
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
