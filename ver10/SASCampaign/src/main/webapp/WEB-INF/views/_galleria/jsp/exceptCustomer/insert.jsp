<body bgcolor="#4A4A4D">
<%
if(session.getAttribute("userid")!=null) {
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/sasma/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var resultValue;
var mem_no;
var crm_no;
var gndr_cd;
var age_cd;
function confirmUpload() {
    if(mem_no == '' || mem_no == undefined) {
        alert('고객을 먼저 검색하세요.');
        return;
    }
    var dataUrl = '?mem_no=' + mem_no + '&crm_no=' + crm_no + '&gndr_cd=' + gndr_cd + '&age_cd=' + age_cd + '&emp_no=<%=session.getAttribute("userid").toString()%>';
    alert('['+ mem_no+ ']');
    $.ajax({
         url : '<%=request.getContextPath()%>/exceptCustomer/insertDone.sas' + dataUrl,
         dataType: 'script',
         cache: false,
         contentType: false,
         processData: false,
         type: 'POST',
         dataType: "json",
         success:function(data) {
             alert('등록되었습니다.');
             window.close();
             window.opener.location.reload(false);
         },
         error: function(data, status, err) {
             //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
    });
}
function searchCustomer() {
    if($("#mem_no").val() == '') {
        alert('회원번호를 입력하세요.');
        return;
    }
    $.ajax({
        url : '<%=request.getContextPath()%>/exceptCustomer/search.sas?mem_no=' + $("#mem_no").val(),
        dataType: 'script',
        cache: false,
        contentType: false,
        processData: false,
        type: 'POST',
        dataType: "json",
        success:function(data) {
            resultValue = data;
            mem_no = data.result['mem_no'];
            crm_no = data.result['crm_no'];
            gndr_cd = data.result['gndr_cd'];
            age_cd = data.result['age_cd'];
            $('#mem_no').html(mem_no);
            $('#crm_no').html(crm_no);
            if(gndr_cd == '1') {
                $('#gndr_cd').html('남성');
            } else if(gndr_cd == '2') {
                $('#gndr_cd').html('여성');
            } else {
                $('#gndr_cd').html('미정의');
            }
            $('#age_cd').html(age_cd);
        },
        error: function(data, status, err) {
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
    });
}
function cancelUpload() {
    window.close();
}
</script>
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
    <tr height="40">
        <td width="1">&nbsp;</td>
        <td width="19">&nbsp;</td>
        <td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">제외고객 등록</font></b></td>
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
                <tr>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">회원번호 :&nbsp;</font></td>
                    <td align="center" bgcolor="#4A4A4D"><input type="text" id="mem_no" width="280" style="width:280px;background-color:#4A4A4D;color:#FFFFFF"></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">
                        <button onclick="return searchCustomer();" style="background-color:#453A39;border:none;padding:5px">
                            <font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>찾 기</b>&nbsp;
                            </font>
                        </button>
                    </font></td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">CRM ID :&nbsp;</font></td>
                    <td align="center" bgcolor="#4A4A4D" colspan="2"><font face="Malgun Gothic" size="2" color="#FFFFFF"><div id="crm_no" style="width:380px"></div></font></td>
                </tr>
                <tr height="10">
                    <td colspan='3'>&nbsp;</td>
                </tr>
                <tr height="10">
                    <td colspan='3' align='right'>
                        <button onclick="return confirmUpload();" style="background-color:#453A39;border:none;padding:5px">
                            <font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>확 인</b>&nbsp;
                            </font>
                        </button>
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
<%
} else {
%>
<br/><br/><br/><br/><br/>
<center><font face="Malgun Gothic" size="20" color="#FFFFFF">세션이 종료되었습니다.<br/><br/>다시 로그인 하시기 바랍니다.</font></center>
<%
}
%>
</body>
