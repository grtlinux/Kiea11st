package com.skplanet.sascm._galleria.main;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.skplanet.sascm.common.dao.AbstractDAO;
import com.skplanet.sascm.object.UaextCodeMstBO;
import com.skplanet.sascm.util.DataMap;

@Repository("MainDAO")
public class MainDAO extends AbstractDAO {
//public class MainDAO extends SqlSessionDaoSupport {

	//@SuppressWarnings("unchecked")
	public List<UaextCodeMstBO> getCommCodeList(Map<String, Object> param) throws SQLException {
		List<?> val = selectList("CommCode.getCommCodeList", param);
		List<UaextCodeMstBO> ret = new ArrayList<>();
		for (Object obj : val) {
			if (obj instanceof UaextCodeMstBO)
				ret.add((UaextCodeMstBO)obj);
		}
		return ret;
	}
	
	// 현재 접속자의 권한 조회
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> detailAuth(DataMap param) {
		return (HashMap<String, Object>) selectOne("combo.checkAuthCenter", param);
	}

	// 온라인 이벤트 사용 가능여부 조회 
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> getEventManagerYN(DataMap empno) {
		return (HashMap<String, Object>) selectOne("combo.checkEventManager", empno);
	}
}

