package com.eprabidhi.ecommerceapp.service;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {
	
	String UPlOAD_DIR="C://Users//Hivenevigator//Desktop//BCA";
	
	public boolean uploadProductImage(MultipartFile image);
	public boolean uploadUserImage(MultipartFile image);

}
