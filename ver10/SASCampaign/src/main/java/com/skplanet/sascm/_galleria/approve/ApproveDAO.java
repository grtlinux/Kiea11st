package com.skplanet.sascm._galleria.approve;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.skplanet.sascm.common.dao.AbstractDAO;
import com.skplanet.sascm.util.DataMap;

@SuppressWarnings("unchecked")
@Repository("ApproveDAO")
public class ApproveDAO extends AbstractDAO {

	public List<HashMap<String, Object>> approveSelect(DataMap deliverParams) {
		return (List<HashMap<String, Object>>) selectList("approval.approveSelect", deliverParams);
	}

	public HashMap<String, Object> approveDetail(DataMap deliverParams) {
		return (HashMap<String, Object>) selectOne("approval.approveDetail", deliverParams);
	}

	public List<HashMap<String, Object>> approveInteractSelect(DataMap deliverParams) {
		return (List<HashMap<String, Object>>) selectList("approval.approveInteractSelect", deliverParams);
	}

	public Integer confirmStatusUpdate(DataMap deliverParams) {
		return (Integer) update("approval.changeConfirmStatus", deliverParams);
	}

	public List<HashMap<String, Object>> approveDetailChannelMessage(DataMap deliverParams) {
		return (List<HashMap<String, Object>>) selectList("approval.approveDetailChannelMessage", deliverParams);
	}
	
	public HashMap<String, Object> approveChkMsg(DataMap deliverParams) {
		return (HashMap<String, Object>) selectOne("approval.approveChkMsg", deliverParams);
	}
}
