package com.skplanet.sascm._galleria.main;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skplanet.sascm.util.BaseAction;
import com.skplanet.sascm.util.DataMap;

@Controller
public class MainAction extends BaseAction {

	private final Log log = LogFactory.getLog(getClass());

	//@Resource(name = "messageSourceAccessor")
	//protected MessageSourceAccessor messageSource;

	@Autowired
	private MainService fsService;

	// 화면 진입
	//@RequestMapping("/main")
	@RequestMapping("/_galleria/main.do")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		log.debug("#####################   /_galleria/main.do start  ############################");
		ModelAndView mv = new ModelAndView("/_galleria/jsp/main/main");
		try {
			DataMap params = deliverParams(request);
			params.put("uid", "H12345");
			
			HashMap<String, Object> result = fsService.detailAuth(params);
			HashMap<String, Object> eventManagerYn = fsService.getEventManagerYN(params);
			result.put("event_auth", eventManagerYn.get("event_auth"));
			mv.addObject("result", result);
		} catch (Exception e) {
			//e.printStackTrace();
			//mv.addObject("result", ExceptionHandler.getMessage(e));
			
			e.printStackTrace();
			StackTraceElement[] trace = e.getStackTrace();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < trace.length; i++) {
				sb.append(trace[i].toString() + "<br/>");
			}
			mv = new ModelAndView("/_galleria/jsp/common/auth_error");
			mv.addObject("result", sb.toString());
			log.debug("main exception finish");
			return mv;
		}
		log.debug("#####################   /_galleria/main.do finish  ############################");
		return mv;
	}
}
