package com.skplanet.sascm._galleria.mms;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.skplanet.sascm.util.DataMap;
import com.skplanet.sascm.util.ServiceMapper;

@Service
public class MmsUploadService {

	private final Log log = LogFactory.getLog(getClass());

	@Autowired
	private MmsUploadDAO fsDao;
	private String targetPath = "/Users/kang-air/FILES/MMSIMG";

	public List<HashMap<String, Object>> mmsSelect(DataMap deliverParams) throws Exception {
		log.debug("mmsSelect start");
		try {
			List<HashMap<String, Object>> result = ServiceMapper.convert(fsDao.mmsSelect(deliverParams));
			log.debug("mmsSelect finish");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
	}

	public DataMap mmsInsertExecute(MultipartHttpServletRequest request) throws Exception {
		log.debug("mmsInsertExecute start");
		try {
			DataMap result = new DataMap();
			MultipartFile multipartFile = request.getFile("fileData");
			String prefix = request.getParameter("serverFileName");
			String fileName = request.getParameter("suffixName");
			String clientFileName = multipartFile.getOriginalFilename();
			int clientLength = clientFileName.length();
			String clientExt = clientFileName.substring(clientLength - 4, clientLength);
			log.debug("[clientExt:" + clientExt + "]");
			// 확장자 체크
			if (fileName.length() <= 4) {
				fileName += clientExt;
			} else if (!clientExt.equals(fileName.substring(fileName.length() - 4, fileName.length()))) {
				fileName += clientExt;
			}
			String serverFileName = prefix + fileName;

			log.debug("FILE NAME:[" + serverFileName + "]");

			if (multipartFile.getSize() > 300 * 1024) {
				result.put("status", "FAIL");
				result.put("message", "파일 크기는 300K 이하여야 합니다.");
				return result;
			}

			InputStream in = null;
			OutputStream out = null;

			File targetPathDir = new File(targetPath);
			if (!targetPathDir.exists())
				targetPathDir.mkdir();

			String savedMmsPath = targetPathDir + File.separator + serverFileName;
			File f = new File(savedMmsPath);
			if (f.exists()) {
				result.put("status", "FAIL");
				result.put("message", "파일이 이미 존재합니다.");
				return result;
			}

			try {
				in = multipartFile.getInputStream();
				out = new FileOutputStream(savedMmsPath);

				int readBytes = 0;
				byte[] buff = new byte[8192];

				while ((readBytes = in.read(buff, 0, 8192)) != -1) {
					out.write(buff, 0, readBytes);
				}
			} finally {
				if (in != null)
					in.close();
				if (out != null)
					out.close();
			}

			DataMap map = new DataMap();
			map.put("file_nm", serverFileName);
			fsDao.mmsInsert(map);

			result.put("status", "OK");
			result.put("message", "파일 업로드에 성공하였습니다.");
			log.debug("mmsInsertExecute finish");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
	}

	public Integer mmsDeleteExecute(DataMap deliverParams) throws Exception {
		log.debug("mmsDeleteExecute start");
		try {
			Integer result = fsDao.mmsDelete(deliverParams);
			File f = new File(targetPath + File.separator + deliverParams.getString("file_nm"));
			if (f.exists())
				f.delete();
			log.debug("mmsDeleteExecute finish");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
	}
}
