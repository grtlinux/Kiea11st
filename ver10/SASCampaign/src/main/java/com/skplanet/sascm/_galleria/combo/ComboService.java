package com.skplanet.sascm._galleria.combo;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Service;

import com.skplanet.sascm.util.DataMap;
import com.skplanet.sascm.util.ServiceMapper;

@Service
public class ComboService {

	private final Log log = LogFactory.getLog(getClass());

	@Autowired
	private ComboDAO fsDao;

	@Resource(name = "messageSourceAccessor")
	private MessageSourceAccessor msa;

	// 부서
	public List<HashMap<String, Object>> selectDept() {
		log.debug("selectDept start");
		List<HashMap<String, Object>> result = ServiceMapper.convert(fsDao.listDept());
		log.debug("selectDept finish");
		return result;
	}

	// 직원
	public List<HashMap<String, Object>> selectEmp(DataMap userid) {
		log.debug("selectEmp start");
		List<HashMap<String, Object>> result = ServiceMapper.convert(fsDao.listEmp(userid));
		log.debug("selectEmp finish");
		return result;
	}

	// 채널
	public List<HashMap<String, Object>> selectChannel() {
		log.debug("selectChannel start");
		List<HashMap<String, Object>> result = ServiceMapper.convert(fsDao.listChannel());
		log.debug("selectChannel finish");
		return result;
	}

	// 소속 지점 조회
	public String getStoreCd(String empno) {
		log.debug("selectChannel start");
		String result = fsDao.viewStoreCd(empno);
		log.debug("selectChannel finish");
		return result;
	}
}
