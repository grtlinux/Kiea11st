package com.skplanet.sascm._galleria.file;

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
public class FileUploadService {

	private final Log log = LogFactory.getLog(getClass());

	@Autowired
	private FileUploadDAO fsDao;
	private String targetPath = "/Users/kang-air/FILES/UPLOAD";

	public List<HashMap<String, Object>> fileSelect(DataMap deliverParams) throws Exception {
		log.debug("fileSelect start");
		try {
			List<HashMap<String, Object>> result = ServiceMapper.convert(fsDao.fileSelect(deliverParams));
			log.debug("fileSelect finish");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
	}

	public DataMap fileInsertExecute(MultipartHttpServletRequest request) throws Exception {
		
		log.debug("fileInsertExecute start");
		try {
			DataMap result = new DataMap();
			MultipartFile multipartFile = request.getFile("fileData");
			String prefix = request.getParameter("serverFileName");
			String fileName = request.getParameter("suffixName");
			String clientFileName = multipartFile.getOriginalFilename();
			// ksy			
			String userid = request.getSession().getAttribute("userid").toString();
			int clientLength = clientFileName.length();
			String clientExt = clientFileName.substring(clientLength - 4, clientLength);
			log.debug("[clientExt:" + clientExt + "]");
			// 확장자 체크
			//2016.10.17 : 확장자(jsp, php, asp, cgi, exe, bat) 업로드 불가
			if (".jsp".equals(clientExt) || ".php".equals(clientExt) || ".asp".equals(clientExt) 
		   	 || ".cgi".equals(clientExt) || ".exe".equals(clientExt) || ".bat".equals(clientExt)) {
				result.put("status", "ERR");
				result.put("message", "업로드 불가능한 확장자입니다.");
				log.debug("fileInsertExecute error");
				return result;
			}
			
			//2017.11.20 : 확장자 xls, xlsx 이외 파일 업로드 불가)
			if (!".xls".equals(clientExt) && !"xlsx".equals(clientExt)) {
				result.put("status", "ERR");
				result.put("message", "XLS, XLSX 파일만 업로드 가능합니다.");
				log.debug("fileInsertExecute error");
				return result;
			}
			
			if (fileName.length() <= 4) {
				if ("xlsx".equals(clientExt)) {
					fileName += "." + clientExt;
				} else {
					fileName += clientExt;
				}
			} else if (!clientExt.equals(fileName.substring(fileName.length() - 4, fileName.length()))) {
				if ("xlsx".equals(clientExt)) {
					fileName += "." + clientExt;
				} else {
					fileName += clientExt;
				}
			}			
			String serverFileName = prefix + fileName;
			
			log.debug("FILE NAME:[" + serverFileName + "]");

			InputStream in = null;
			OutputStream out = null;

			File targetPathDir = new File(targetPath);
			if (!targetPathDir.exists())
				targetPathDir.mkdir();

			String savedFilePath = targetPathDir + File.separator + serverFileName;
			File f = new File(savedFilePath);
			if (f.exists()) {
				result.put("status", "OK");
				result.put("message", "파일이 이미 존재합니다.");
			}

			try {
				in = multipartFile.getInputStream();
				out = new FileOutputStream(savedFilePath);

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
			// ksy
			map.put("userid", userid);
			fsDao.fileInsert(map);

			result.put("status", "OK");
			result.put("message", "파일 업로드에 성공하였습니다.");
			log.debug("fileInsertExecute finish");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
	}

	public Integer fileDeleteExecute(DataMap deliverParams) throws Exception {
		log.debug("fileDeleteExecute start");
		try {
			Integer result = fsDao.fileDelete(deliverParams);
			File f = new File(targetPath + File.separator + deliverParams.getString("file_nm"));
			if (f.exists())
				f.delete();
			log.debug("fileDeleteExecute finish");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
	}
}
