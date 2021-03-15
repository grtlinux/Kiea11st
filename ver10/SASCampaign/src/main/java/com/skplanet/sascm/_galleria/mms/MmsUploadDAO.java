package com.skplanet.sascm._galleria.mms;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.skplanet.sascm.common.dao.AbstractDAO;
import com.skplanet.sascm.util.DataMap;

@Repository("MmsUploadDAO")
public class MmsUploadDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> mmsSelect(DataMap deliverParams) {
		return (List<HashMap<String, Object>>) selectList("mmsupload.mmsuploadSelect", deliverParams);
	}

	public Integer mmsInsert(DataMap deliverParams) {
		return (int) update("mmsupload.mmsuploadInsert", deliverParams);
	}

	public Integer mmsDelete(DataMap deliverParams) {
		return (int) update("mmsupload.mmsuploadDelete", deliverParams);
	}

}
