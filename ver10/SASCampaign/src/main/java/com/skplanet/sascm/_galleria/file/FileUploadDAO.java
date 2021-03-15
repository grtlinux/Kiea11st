package com.skplanet.sascm._galleria.file;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.skplanet.sascm.common.dao.AbstractDAO;
import com.skplanet.sascm.util.DataMap;

@Repository("FileUploadDAO")
public class FileUploadDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> fileSelect(DataMap deliverParams) {
		return (List<HashMap<String, Object>>) selectList("fileupload.fileuploadSelect", deliverParams);
	}

	public Integer fileInsert(DataMap deliverParams) {
		return (int) update("fileupload.fileuploadInsert", deliverParams);
	}

	public Integer fileDelete(DataMap deliverParams) {
		return (int) update("fileupload.fileuploadDelete", deliverParams);
	}

}
