package com.eprabidhi.ecommerceapp.service;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadServiceImpl implements UploadService {

    @Override
    public boolean uploadProductImage(MultipartFile image) {
        // TODO Auto-generated method stub
        // Prepare upload folder
        File uploadDir = new File(UPlOAD_DIR + "product_image"); // Corrected directory creation
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Create directories if they don't exist
        }

        // Define the file to upload
        File uploadFile = new File(UPlOAD_DIR + "product_image//" + image.getOriginalFilename());
        
        try {
            image.transferTo(uploadFile);
            System.out.println("upload Success");
            boolean ture = true; // Fixed the typo here
            return ture;
        } catch (IllegalStateException | IOException e) {
            System.out.println("exception: " + e.getMessage());
        }
        
        return false;
    }

	@Override
	public boolean uploadUserImage(MultipartFile image) {
		// TODO Auto-generated method stub
		return false;
	}

}
//package com.eprabidhi.ecommerceapp.service;
//
//import java.io.File;
//import java.io.IOException;
//import org.springframework.web.multipart.MultipartFile;
//
//public class UploadServiceImpl implements UploadService {
//
//    @Override
//    public boolean uploadProductImage(MultipartFile image) {
//        // TODO Auto-generated method stub
//        // Prepare upload folder
//        File uploadDir = new File(UPlOAD_DIR + "product_image"); // Corrected directory creation
//        if (!uploadDir.exists()) {
//            uploadDir.mkdirs(); // Create directories if they don't exist
//        }
//
//        // Define the file to upload
//        File uploadFile = new File(UPlOAD_DIR + "product_image//" + image.getOriginalFilename());
//        
//        try {
//            image.transferTo(uploadFile);
//            System.out.println("upload Success");
//            boolean ture = true; // Fixed the typo here
//            return ture;
//        } catch (IllegalStateException | IOException e) {
//            System.out.println("exception: " + e.getMessage());
//        }
//        
//        return false;
//    }
//
//    @Override
//    public boolean uploadUserImage(MultipartFile image) {
//        // TODO Auto-generated method stub
//        return false;
//    }
//}

//
//package com.eprabidhi.ecommerceapp.service;
//
//import java.io.File;
//import java.io.IOException;
//import org.springframework.web.multipart.MultipartFile;
//
//public class UploadServiceImpl implements UploadService {
//
//    private static final String UPLOAD_DIR = "path/to/your/upload/directory/"; // Define your upload directory path here
//
//    @Override
//    public boolean uploadProductImage(MultipartFile image) {
//        // Prepare the upload folder
//        File uploadDir = new File(UPLOAD_DIR + "product_image");
//        if (!uploadDir.exists()) {
//            uploadDir.mkdirs(); // Create directories if they don't exist
//        }
//
//        // Define the file to upload
//        File uploadFile = new File(uploadDir, image.getOriginalFilename());
//
//        try {
//            // Transfer the file
//            image.transferTo(uploadFile);
//            System.out.println("Upload Success");
//            return true;
//        } catch (IllegalStateException | IOException e) {
//            System.out.println("Exception: " + e.getMessage());
//            return false;
//        }
//    }
//
//    @Override
//    public boolean uploadUserImage(MultipartFile image) {
//        // You can implement user image upload logic here if needed
//        return false;
//    }
//}
