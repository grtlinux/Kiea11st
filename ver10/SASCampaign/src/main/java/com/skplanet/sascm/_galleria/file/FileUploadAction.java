package com.skplanet.sascm._galleria.file;

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
public class FileUploadAction extends BaseAction {

	private final Log log = LogFactory.getLog(getClass());

	@Autowired
	private FileUploadService fsService;
	@Autowired
	private ComboService storeService;
	
	@SuppressWarnings("unused")
	@Autowired
	private ComboService comboService;

	// 화면 진입
	//@RequestMapping("/file/main")
	@RequestMapping("/_galleria/file/main")
	public ModelAndView fileSelect(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/file/main.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/file/select");
		try {
			DataMap deliverParams = deliverParams(request);
			String userid = request.getSession().getAttribute("userid").toString();
			log.debug("USERID:[" + userid + "]");
			if (userid == null) {
				log.debug("IllegalStateException");
				throw new IllegalStateException("로그인이 해제되었습니다.");
			}
			deliverParams.put("userid", userid);
			List<HashMap<String, Object>> result = fsService.fileSelect(deliverParams);
			Integer count = result.size();
			mv.addObject("result", result);
			mv.addObject("count", count);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("result", ExceptionHandler.getMessage(e));
		}
		log.debug("#####################   /_galleria/file/main.do finish  ############################");
		return mv;
	}

	// 추가
	@RequestMapping("/_galleria/file/insert")
	public ModelAndView fileInsert(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/file/insert.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/file/insert");
		String userid = request.getSession().getAttribute("userid").toString();
		log.debug("USERID:[" + userid + "]");
		mv.addObject("storeCd", storeService.getStoreCd(userid));
		log.debug("#####################   /_galleria/file/insert.do finish  ############################");
		return mv;
	}

	// 추가
	@RequestMapping(value = "/_galleria/file/insertDone", method = RequestMethod.POST)
	public ModelAndView fileInsertDone(MultipartHttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/file/insertDone.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/file/insertDone");
		try {
			DataMap result = fsService.fileInsertExecute(request);
			mv.addObject("result", result);
		} catch (Exception e) {
			e.printStackTrace();
			DataMap result = new DataMap();
			result.put("status", "FAIL");
			result.put("message", ExceptionHandler.getMessage(e));
			mv.addObject("result", result);
		}
		log.debug("#####################   /_galleria/file/insertDone.do finish  ############################");
		return mv;
	}

	// 삭제
	@RequestMapping("/_galleria/file/delete")
	public ModelAndView fileDelete(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/file/delete.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/file/delete");
		DataMap ajaxResult = new DataMap();
		try {
			Integer result = fsService.fileDeleteExecute(deliverParams(request));
			ajaxResult.put("result", result);
			sendMap(ajaxResult, request, response);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("result", ExceptionHandler.getMessage(e));
		}
		log.debug("#####################   /_galleria/file/delete.do finish  ############################");
		return mv;
	}
}
