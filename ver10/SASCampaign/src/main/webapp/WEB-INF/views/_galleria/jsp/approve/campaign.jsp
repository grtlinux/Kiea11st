<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="com.skplanet.sascm._apagent.apagent.BeanCampaign" scope="page">
	<jsp:setProperty name="bean" property="campaignId" param="cmpgn_id" />
</jsp:useBean>
<%
    session.setAttribute("campaignId", request.getParameter("cmpgn_id"));
/*
    session.setAttribute("empId", request.getParameter("empid"));
*/
    Cookie ck = new Cookie("campaignId",request.getParameter("cmpgn_id"));
    response.addCookie(ck);
    String empid = request.getParameter("empid") == null ? "" : request.getParameter("empid");
    System.out.println("[empId:" + request.getParameter("empid") + ",cmpgn_id:" + request.getParameter("cmpgn_id") + "]");
/*
    bean.saveCampaignInfo(request.getParameter("cmpgn_id"));
*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title></title>
<!-- %@ include file="/apagent/lib/config/config.jsp"% -->
<%@ include file="/_apagent/lib/config/config.jsp"%>
<script>
    var dw = new hanwha.approval.DraftWindow();
    function sendEaccDraft()
    {
        var eTitle  = "캠페인 실행요청서";
        var eDrafter = '<%=empid%>';
        var docPortraitType = "vertical";
        var sapId = '<%=bean.getM1_00()%>';
        var eServiceTxt = "<%=bean.getM1_02()%>";

        //============== 실제 상신하를 로직 처리 시작 ================
        //객체 초기화
        dw.init();
        //기안자 설정
        dw.setEDrafter(eDrafter);
        //서비스명
        dw.setService('HGC_CRM_CAMPAIGN');         // [카드신청] 법인카드 신청서 양식
        //조회 : view, "" : 상신
        dw.setMode("");
        //결재문서의 SAP_ID
        dw.setId(sapId);
        //본문 내용 URL  ==> /apagent/sample/samplebody3.jsp
        //dw.setBody('/apagent/test.jsp');
        dw.setBody('/apagent/approve.jsp');
        //문서제목
        dw.setTitle(eTitle + "-" + eServiceTxt + "-" + sapId);

        //가로 양식 - 인쇄시 가로양식으로 인쇄함
        dw.setDocPortraitType(docPortraitType); //horizontal : 가로양식 , vertical : 세로양식

        //=================================
        // CRM 파트
        var list = new ArrayList();
<%
/*
M1_00 -- Icmpgn_id                 -- cmpgn_id                 -- 캠페인ID
M1_01 -- CCONFIRM_STATUS_CD        -- confirm_status_cd        -- 승인상태코드
M1_02 -- Ccmpgn_nm                 -- cmpgn_nm                 -- 캠페인명
M1_03 -- Ccmpgn_flag_cd            -- cmpgn_flag_cd            -- 캠페인구분
M1_04 -- Crunn_plan_cd             -- runn_plan_cd             -- 캠페인기획
M1_05 -- Ccmpgn_trgt_flag_cd       -- cmpgn_trgt_flag_cd       -- 캠페인대상
M1_06 -- Ccmpgn_budget_cd          -- cmpgn_budget_cd          -- 예산
M1_07 -- Icmpgn_plan_cust_cnt      -- cmpgn_plan_cust_cnt      -- 대상고객수
M1_08 -- Ccmpgn_cust_choice_reason -- cmpgn_cust_choice_reason -- 대상선정사유
M1_09 -- Csucs_product_type_cd     -- sucs_product_type_cd     -- 성공상품유형
M1_10 -- Csucs_store_type_cd       -- sucs_store_type_cd       -- 매장유형
M1_11 -- Dsucs_base_amt            -- sucs_base_amt            -- 구매성공금액 기준
M1_12 -- Cexec_dept_cd             -- exec_dept_cd             -- 진행부서
M1_13 -- Tcmpgn_event_strt_dt      -- cmpgn_event_strt_dt      -- 행사시작일
M1_14 -- Cemp_phone_number         -- emp_phone_number         -- 담당자연락처
M1_15 -- Ccmpgn_brand_cd           -- cmpgn_brand_cd           -- 캠페인브랜드
M1_16 -- Ccmpgn_trgt_chnl_cd       -- cmpgn_trgt_chnl_cd       -- 대상채널
M1_17 -- Ccmpgn_trgt_chnl_comp_cd  -- cmpgn_trgt_chnl_comp_cd  -- 발송업체

M1_18 -- Creq_team_nm              -- req_team_nm              -- 신청팀명
M1_19 -- Creq_emp_nm               -- req_emp_nm               -- 신청직원명
*/
%>
        var vM1_00 = $('#approveSrc').contents().find('#M1_00').val();
        if (vM1_00 == '' || vM1_00 == undefined) {} else {
            var myM1_00 = new HashMap();
            myM1_00.put("myName","M1_00");
            myM1_00.put("myVal",vM1_00);
            myM1_00.put("myType","text");
            list.add(myM1_00);
        }
        var vM1_02 = $('#approveSrc').contents().find('#M1_02').val();
        if (vM1_02 == '' || vM1_02 == undefined) {    } else {
            var myM1_02 = new HashMap();
            myM1_02.put("myName","M1_02");
            myM1_02.put("myVal",vM1_02);
            myM1_02.put("myType","text");
            list.add(myM1_02);
        }
        var vM1_03 = $('#approveSrc').contents().find('input[name=M1_03]:checked').val();
        if (vM1_03 == '' || vM1_03 == undefined) {    } else {
            var myM1_03 = new HashMap();
            myM1_03.put("myName","M1_03");
            myM1_03.put("myVal",vM1_03);
            myM1_03.put("myType","radio");
            list.add(myM1_03);
        }
        var vM1_04 = $('#approveSrc').contents().find('input[name=M1_04]:checked').val();
        if (vM1_04 == '' || vM1_04 == undefined) {    } else {
            var myM1_04 = new HashMap();
            myM1_04.put("myName","M1_04");
            myM1_04.put("myVal",vM1_04);
            myM1_04.put("myType","radio");
            list.add(myM1_04);
        }
        var vM1_05 = $('#approveSrc').contents().find('input[name=M1_05]:checked').val();
        if (vM1_05 == '' || vM1_05 == undefined) {    } else {
            var myM1_05 = new HashMap();
            myM1_05.put("myName","M1_05");
            myM1_05.put("myVal",vM1_05);
            myM1_05.put("myType","radio");
            list.add(myM1_05);
        }
        var vM1_06 = $('#approveSrc').contents().find('input[name=M1_06]:checked').val();
        if (vM1_06 == '' || vM1_06 == undefined) {    } else {
            var myM1_06 = new HashMap();
            myM1_06.put("myName","M1_06");
            myM1_06.put("myVal",vM1_06);
            myM1_06.put("myType","radio");
            list.add(myM1_06);
        }
        var vM1_07 = $('#approveSrc').contents().find('#M1_07').val();
        if (vM1_07 == '' || vM1_07 == undefined) {    } else {
            var myM1_07 = new HashMap();
            myM1_07.put("myName","M1_07");
            myM1_07.put("myVal",vM1_07);
            myM1_07.put("myType","text");
            list.add(myM1_07);
        }
        var vM1_08 = $('#approveSrc').contents().find('#M1_08').val();
        if (vM1_08 == '' || vM1_08 == undefined) {    } else {
            vM1_08 = vM1_08.replace(/\n/g, '<br>');   //개행일때 수정
            vM1_08 = vM1_08.replace(/'/g, 'a@27;'); //싱글쿼테이션
            vM1_08 = vM1_08.replace(/"/g, 'a@22;'); //더블쿼테이션
            vM1_08 = vM1_08.replace(/\\/g, 'a@5C;'); //역슬래쉬 원화표시

            var myM1_08 = new HashMap();
            myM1_08.put("myName","M1_08");
            myM1_08.put("myVal",vM1_08);
            myM1_08.put("myType","textarea");
            list.add(myM1_08);
        }
        var vM1_09 = $('#approveSrc').contents().find('input[name=M1_09]:checked').val();
        if (vM1_09 == '' || vM1_09 == undefined) {    } else {
            var myM1_09 = new HashMap();
            myM1_09.put("myName","M1_09");
            myM1_09.put("myVal",vM1_09);
            myM1_09.put("myType","radio");
            list.add(myM1_09);
        }
        var vM1_10 = $('#approveSrc').contents().find('input[name=M1_10]:checked').val();
        if (vM1_10 == '' || vM1_10 == undefined) {    } else {
            var myM1_10 = new HashMap();
            myM1_10.put("myName","M1_10");
            myM1_10.put("myVal",vM1_10);
            myM1_10.put("myType","radio");
            list.add(myM1_10);
        }
        var vM1_11 = $('#approveSrc').contents().find('#M1_11').val();
        if (vM1_11 == '' || vM1_11 == undefined) {    } else {
            var myM1_11 = new HashMap();
            myM1_11.put("myName","M1_11");
            myM1_11.put("myVal",vM1_11);
            myM1_11.put("myType","text");
            list.add(myM1_11);
        }
        var vM1_12 = $('#approveSrc').contents().find('#M1_12').val();
        if (vM1_12 == '' || vM1_12 == undefined) {    } else {
            var myM1_12 = new HashMap();
            myM1_12.put("myName","M1_12");
            myM1_12.put("myVal",vM1_12);
            myM1_12.put("myType","text");
            list.add(myM1_12);
        }
        var vM1_13 = $('#approveSrc').contents().find('#M1_13').val();
        if (vM1_13 == '' || vM1_13 == undefined) {    } else {
            var myM1_13 = new HashMap();
            myM1_13.put("myName","M1_13");
            myM1_13.put("myVal",vM1_13);
            myM1_13.put("myType","text");
            list.add(myM1_13);
        }
        var vM1_14 = $('#approveSrc').contents().find('#M1_14').val();
        if (vM1_14 == '' || vM1_14 == undefined) {    } else {
            var myM1_14 = new HashMap();
            myM1_14.put("myName","M1_14");
            myM1_14.put("myVal",vM1_14);
            myM1_14.put("myType","text");
            list.add(myM1_14);
        }
        var vM1_16All = [];
        $('#approveSrc').contents().find('input[name=M1_16]:checked').each(function() {
            vM1_16All.push($(this).val());
        });
        var vM1_16 = vM1_16All.join();
        if (vM1_16 == '' || vM1_16 == undefined) {    } else {
            var myM1_16 = new HashMap();
            myM1_16.put("myName","M1_16");
            myM1_16.put("myVal",vM1_16);
            myM1_16.put("myType","checkbox");
            list.add(myM1_16);
        }
        var vM1_17All = [];
        $('#approveSrc').contents().find('input[name=M1_17]:checked').each(function() {
            vM1_17All.push($(this).val());
        });
        var vM1_17 = vM1_17All.join();
        if (vM1_17 == '' || vM1_17 == undefined) {    } else {
            var myM1_17 = new HashMap();
            myM1_17.put("myName","M1_17");
            myM1_17.put("myVal",vM1_17);
            myM1_17.put("myType","checkbox");
            list.add(myM1_17);
        }
        var vM1_18 = $('#approveSrc').contents().find('#M1_18').val();
        if (vM1_18 == '' || vM1_18 == undefined) {    } else {
            var myM1_18 = new HashMap();
            myM1_18.put("myName","M1_18");
            myM1_18.put("myVal",vM1_18);
            myM1_18.put("myType","text");
            list.add(myM1_18);
        }
        var vM1_19 = $('#approveSrc').contents().find('#M1_19').val();
        if (vM1_19 == '' || vM1_19 == undefined) {    } else {
            var myM1_19 = new HashMap();
            myM1_19.put("myName","M1_19");
            myM1_19.put("myVal",vM1_19);
            myM1_19.put("myType","text");
            list.add(myM1_19);
        }
        var vM1_20 = $('#approveSrc').contents().find('#M1_20').val();
        if (vM1_20 == '' || vM1_20 == undefined) {    } else {
            var myM1_20 = new HashMap();
            myM1_20.put("myName","M1_20");
            myM1_20.put("myVal",vM1_20);
            myM1_20.put("myType","text");
            list.add(myM1_20);
        }
        //console.log(list);

        //alert('list : ' + list);
        //alert('JSON.stringify(list) : ' + JSON.stringify(list));
        dw.setParam("initJsonParam", list);
        //=================================
        //window open
        dw.open();
        //alert(dw);
        //============== 실제 상신하를 로직 처리 끝 ================
        window.close();
    }
</script>
</head>
<body bgcolor="white" text="black" link="blue" vlink="purple"
	alink="red">
	<script type="text/javascript">
function cnj_alrtBox(){
    $('#approveSrc').attr('src', '/apagent/approve.jsp');
    $('#approveSrc').load(function(){
        var vM1_00 = $('#approveSrc').contents().find('#M1_00');
        vM1_00.val('<%=bean.getM1_00()==null?"":bean.getM1_00()%>');
        var vM1_02 = $('#approveSrc').contents().find('#M1_02');
        vM1_02.val('<%=bean.getM1_02()==null?"":bean.getM1_02().replaceAll("'","\\\\'")%>');

        var vM1_03 = $('#approveSrc').contents().find('#M1_03');
        var dataMapVal = '<%=bean.getM1_03()==null?"":bean.getM1_03()%>';
        var ss = dataMapVal.split(",");
        for (var i=0;i<ss.length;i++) {
            $('#approveSrc').contents().find("input[name='M1_03']:radio[value='" +  ss[i].trim() + "']").attr("checked",true);
        }
        var vM1_04 = $('#approveSrc').contents().find('#M1_04');
        var dataMapVal = '<%=bean.getM1_04()==null?"":bean.getM1_04()%>';
        var ss = dataMapVal.split(",");
        for (var i=0;i<ss.length;i++) {
            $('#approveSrc').contents().find("input[name='M1_04']:radio[value='" +  ss[i].trim() + "']").attr("checked",true);
        }
        var vM1_05 = $('#approveSrc').contents().find('#M1_05');
        var dataMapVal = '<%=bean.getM1_05()==null?"":bean.getM1_05()%>';
        var ss = dataMapVal.split(",");
        for (var i=0;i<ss.length;i++) {
            $('#approveSrc').contents().find("input[name='M1_05']:radio[value='" +  ss[i].trim() + "']").attr("checked",true);
        }
        var vM1_06 = $('#approveSrc').contents().find('#M1_06');
        var dataMapVal = '<%=bean.getM1_06()==null?"":bean.getM1_06()%>';
        var ss = dataMapVal.split(",");
        for (var i=0;i<ss.length;i++) {
            $('#approveSrc').contents().find("input[name='M1_06']:radio[value='" +  ss[i].trim() + "']").attr("checked",true);
        }
        var vM1_07 = $('#approveSrc').contents().find('#M1_07');
        vM1_07.val('<%=bean.getM1_07()==null?"":bean.getM1_07()%>');

        var vM1_09 = $('#approveSrc').contents().find('#M1_09');
        var dataMapVal = '<%=bean.getM1_09()==null?"":bean.getM1_09()%>';
        var ss = dataMapVal.split(",");
        for (var i=0;i<ss.length;i++) {
            $('#approveSrc').contents().find("input[name='M1_09']:radio[value='" +  ss[i].trim() + "']").attr("checked",true);
        }
        var vM1_10 = $('#approveSrc').contents().find('#M1_10');
        var dataMapVal = '<%=bean.getM1_10()==null?"":bean.getM1_10()%>';
        var ss = dataMapVal.split(",");
        for (var i=0;i<ss.length;i++) {
            $('#approveSrc').contents().find("input[name='M1_10']:radio[value='" +  ss[i].trim() + "']").attr("checked",true);
        }
        var vM1_11 = $('#approveSrc').contents().find('#M1_11');
        vM1_11.val('<%=bean.getM1_11()==null?"":bean.getM1_11()%>');
        var vM1_12 = $('#approveSrc').contents().find('#M1_12');
        vM1_12.val('<%=bean.getM1_12()==null?"":bean.getM1_12()%>');
        var vM1_13 = $('#approveSrc').contents().find('#M1_13');
        vM1_13.val('<%=bean.getM1_13()==null?"":bean.getM1_13()%>');
        var vM1_14 = $('#approveSrc').contents().find('#M1_14');
        vM1_14.val('<%=bean.getM1_14()==null?"":bean.getM1_14()%>');

        var vM1_16 = $('#approveSrc').contents().find('#M1_16');
        var dataMapVal = '<%=bean.getM1_16()==null?"":bean.getM1_16()%>';
        var ss = dataMapVal.split("\t");
        for (var i=0;i<ss.length;i++) {
            //console.log(dataMapVal);
            $('#approveSrc').contents().find("input[name='M1_16']:checkbox[value='" +  ss[i].trim() + "']").attr("checked",true);
        }
        var vM1_17 = $('#approveSrc').contents().find('#M1_17');
        var dataMapVal = '<%=bean.getM1_17()==null?"":bean.getM1_17()%>';
        var ss = dataMapVal.split(",");
        for (var i=0;i<ss.length;i++) {
            $('#approveSrc').contents().find("input[name='M1_17']:checkbox[value='" +  ss[i].trim() + "']").attr("checked",true);
        }
        var vM1_18 = $('#approveSrc').contents().find('#M1_18');
        vM1_18.val('<%=bean.getM1_18()==null?"":bean.getM1_18()%>');

        var vM1_19 = $('#approveSrc').contents().find('#M1_19');
        if (vM1_19 == '' || vM1_19 == undefined) {    } else {
            vM1_19.val('<%=bean.getM1_19()==null?"":bean.getM1_19()%>');
        }

        var vM1_20 = $('#approveSrc').contents().find('#M1_20');
        if (vM1_20 == '' || vM1_20 == undefined) {    } else {
            vM1_20.val('<%=bean.getM1_20()==null?"":bean.getM1_20()%>');
        }
        var vM1_08 = $('#approveSrc').contents().find('#M1_08');
        vM1_08.val('<%=bean.getM1_08()==null?"":bean.getM1_08().replaceAll("'","\\\\'")%>
		'
												.replace(/<br\s*\/?>/mg, "\n")
												.replace(/<br>/gi, "\r\n")
												.replace(/a@27;/gi, "'")
												.replace(/a@22;/gi, "\"")
												.replace(/a@5C;/gi, "\\"));
							});
		}
		window.onload = cnj_alrtBox;
	</script>
	<center>
		<iframe id="approveSrc" src="/apagent/approve.jsp" width="800"
			height="1000" border="0" scrolling="yes" frameBorder="0"> </iframe>
		<table border="0">
			<tr>
				<td><input type="button" value="결재 상신창 열기"
					onclick="sendEaccDraft();" /></td>
			</tr>
		</table>
	</center>
</body>
</html>
