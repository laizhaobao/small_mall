package com.nf.controller;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class FileController {

	/**
	 * 支持文件下载操作
	 */
	@RequestMapping(value = "/download")
	public void download(String filename, HttpServletResponse response) throws IOException {
		FileInputStream fileInputStream = new FileInputStream(filename);
		response.setHeader("content-disposition", "attachment;filename=" + filename);
		ServletOutputStream outputStream = response.getOutputStream();
		IOUtils.write(IOUtils.toByteArray(fileInputStream), outputStream);
		fileInputStream.close();
		outputStream.close();
	}

	/**
	 * 支持文件上传操作
	 */
	@PostMapping(value = "/upload")
	@ResponseBody
	public List<String> upload(@RequestParam("file") MultipartFile[] files) throws IOException {
		List<String> realFilePaths = new ArrayList<>();
		for (MultipartFile file : files) {
			String saveFileName = UUID.randomUUID()+file.getOriginalFilename();
			String realFilePath = "D:\\images"+File.separator+saveFileName;
			file.transferTo(new File(realFilePath));
			realFilePaths.add(realFilePath);
		}
		return realFilePaths;
	}


}