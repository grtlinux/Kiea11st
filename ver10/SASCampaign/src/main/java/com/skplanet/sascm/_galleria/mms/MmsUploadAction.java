package com.skplanet.sascm._galleria.mms;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.skplanet.sascm._galleria.combo.ComboService;
import com.skplanet.sascm.util.BaseAction;
import com.skplanet.sascm.util.DataMap;
import com.skplanet.sascm.util.ExceptionHandler;

@Controller
public class MmsUploadAction extends BaseAction {

	private final Log log = LogFactory.getLog(getClass());

	@Autowired
	private MmsUploadService fsService;
	@Autowired
	private ComboService storeService;
	
	@SuppressWarnings("unused")
	@Autowired
	private ComboService comboService;

	// 화면 진입
	@RequestMapping("/_galleria/mms/main")
	public ModelAndView mmsSelect(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/mms/main.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/mms/select");
		try {
			DataMap deliverParams = deliverParams(request);
			String userid = request.getSession().getAttribute("userid").toString();
			log.debug("USERID:[" + userid + "]");
			if (userid == null) {
				log.debug("IllegalStateException");
				throw new IllegalStateException("로그인이 해제되었습니다.");
			}
			deliverParams.put("userid", userid);
			List<HashMap<String, Object>> result = fsService.mmsSelect(deliverParams);
			Integer count = result.size();
			mv.addObject("result", result);
			mv.addObject("count", count);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("result", ExceptionHandler.getMessage(e));
		}
		log.debug("#####################   /_galleria/mms/main.do finish  ############################");
		return mv;
	}

	// 추가
	@RequestMapping("/_galleria/mms/insert")
	public ModelAndView mmsInsert(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/mms/insert.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/mms/insert");
		String userid = request.getSession().getAttribute("userid").toString();
		log.debug("USERID:[" + userid + "]");
		mv.addObject("storeCd", storeService.getStoreCd(userid));
		log.debug("#####################   /_galleria/mms/insert.do finish  ############################");
		return mv;
	}

	// 추가
	@RequestMapping(value = "/_galleria/mms/insertDone", method = RequestMethod.POST)
	public ModelAndView mmsInsertDone(MultipartHttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/mms/insertDone.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/mms/insertDone");
		try {
			DataMap result = fsService.mmsInsertExecute(request);
			mv.addObject("result", result);
		} catch (Exception e) {
			e.printStackTrace();
			DataMap result = new DataMap();
			result.put("status", "FAIL");
			result.put("message", ExceptionHandler.getMessage(e));
			mv.addObject("result", result);
		}
		log.debug("#####################   /_galleria/mms/insertDone.do finish  ############################");
		return mv;
	}

	// 삭제
	@RequestMapping("/_galleria/mms/delete")
	public ModelAndView mmsDelete(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/mms/delete.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/mms/delete");
		DataMap ajaxResult = new DataMap();
		try {
			Integer result = fsService.mmsDeleteExecute(deliverParams(request));
			ajaxResult.put("result", result);
			sendMap(ajaxResult, request, response);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("result", ExceptionHandler.getMessage(e));
		}
		log.debug("#####################   /_galleria/mms/delete.do finish  ############################");
		return mv;
	}
}
