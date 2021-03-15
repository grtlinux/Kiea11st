package com.skplanet.sascm._galleria.main;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Service;

import com.skplanet.sascm.util.DataMap;
import com.skplanet.sascm.util.ServiceMapper;

@Service
public class MainService {

	private final Log log = LogFactory.getLog(getClass());

	@Autowired
	private MainDAO fsDao;

	@Resource(name = "messageSourceAccessor")
	private MessageSourceAccessor msa;

	// 접속자 권한 조회
	public HashMap<String, Object> detailAuth(DataMap param) throws Exception {
		log.debug("detailAuth start");
		try {
			HashMap<String, Object> result = ServiceMapper.convertMap(fsDao.detailAuth(param));
			log.debug("detailAuth finish");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
	}

	// 온라인 이벤트 사용 가능여부 조회 
	public HashMap<String, Object> getEventManagerYN(DataMap param) {
		log.debug("selectChannel start");
		HashMap<String, Object> result = ServiceMapper.convertMap(fsDao.getEventManagerYN(param));
		log.debug("selectChannel finish");
		return result;
	}
}
