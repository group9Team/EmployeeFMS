package com.data;

import org.springframework.web.multipart.MultipartFile;

public class ProfilePhoto {

	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
}
