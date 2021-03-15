<body bgcolor="#4A4A4D" onLoad="init();">
<%
if(session.getAttribute("userid")!=null) {
    
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/sasma/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">

function init() {
   
   var msgval;
   var chk_val = "${result}";
   var confirm_chk = 0;
   
   
   //체크메시지
   if(chk_val == 'S1') {
       msgval = 'SMS 메시지에 (광고)문구가 입력되지 않았습니다. <br/> 발송 메시지를 확인해주세요.';
   } else if(chk_val == 'S2') {
       msgval = 'SMS 메시지에 수신거부 메시지가 입력되지 않았습니다. <br/> 발송 메시지를 확인해주세요.';
   } else if(chk_val == 'S3') {
       msgval = 'SMS 메시지가 90byte를 초과 하였습니다. <br/> 발송 메시지를 확인해 주세요.';
   
   } else if(chk_val == 'L1') {
       msgval = 'LMS 메시지에 (광고)문구가 입력되지 않았습니다.<br/> 발송 메시지를 확인해주세요.';
   } else if(chk_val == 'L2') { 
       msgval = 'LMS 메시지에 수신거부 메시지가 입력되지 않았습니다.<br/> 발송 메시지를 확인해주세요.';
   } else if(chk_val == 'L3') {
       msgval = 'LMS 메시지가 2000byte를 초과 하였습니다.<br/> 발송 메시지를 확인해 주세요.';
   } else if(chk_val == 'L4') { 
       msgval = 'LMS 제목에 (광고)문구가 입력되지 않았습니다.<br/> 발송 메시지를 확인해주세요.';
   } else if(chk_val == 'L5') { 
	   msgval = 'LMS 제목이 40bytes를 초과하였습니다.<br/> 발송 메시지를 확인해주세요.'; 
                    
   } else if(chk_val == 'M1') {
       msgval = 'MMS 메시지에 (광고)문구가 입력되지 않았습니다.<br/> 발송 메시지를 확인해주세요.';
   } else if(chk_val == 'M2') {
       msgval = 'MMS 메시지에 수신거부 메시지가 입력되지 않았습니다.<br/> 발송 메시지를 확인해주세요.';
   } else if(chk_val == 'M3') {
       msgval = 'MMS 메시지가 2000byte를 초과 하였습니다.<br/> 발송 메시지를 확인해 주세요.';
   } else if(chk_val == 'M4') {
       msgval = 'MMS 제목에 (광고)문구가 입력되지 않았습니다.<br/> 발송 메시지를 확인해주세요.';
   } else if(chk_val == 'M5') { 
       msgval = 'MMS 제목이 40byte를 초과하였습니다.<br/> 발송 메시지를 확인해주세요.'; 
  
   } else if(chk_val == 'E0') {
       msgval = '확인 버튼 클릭 시 상신화면으로 이동합니다.<br/> 진행하시겠습니까?';
       confirm_chk = 1; 
   } else {
       msgval = '에러가 발생했습니다.<br/> 관리자에게 문의하시기 바랍니다.';
   }

   var messageElement = document.getElementById('messageElement');
   messageElement.innerHTML = msgval;
   
   //버튼처리
   
   if(confirm_chk == 1){
	   var confirmBtn = document.getElementById('confirmBtn');
	   confirmBtn.style.display = 'inline';
   }else{
	   var closeBtn = document.getElementById('closeBtn');
	   closeBtn.style.display = 'inline';
   }

}

function confirmUpload(cmpgn_id) {
	var param = '?cmpgn_id=' + cmpgn_id + '&empid=<%=session.getAttribute("userid")%>';
    var url = 'http://gstart.galleria.co.kr/apagent/campaign.jsp' + param;
    var popOptions = "dialogWidth: 800px; dialogHeight: 700px; center: yes; resizable: no; status: no; scroll: yes;"; 
    //var vReturn = window.showModalDialog(url, window,  popOptions ); 
    //if (vReturn == 'ok'){
    var vReturn = window.open(url, window,  popOptions );   // new 20201228
    if (vReturn != null){   // new 20201228
        updateDocument(cmpgn_id); 
    } else {
    }
    window.close();
}

function cancelUpload() {
    window.close();
}
</script>
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
    <tr height="40">
        <td width="1">&nbsp;</td>
        <td width="19">&nbsp;</td>
        <td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">발송 문구</font></b></td>
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
                    <td align="center" bgcolor="#4A4A4D" colspan="3">
                        <font face="Malgun Gothic" size="3" color="#FFFFFF">
                            <div id="messageElement" style="width:400px"></div>
                        </font>
                    </td>
                </tr>
               
                <tr height="10">  
                    <td align='right' colspan="3">
                        <button id="confirmBtn" onclick="return confirmUpload('<c:out value="${campaign_id}"/>');" style="background-color:#453A39;border:none;padding:5px;display:none">
                            <font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>상신 진행</b>&nbsp;</font>
                        </button>
                        <button id="closeBtn" onclick="return cancelUpload();" style="background-color:#453A39;border:none;padding:5px;display:none">
                            <font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>닫 기</b>&nbsp;</font>
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
