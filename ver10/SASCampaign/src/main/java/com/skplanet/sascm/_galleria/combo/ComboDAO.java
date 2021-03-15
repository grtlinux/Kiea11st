package com.skplanet.sascm._galleria.combo;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.skplanet.sascm.common.dao.AbstractDAO;
import com.skplanet.sascm.util.DataMap;

@SuppressWarnings("unchecked")
@Repository("ComboDAO")
public class ComboDAO extends AbstractDAO {
	// 조직
	public List<HashMap<String, Object>> listDept() {
		return (List<HashMap<String, Object>>) selectList("combo.listDept");
	}

	// 등록자
	public List<HashMap<String, Object>> listEmp(DataMap userid) {
		return (List<HashMap<String, Object>>) selectList("combo.listEmp", userid);
	}

	// 채널
	public List<HashMap<String, Object>> listChannel() {
		return (List<HashMap<String, Object>>) selectList("combo.listChannel");
	}

	public String viewStoreCd(String empno) {
		return (String) selectOne("combo.viewStoreCd",empno);
	}
}
