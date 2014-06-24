package org.sos.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	
	private String uid;
	private MultipartFile file;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "FileVO [uid=" + uid + ", file=" + file + "]";
	}
	
	
	
}
