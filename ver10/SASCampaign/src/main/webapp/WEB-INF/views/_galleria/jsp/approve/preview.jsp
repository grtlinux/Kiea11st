<body bgcolor="#4A4A4D">
<%
if(session.getAttribute("userid")!=null) {
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%pageContext.setAttribute("crlf", "\n");%> 
<script src="/sasma/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
function sendMessage(campaignNo, cellNo) {
    var url="<%=request.getContextPath()%>/approve/message.sas";
    var params="campaign_id="+campaignNo+"&cell_id=" + cellNo;
    //alert(url+"?"+params);
    jQuery.ajax({
      type:"POST",
      url:url,
      data:params,
      dataType: "json",
      success:function(data) {
        alert('발송하였습니다.');
        location.reload();
      },
      error: function(data, status, err) {
          //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
    });
}
</script>
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
    <tr height="40">
        <td width="1">&nbsp;</td>
        <td width="19">&nbsp;</td>
        <td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">모바일 미리보기 </font></b></td>
        <td width="1">&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="2">
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
            <table cellspacing="3" cellpadding="10" width="550">
                <thead>
                    <tr>
                        <th width="130" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">캠페인(셀)ID /<br/> 채널명 </font></th>
                        <th width="400" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">문구내용</font></th>
                        <th width="70" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D">&nbsp;</th>
                    </tr>
                </thead>
<c:if test="${count != 0}">
    <c:forEach var="row" items="${result}" varStatus="status">
                <tr>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.grp_id}"/><br/><c:out value="${row.channel_nm}"/></font></td>
                    <td align="left" bgcolor="#4A4A4D">
                        <font face="Malgun Gothic" size="2" color="#FFFFFF">${fn:replace(row.msg_svc_send_text,crlf,'<br>')}</font>
        <c:set var="imgfiles" value="${fn:split(row.imgfile,':')}"/>
        <c:forEach var="imgfile" items="${imgfiles}" varStatus="status">
            <c:if test="${imgfile != 'X'}">
                <br/><br/><img id="slider" src="<%=request.getContextPath()%>/approve/mms.sas?name=${imgfile}" width="300" height="300">
            </c:if>
        </c:forEach>
                    </td>
                    <td align="center" bgcolor="#4A4A4D">
                        <table border="0"><tr><td>
                        <button onclick="return sendMessage('<c:out value="${row.cmpgn_id}"/>','<c:out value="${row.grp_id}"/>');" style="background-color:#453A39;border:none;padding:3px;width:90px"><font face="Malgun Gothic" size="2" color="#FFFFFF">발송</font></button>
                        </td></tr></table>
                    </td>
                </tr>
    </c:forEach>
</c:if>
<c:if test="${count == 0}">
                <tr>
                    <td colspan="3" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">모바일 채널이 없습니다.</font></td>
                </tr>
</c:if>
<c:if test="${empty count}">
                <tr>
                    <td colspan="3" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">모바일 채널이 없습니다.</font></td>
                </tr>
</c:if>
        </table>
        <td>&nbsp;</td>
    </tr>

    <tr height="40">
        <td>&nbsp;</td>
        <td colspan="2" bgcolor="#27292D" align="right">
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
    $(function(){
        $('#slider img').each(function(){
            alert('TTTTTTTT');
            var ReqWidth = 350; // Max width for the image
            var ReqHeight = 200; // Max height for the image
            var width = $(this).width(); // Current image width
            var height = $(this).height(); // Current image height
            // Check if the current width is larger than the max
            if (width > height && height < ReqHeight) {
                $(this).css("min-height", ReqHeight); // Set new height
            } else  if (width > height && width < ReqWidth) {
                $(this).css("min-width", ReqWidth); // Set new width
            } else if (width > height && width > ReqWidth) {
                $(this).css("max-width", ReqWidth); // Set new width
            } else if (height > width && width < ReqWidth) {
                $(this).css("min-width", ReqWidth); // Set new width
            }
        });
    });
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
