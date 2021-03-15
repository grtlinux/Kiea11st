<body bgcolor="#4A4A4D">
<%
if(session.getAttribute("userid")!=null) {
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/sasma/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var resultValue;
var emp_id;
var emp_nm;
var crm_no;
var emp_check = '';

function confirmUpload() {
    if(emp_id == '' || emp_check == '') {
        alert('직원을 먼저 검색하세요.');
        return;
    }
    var val_cmpgn_flag_cd = $('#cmpgn_flag_cd option:selected').val();
    if(val_cmpgn_flag_cd == '00') {
        alert('캠페인 구분을 선택하세요.');
        return;
    }

    $.ajax({
        url : '<%=request.getContextPath()%>/appendCustomer/insertDone.sas?crm_no='+emp_id+'&emp_nm='+emp_nm+'&cmpgn_flag_cd='+val_cmpgn_flag_cd,
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

function searchEmp() {
    if($("#emp_id").val() == '') {
        alert('회원번호를 입력하세요.');
        return;
    }
    emp_id=$("#emp_id").val();
    $.ajax({
        url : '<%=request.getContextPath()%>/appendCustomer/search.sas?emp_id='+emp_id,
        dataType: 'script',
        cache: false,
        contentType: false,
        processData: false,
        data: "emp_id="+emp_id,
        type: 'POST',
        dataType: "json",
        success:function(data) {
            console.log(data);
            resultValue = data;
            emp_id = data.result['emp_id'];
            emp_nm = data.result['emp_nm'];
            crm_no = data.result['crm_no'];
            if(emp_id == undefined) {
                $('#reg_emp_no').html("등록된 직원이 없습니다.");
            } else {
                $('#reg_emp_no').html(emp_id + " (" + emp_nm + ")");
                emp_check = emp_id;
                //$('#reg_org_cd').html(crm_no);
            }
        },
        error: function(data, status, err) {
            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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
        <td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">직원 등록</font></b></td>
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
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">캠페인구분 :&nbsp;</font></td>
                    <td bgcolor="#4A4A4D" colspan='2'>
                        <select name="cmpgn_flag_cd" id="cmpgn_flag_cd" width="140" style="width: 140px">
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value="00"><font size="2" color="#FFFFFF">모두</font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='01'><font size="2" color="#FFFFFF">홍보 </font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='02'><font size="2" color="#FFFFFF">세일안내 </font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='03'><font size="2" color="#FFFFFF">CLM 프로그램 </font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='04'><font size="2" color="#FFFFFF">VIP 프로그램 </font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='05'><font size="2" color="#FFFFFF">실시간이벤트 </font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='06'><font size="2" color="#FFFFFF">브랜드DM </font></option>
                            <option style="background-color:#4A4A4D;color:#FFFFFF" value='07'><font size="2" color="#FFFFFF">온라인 캠페인 </font></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF">회원번호 :&nbsp;</font></td>
                    <td align="center" bgcolor="#4A4A4D"><input type="text" id="emp_id" width="280" style="width:280px;background-color:#4A4A4D;color:#FFFFFF"></td>
                    <td align="center" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF">
                        <button onclick="return searchEmp();" style="background-color:#453A39;border:none;padding:5px">
                            <font size="2" color="#FFFFFF">&nbsp;<b>찾 기</b>&nbsp;
                            </font>
                        </button>
                    </font></td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#4A4A4D"><font size="2" color="#FFFFFF">사원번호 :&nbsp;</font></td>
                    <td align="center" bgcolor="#4A4A4D" colspan="2"><font size="2" color="#FFFFFF"><div id="reg_emp_no" style="width:380px"></div></font></td>
                </tr>
                <tr height="10">
                    <td colspan='2'>&nbsp;</td>
                </tr>
                <tr height="10">
                    <td colspan='2' align='right'>
                        <button onclick="return confirmUpload();" style="background-color:#453A39;border:none;padding:5px">
                            <font size="2" color="#FFFFFF">&nbsp;<b>확 인</b>&nbsp;
                            </font>
                        </button>
                        <button onclick="return cancelUpload();" style="background-color:#453A39;border:none;padding:5px">
                            <font size="2" color="#FFFFFF">&nbsp;<b>취 소</b>&nbsp;
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
<center><font size="20" color="#FFFFFF">세션이 종료되었습니다.<br/><br/>다시 로그인 하시기 바랍니다.</font></center>
<%
}
%>
</body>
