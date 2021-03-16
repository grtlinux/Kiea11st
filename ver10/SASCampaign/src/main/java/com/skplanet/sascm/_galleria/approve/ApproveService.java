package com.skplanet.sascm._galleria.approve;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skplanet.sascm.util.DataMap;
import com.skplanet.sascm.util.ServiceMapper;

@Service
public class ApproveService {
	
	private final Log log = LogFactory.getLog(getClass());

	@Autowired
	private ApproveDAO fsDao;

	public List<HashMap<String, Object>> approveInteractSelect(DataMap deliverParams, String userid) throws Exception {
		log.debug("approveInteractSelect start");
		try {
			deliverParams.put("userid", userid);
			log.debug("searchDate:[" + deliverParams.getString("searchDate") + "]");
			if (deliverParams.getString("searchDate") == null || "".equals(deliverParams.getString("searchDate").trim())) {
				deliverParams.remove("searchDate");
			}
			List<HashMap<String, Object>> result = ServiceMapper.convert(fsDao.approveInteractSelect(deliverParams));
			log.debug("approveInteractSelect finish");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
	}

	public List<HashMap<String, Object>> approveInsertAndSelectExecute(DataMap deliverParams, String userid) throws Exception {
		log.debug("approveSelect start");
		try {
			deliverParams.put("userid", userid);
			List<HashMap<String, Object>> result = ServiceMapper.convert(fsDao.approveSelect(deliverParams));
			log.debug("approveSelect finish");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
	}

	public Integer runCampaignExecute(DataMap deliverParams) throws Exception {
		log.debug("runCampaign start");
		Integer result = fsDao.confirmStatusUpdate(deliverParams);
		String command = "CAMPAIGN_BYUSER.bat " + deliverParams.getString("campaign_id");
		log.debug("approveRun :::" + command);
		Runtime.getRuntime().exec(command);
		log.debug("runCampaign finish");
		return result;
	}

	public List<HashMap<String, Object>> approveDetailChannelMessage(DataMap deliverParams) throws Exception {
		log.debug("approveSelect start");
		try {
			List<HashMap<String, Object>> result = ServiceMapper.convert(fsDao.approveDetailChannelMessage(deliverParams));
			log.debug("approveSelect finish");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
	}

	public Integer sendMessage(DataMap deliverParams, String userid) throws Exception {
		log.debug("sendMessage start");
		String command = "SEND_MESSAGE.bat " + deliverParams.getString("campaign_id") + " " + deliverParams.getString("cell_id") + " " + userid;
		log.debug("approveRun :::" + command);
		Process p = Runtime.getRuntime().exec(command);
		p.waitFor();
		log.debug("sendMessage finish");
		return 1;
	}
	
	public HashMap<String, Object> approveChkMsg(DataMap deliverParams) throws Exception {
		log.debug("approveChkMsg start with [" + deliverParams.getString("campaign_id") + "]");
		try {
			HashMap<String, Object> result = ServiceMapper.convertMap(this.fsDao.approveChkMsg(deliverParams));
//			log.debug("approveChkMsg finish");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
	}
}
