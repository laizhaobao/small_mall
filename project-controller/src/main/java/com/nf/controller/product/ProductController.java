package com.nf.controller.product;

import com.github.pagehelper.PageInfo;
import com.nf.entity.ProductEntity;
import com.nf.service.CategoryService;
import com.nf.service.ProductService;
import com.nf.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.UUID;

@Controller
@RequestMapping("/product")
public class ProductController {
	public static final String FILE_DIRECTORY = "D:\\images";
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping("/index")
	public String index() {
		return "/be/product/index";
	}

	@RequestMapping("/image")
	public String index1() {
		return "/be/product/image";
	}

	//删除商品
	@RequestMapping("/delete")
	@ResponseBody
	public ResponseVO deletePro(Integer id) {
		if (productService.proDelete(id)) {
			return ResponseVO.newBuilder().code("200").message("删除成功!").build();
		}
		return ResponseVO.newBuilder().code("500").message("删除失败!").build();
	}

	//查询所有商品
	@RequestMapping("/list")
	@ResponseBody
	public ResponseVO list(
			@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum) {
		PageInfo pageInfo = new PageInfo(productService.getPageHelper(pageNum, 3), 5);
		ResponseVO vo = ResponseVO.newBuilder().code("200").data(pageInfo).message("ok").build();
		return vo;
	}

	//查询分类型
	@RequestMapping("/parent")
	@ResponseBody
	public ResponseVO parentType() {
		PageInfo pageInfo = new PageInfo(categoryService.getAll());
		return ResponseVO.newBuilder().code("200").data(pageInfo).message("ok").build();
	}

	//搜索
	@RequestMapping("/search")
	@ResponseBody
	public ResponseVO search(
			@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum, String name) {
		PageInfo pageInfo = new PageInfo(productService.searchName(pageNum, 3, name), 5);
		ResponseVO vo = ResponseVO.newBuilder().code("200").data(pageInfo).message("ok").build();
		return vo;
	}

//	修改
	@RequestMapping("/update")
	@ResponseBody
	public ResponseVO updatePro(ProductEntity productEntity, MultipartFile myfile) throws IOException {
			productEntity.setMainImage(upload(myfile));
			System.out.println(productEntity);
			productService.proUpdate(productEntity);
			return ResponseVO.newBuilder().code("200").message("修改成功!").build();


	}
	//	添加的操作
	@RequestMapping("/upload")
	@ResponseBody
	public ResponseVO upload(ProductEntity productEntity, MultipartFile myfile) throws IOException {
			productEntity.setMainImage(upload(myfile));
			productService.proInsert(productEntity);
			return ResponseVO.newBuilder().code("200").message("添加成功!").build();

	}
	//上传图片
	private String upload(MultipartFile myfile) throws IOException {
		//获取到图片名称
		String fileName = myfile.getOriginalFilename();
//		获取图片后缀
		String exl = fileName.substring(fileName.lastIndexOf("."));
//		UUID转换名称使其唯一
		fileName = UUID.randomUUID().toString() + exl;
//		获取绝对路径
		String path = FILE_DIRECTORY + File.separator + fileName;
//		传入文件对象中
		File file = new File(path);
		try {
//			文件上传到指定文件
			myfile.transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return fileName;
	}

	//显示图片
	@RequestMapping("/download")
	public ResponseEntity<InputStreamSource> download(String filename) throws IOException {
		//在mac系统下pathSeparator值为: ,separator值为: /
		String fullPath = FILE_DIRECTORY + File.separator + filename;
		File file = new File(fullPath);
		//这个guess方法是依据文件名来得到媒体类型也就是mime类型,
		// 比如常见有image/jpeg,application/json
		String mediaType = URLConnection.guessContentTypeFromName(filename);
		if(mediaType==null) {
			/*识别不了时,统统用这个,一般用来表示下载二进制数据*/
			mediaType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
		}
		System.out.println("-----debug: mediaType = " + mediaType);
		HttpHeaders respHeaders = new HttpHeaders();
		respHeaders.setContentType(MediaType.parseMediaType(mediaType));

		//attachment :附件的意思,表示告诉浏览器弹出一个另存为窗口来下载文件,
		// inline是直接在浏览器中打开下载的文件
		//需要进行URL编码处理,否则另存为对话框不能显示中文
		respHeaders.setContentDispositionFormData("attachment",
				URLEncoder.encode(filename,"UTF-8"));
		InputStreamResource isr =
				new InputStreamResource(new FileInputStream(file));
		return new ResponseEntity<>(isr, respHeaders, HttpStatus.OK);
	}


	//	修改商品状态(上架与下架)

	@RequestMapping("/updateState")
	@ResponseBody
	public ResponseVO updateState(@RequestParam(value = "productState", required = false) String productState,
								  @RequestParam(value = "proId", required = false) String proId) {
		Integer id = Integer.parseInt(proId);
		Integer pStatus = Integer.parseInt(productState);
		System.out.println("productState = " +pStatus+"---"+id);
			if(productService.updateState(pStatus,id)){
				return ResponseVO.newBuilder().code("200").message("ok!").build();
			}
		return ResponseVO.newBuilder().code("500").message("failed!").build();
	}
}
