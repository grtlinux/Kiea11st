<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/sasma/js/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
    $( "#comboTeam" ).selectmenu();
    $( "#comboMember" ).selectmenu();
    $( "input[type=submit], a, button" ).button();
    $( "#monitorDate" ).datepicker({changeMonth: true,changeYear: true}).datepicker("option", "dateFormat","yymmdd").val("${searchDate}");
});
</script>
<br/><br/>
<div class="container">
  <div class="panel panel-primary">
    <div class="panel-heading">
    <b>가망고객 관리</b>
    </div>
    <div class="panel-body">
  <table width="1000" border="0" cellspacing="0" cellpadding="0">
<form name="frmSearch" action="<%=request.getContextPath()%>/monitoring/main.sas">
<input type="hidden" name="searchTeam" id="searchTeam" value="${searchTeam}" />
<input type="hidden" name="searchEmp" id="searchEmp" value="${searchEmp}" />
<input type="hidden" name="searchDate" id="searchDate" value="${searchDate}" />
      <td>&nbsp;</td>
      <td width="60" align="right">조직 :&nbsp;</td>
      <td width="150">
        <select name="comboTeam" id="comboTeam" width="140" style="width: 140px">
          <option>선택하세요</option>
          <c:forEach var="deptRow" items="${dept}" varStatus="status">
            <c:if test="${deptRow.org_nm == searchTeam}"><option selected="selected"><c:out value="${deptRow.org_nm}"/></option></c:if>
            <c:if test="${deptRow.org_nm != searchTeam}"><option><c:out value="${deptRow.org_nm}"/></option></c:if>
          </c:forEach>
        </select>
      </td>
      <td width="100"><div align="right">등록자 :&nbsp;</div></td>
      <td width="150">
        <select name="comboMember" id="comboMember" width="140" style="width: 140px">
          <option>선택하세요</option>
          <c:forEach var="empRow" items="${emp}" varStatus="status">
            <c:if test="${empRow.emp_nm == searchEmp}"><option selected="selected"><c:out value="${empRow.emp_nm}"/></option></c:if>
            <c:if test="${empRow.emp_nm != searchEmp}"><option><c:out value="${empRow.emp_nm}"/></option></c:if>
          </c:forEach>
        </select>
      </td>
      <td width="80"><div align="right">등록일 :&nbsp;</div></td>
      <td width="150"><input type="text" id="monitorDate" width="140" style="width: 140px"></td>
      <td width="200">&nbsp;</td>
      <td align="right" width="80" style="width: 80px"><button onclick="return search();"><b>검색</b></button></td>
    </tr>
</form>
  </table>
  <br />
  <script type="text/javascript">
			function deleteFile(docNo) {
				if (confirm("제외 하시겠습니까?")) {
					jQuery.ajax({
						type:"POST",
						url:"<%=request.getContextPath()%>/potentialCustomer/update.sas",
						data:"crm_no="+docNo,
                        dataType: "json",
						success:function(data) {
							alert('제외되었습니다.');
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

  <table border="1" cellspacing="0" cellpadding="0"
    class="table table-striped table-bordered table-hover"
    style="width: 1030px">
    <thead>
      <tr>
        <th width="110" style="text-align: center; vertical-align: middle">등록번호</th>
        <th width="110" style="text-align: center; vertical-align: middle">대상고객명</th>
        <th width="110" style="text-align: center; vertical-align: middle">보조고객명</th>
        <th width="110" style="text-align: center; vertical-align: middle">고객종류</th>
        <th width="110" style="text-align: center; vertical-align: middle">이용채널</th>
        <th width="110" style="text-align: center; vertical-align: middle">등록조직</th>
        <th width="110" style="text-align: center; vertical-align: middle">제외대상</th>
        <th width="110" style="text-align: center; vertical-align: middle">등록자</th>
        <th width="110" style="text-align: center; vertical-align: middle">등록일</th>
        <th width="40" style="text-align: center; vertical-align: middle">&nbsp;</th>
      </tr>
    </thead>
<c:if test="${count != 0}">
<c:forEach var="row" items="${result}" varStatus="status">
<tr>
    <td align="center"><c:out value="${row.crm_no}"/></td>
    <td align="center"><c:out value="${row.target_cust_nm}"/></td>
    <td align="center"><c:out value="${row.sub_cust_nm}"/></td>
    <td align="center"><c:out value="${row.cust_kind_nm}"/></td>
    <td align="center"><c:out value="${row.use_chnl_nm}"/></td>
    <td align="center"><c:out value="${row.reg_org_cd}"/></td>
    <td align="center"><c:out value="${row.del_yn}"/></td>
    <td align="center"><c:out value="${row.reg_user_no}"/></td>
    <td align="center"><c:out value="${row.reg_dttm}"/></td>
    <td align="center">
    <button onclick="return deleteFile('${row.crm_no}');">제외</button>
    </td>
</tr>
</c:forEach>
</c:if>
<c:if test="${count == 0}">
    <tr>
      <td colspan="10" align="center">등록한 가망 고객이 없습니다.</td>
    </tr>
</c:if>
  </table>
</div>
  </div>
  </div>
</div>
    <script type="text/javascript">
    function openPopupForAppendPopup() {
        window.open('<%=request.getContextPath()%>/potentialCustomer/insert.sas'
                  , "_blank"
                  , "width=600,height=500,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no");
    }
    </script>
<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><div align="right">
    <button onclick="return openPopupForAppendPopup();">파일 추가</button>
    </div></td>
    <td width="20" height="60"><div align="right"></div></td>
  </tr>
</table>
