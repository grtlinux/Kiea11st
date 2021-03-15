<%
if(session.getAttribute("userid")!=null) {
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/sasma/js/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
  $( "#comboTeam" ).selectmenu();
  $( "#comboMember" ).selectmenu();
  $( "input[type=submit], a, button" ).button();
  $( "#monitorDate" ).datepicker({changeMonth: true,changeYear: true}).datepicker("option", "dateFormat","yymmdd").val("${result.searchDate}");
});
</script>
<br escapeXml="false" /><br escapeXml="false" />
<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <b>캠페인 신청 문서 내용 조회</b>
        </div>
        <div class="panel-body">
        <br  escapeXml="false" />
            <table border="1" cellspacing="0" cellpadding="0" class="table table-striped table-bordered table-hover" style="width:1000px">
                <tr>
                    <td width="330" align="right" colspan="2">캠페인명:&nbsp;</td>
                    <td width="670" align="center"><c:out value="${result.cmpgn_nm}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="right" colspan="2">캠페인브랜드:&nbsp;</td>
                    <td align="center"><c:out value="${result.cmpgn_brand_cd}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="right" colspan="2">캠페인구분:&nbsp;</td>
                    <td align="center"><c:out value="${result.cmpgn_flag_cd}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="right" colspan="2">캠페인기획:&nbsp;</td>
                    <td align="center"><c:out value="${result.runn_plan_cd}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="right" colspan="2">캠페인대상:&nbsp;</td>
                    <td align="center"><c:out value="${result.cmpgn_trgt_flag_cd}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="right" colspan="2">예산:&nbsp;</td>
                    <td align="center"><c:out value="${result.cmpgn_budget_cd}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="right" colspan="2">대상채널:&nbsp;</td>
                    <td align="center"><c:out value="${result.cmpgn_trgt_chnl_cd}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="right" colspan="2">발송업체:&nbsp;</td>
                    <td align="center"><c:out value="${result.cmpgn_trgt_chnl_comp_cd}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="center" width="150" style="valign:middle" rowspan="2">대상고객</td>
                    <td align="right" width="180">대상고객수:&nbsp;</td>
                    <td align="center"><c:out value="${result.cmpgn_plan_cust_cnt}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="right">대상선정사유:&nbsp;</td>
                    <td align="center"><c:out value="${result.cmpgn_cust_choice_reason}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="center" rowspan="3" style="valign:middle">캠페인성공조건 </td>
                    <td align="right">성공상품유형:&nbsp;</td>
                    <td align="center"><c:out value="${result.sucs_product_type_cd}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="right">매장유형:&nbsp;</td>
                    <td align="center"><c:out value="${result.sucs_store_type_cd}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="right">구매성공금액 기준:&nbsp;</td>
                    <td align="center"><c:out value="${result.sucs_base_amt}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="center" rowspan="3" style="valign:middle">우편봉투 기재사항 </td>
                    <td align="right">진행부서:&nbsp;</td>
                    <td align="center"><c:out value="${result.exec_dept_cd}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="right">행사시작일:&nbsp;</td>
                    <td align="center"><c:out value="${result.cmpgn_event_strt_dt}" escapeXml="false" /></td>
                </tr>
                <tr>
                    <td align="right">담당자연락처:&nbsp;</td>
                    <td align="center"><c:out value="${result.emp_phone_number}" escapeXml="false" /></td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    function openPopupApprove() {
    	var param = '?cmpgn_id=<c:out value="${result.cmpgn_id}"/>';
        window.open('http://hwgmine/apagent/sample/crmCamPaign.jsp' + param
                  , "_blank"
                  , "width=1200,height=700,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no,scrollbars=1");
    }
</script>
<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><div align="right">
    <button class="btn btn-primary" onclick="return openPopupApprove();">승인신청</button>
    </div></td>
    <td width="20" height="60"><div align="right"></div></td>
  </tr>
</table>
</center>
<%
}
%>
