package com.uml.book.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.uml.book.entity.Book;
import com.uml.book.service.BookService;

import tools.RandomString;

@Controller
public class FileUploadController {
	
	@Autowired
	@Qualifier("bookService")
	private BookService bookService;
	
	/**
	 * 管理员修改图书图片
	 * @param file
	 * @param id
	 * @return
	 */
	@RequestMapping(value="common/book/uploadImage",method=RequestMethod.POST)
	public @ResponseBody Map<String,String> handleFileUpload(@RequestParam("file") MultipartFile file, @RequestParam String id){
		Map<String,String> map = new HashMap<String,String>(1);
		if (!file.isEmpty()) {
			 try {
				 //获取文件的原始名字
				 String fileName = file.getOriginalFilename();
				 // 获取图片的扩展名
			     String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
			     // 新的图片文件名 = 获取时间戳+随机生成字符串+"."+图片扩展名
				 RandomString randomString = new RandomString();
				 @SuppressWarnings("static-access")
				 String randomName = randomString.getRandomString(10);
			     //更改文件名
				 Date now = new Date();
				 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
	             String newName = dateFormat.format(now) + randomName + "." + extensionName;
	             //获取本地路径
	             String path = "G:/uml_shiyan/book_system/WebContent/resource/download/bookImages/"+newName;	             
	             File localFile = new File(path);
	             //将文件写到本地
	             file.transferTo(localFile);	             
	           
	             //修改数据库的记录
	             int Id = Integer.parseInt(id);
	             Book book = bookService.get(Id);
	             book.setBookUrl(newName);
	             bookService.update(book);
	             
	             //图片上传是否成功的标志
	             map.put("flag", "success");
	             map.put("url",newName);
	             return map;
	             } catch (Exception e) {
	            	 map.put("flag", e.getMessage());
	            	 map.put("url",null);
	            	 return map;
	            }
	        } else {
	        	map.put("flag", "You failed to upload,because the file was empty.");
	        	map.put("url",null);
	            return map;
	        }
	}
	
	/**
	 * 图书管理员新增图书
	 * @param file
	 * @return
	 */
	@RequestMapping(value="bookadmin/uploadImage",method=RequestMethod.POST)
	public @ResponseBody Map<String,String> save(@RequestParam("file") MultipartFile file){
		Map<String,String> map = new HashMap<String,String>(1);
		if (!file.isEmpty()) {
			 try {
				 //获取文件的原始名字
				 String fileName = file.getOriginalFilename();
				 // 获取图片的扩展名
			     String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
			     // 新的图片文件名 = 获取时间戳+随机生成字符串+"."+图片扩展名
				 RandomString randomString = new RandomString();
				 @SuppressWarnings("static-access")
				 String randomName = randomString.getRandomString(10);
			     //更改文件名
				 Date now = new Date();
				 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
	             String newName = dateFormat.format(now) + randomName + "." + extensionName;
	             //获取本地路径
	             String path = "G:/uml_shiyan/book_system/WebContent/resource/download/bookImages/"+newName;	             
	             File localFile = new File(path);
	             //将文件写到本地
	             file.transferTo(localFile);	             	         
	             
	             //图片上传是否成功的标志
	             map.put("flag", "success");
	             map.put("url",newName);
	             return map;
	             } catch (Exception e) {
	            	 map.put("flag", e.getMessage());
	            	 map.put("url",null);
	            	 return map;
	            }
	        } else {
	        	map.put("flag", "You failed to upload,because the file was empty.");
	        	map.put("url",null);
	            return map;
	        }
	}

	@RequestMapping(value="bookadmin/save",method=RequestMethod.POST)
	public @ResponseBody boolean addBook(@RequestBody JSONObject json){
	             //新增数据库的记录
	             Book book = new Book();
	             book.setBookId(json.getString("bookId"));
	             book.setTotalNumber(Integer.parseInt(json.getString("bookNumber")));
	             book.setBookNumber(Integer.parseInt(json.getString("bookNumber")));
	             book.setRestNumber(Integer.parseInt(json.getString("bookNumber")));
	             book.setBookUrl(json.getString("url"));
	             book.setCountry(json.getString("country"));
	             book.setDescription(json.getString("description"));
	             book.setStyle(json.getString("style"));
	             book.setName(json.getString("name"));
	             book.setWriter(json.getString("writer"));	             
	             bookService.save(book);
	             return true;
	    
	}
}
