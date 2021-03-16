package com.skplanet.sascm._galleria.approve;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skplanet.sascm._galleria.combo.ComboService;
import com.skplanet.sascm.util.BaseAction;
import com.skplanet.sascm.util.DataMap;
import com.skplanet.sascm.util.ExceptionHandler;

@Controller
public class ApproveAction extends BaseAction {
	private final Log log = LogFactory.getLog(getClass());

	@Autowired
	private ApproveService fsService;
	@SuppressWarnings("unused")
	@Autowired
	private ComboService comboService;

	// 화면 진입
	@RequestMapping("/_galleria/approve/main")
	public ModelAndView approveMain(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/approve/main.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/approve/interactSelect");
		try {
			// Search
			mv.addObject("searchDate", request.getParameter("searchDate"));
			String userid = request.getSession().getAttribute("userid").toString();
			log.debug("USERID:[" + userid + "]");
			//List<HashMap<String, Object>> result = fsService.approveInteractSelect(deliverParams(request), userid);
			List<HashMap<String, Object>> result = new ArrayList<>();
			Integer count = result.size();
			mv.addObject("result", result);
			mv.addObject("count", count);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("result", ExceptionHandler.getMessage(e));
		}
		log.debug("#####################   /_galleria/approve/main.do finish  ############################");
		return mv;
	}

	// 결재 미상신 목록 조회
	@RequestMapping("/_galleria/approve/select")
	public ModelAndView approveSelect(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/approve/select.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/approve/select");
		try {
			// Search
			mv.addObject("searchDate", request.getParameter("searchDate"));
			mv.addObject("searchCampaign", request.getParameter("searchCampaign"));
			String userid = request.getSession().getAttribute("userid").toString();
			log.debug("USERID:[" + userid + "]");
			//List<HashMap<String, Object>> result = fsService.approveInsertAndSelectExecute(deliverParams(request), userid);
			List<HashMap<String, Object>> result = new ArrayList<>();
			if (true) {
				HashMap<String, Object> map = new HashMap<>();
				map.put("cmpgn_id"          , "123456");
				map.put("exec_dept_cd"      , "D123");
				map.put("cmpgn_nm"          , "행복캠페인");
				map.put("campaign_status_cd", "SUCCESS");
				map.put("req_emp_id"        , "H12345");
				map.put("req_dt"            , new Date());
				map.put("schedule_strt_dt"  , new Date());
				map.put("schedule_end_dt"   , new Date());
				result.add(map);
				/*
		SELECT AAAA.CMPGN_ID                                                       AS CMPGN_ID
		      , AAAA.EXEC_DEPT_CD                                                  AS EXEC_DEPT_CD
		      , AAAA.CMPGN_NM                                                      AS CMPGN_NM
		      , AAAA.CAMPAIGN_STATUS_CD                                            AS CAMPAIGN_STATUS_CD
		      , AAAA.REQ_EMP_ID                                                    AS REQ_EMP_ID
		      , AAAA.CAMPAIGN_PROCESSED_DT                                         AS REQ_DT
		      , MIN(CASE WHEN ROWNUM  < CNT THEN AAAA.DATE_UDF_VAL ELSE NULL END)  AS SCHEDULE_STRT_DT
		      , MAX(CASE WHEN ROWNUM  = CNT THEN AAAA.DATE_UDF_VAL ELSE NULL END)  AS SCHEDULE_END_DT
				 */
			}
			Integer count = result.size();
			mv.addObject("result", result);
			mv.addObject("count", count);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("result", ExceptionHandler.getMessage(e));
		}
		log.debug("#####################   /_galleria/approve/select.do finish  ############################");
		return mv;
	}

	// 즉시 실행
	@RequestMapping("/_galleria/approve/runCamp")
	public void approveRun(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/approve/runCamp.do start  ############################");
		DataMap ajaxResult = new DataMap();
		try {
			Integer result = fsService.runCampaignExecute(deliverParams(request));
			ajaxResult.put("result", result);
		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.put("result", ExceptionHandler.getMessage(e));
			log.debug("approveRun finish");
		}
		sendMap(ajaxResult, request, response);
		log.debug("#####################   /_galleria/approve/runCamp.do finish  ############################");
	}

	// 미리보기 화면 조회
	@RequestMapping("/_galleria/approve/preview")
	public ModelAndView approveDetailChannelMessage(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/approve/preview.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/approve/preview");
		try {
			List<HashMap<String, Object>> result = fsService.approveDetailChannelMessage(deliverParams(request));
			mv.addObject("result", result);
			int count = result.size();
			mv.addObject("count", count);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("result", ExceptionHandler.getMessage(e));
		}
		log.debug("#####################   /_galleria/approve/preview.do finish  ############################");
		return mv;
	}

	// 미리보기 실행
	@RequestMapping("/_galleria/approve/message")
	public void approveSendMessage(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/approve/message.do start  ############################");
		DataMap ajaxResult = new DataMap();
		try {
			String userid = request.getSession().getAttribute("userid").toString();
			log.debug("USERID:[" + userid + "]");
			Integer result = fsService.sendMessage(deliverParams(request), userid);
			ajaxResult.put("result", result);
		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.put("result", ExceptionHandler.getMessage(e));
			log.debug("approveSendMessage finish");
		}
		sendMap(ajaxResult, request, response);
		log.debug("#####################   /_galleria/approve/message.do finish  ############################");
	}

	// 이미지 보여주기
	@RequestMapping("/_galleria/approve/mms")
	public void approveViewMMSImage(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/approve/mms.do start  ############################");
		String filename = request.getParameter("name");
		try {
			File f = new File("/Users/kang-air/FILES/MMSIMG/" + new String(filename.getBytes("8859_1"),"UTF-8"));
			log.debug("FILENAME1:[" + filename + "]");
			log.debug("FILENAME2:[" + new String(filename.getBytes("8859_1"),"EUC_KR") + "]");
			log.debug("FILENAME3:[" + new String(filename.getBytes("8859_1"),"UTF-8") + "]");
			log.debug("FILENAME4:[" + new String(filename.getBytes("EUC_KR"),"8859_1") + "]");
			log.debug("FILENAME5:[" + new String(filename.getBytes("UTF-8"),"8859_1") + "]");
			log.debug("FILENAME6:[" + new String(filename.getBytes("EUC_KR"),"UTF-8") + "]");
			log.debug("FILENAME7:[" + new String(filename.getBytes("UTF-8"),"EUC_KR") + "]");
			FileInputStream fis = new FileInputStream(f);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			byte[] buf = new byte[1024];
			int read = 0;
			while ((read = fis.read(buf)) != -1) {
				baos.write(buf, 0, read);
			}
			byte[] imgBuf = baos.toByteArray();
			baos.close();
			fis.close();
			int len = imgBuf.length;
			ServletOutputStream os = response.getOutputStream();
			os.write(imgBuf, 0, len);
			os.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		log.debug("#####################   /_galleria/approve/mms.do finish  ############################");
	}

	@RequestMapping({"/_galleria/approve/chkMsg"})
	public ModelAndView approveChkMsg(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/approve/chkMsg.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/approve/chkmsg");
		try {
			String campaign_id = request.getParameter("campaign_id").toString();
			log.debug("campID:[" + campaign_id + "]");
			HashMap<String, Object> result = this.fsService.approveChkMsg(deliverParams(request));
			mv.addObject("result", result.get("chk_val"));
			mv.addObject("campaign_id", campaign_id );
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("result", ExceptionHandler.getMessage(e));
		}
		log.debug("#####################   /_galleria/approve/chkMsg.do finish  ############################");
		return mv;
	}
}
