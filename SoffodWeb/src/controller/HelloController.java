package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.ejb.EJB;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.jboss.resteasy.spi.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import entity.Soffood;
import service.OrderItemService;
import service.SofService;

@Controller
public class HelloController {
	private static final String UPLOAD_DIRECTORY = "/img/food";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB

	@EJB(mappedName = "ejb:/SoffodWeb/SoffoodServiceBean!service.SofService")
	SofService pmService;


	@RequestMapping(value = "savefile", method = RequestMethod.POST)
	public String saveimage(@RequestParam CommonsMultipartFile file, HttpSession session, HttpServletRequest request) throws Exception {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		
		Soffood image = new Soffood();

		ServletFileUpload upload = new ServletFileUpload(factory);
		ServletContext context = session.getServletContext();

		String uploadPath = context.getRealPath(UPLOAD_DIRECTORY);
		System.out.println(uploadPath);

		
		byte[] bytes = file.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream(
				new FileOutputStream(new File(uploadPath + File.separator + file.getOriginalFilename())));
		stream.write(bytes);
		stream.flush();
		image.setFoodImage(file.getOriginalFilename());
		image.setFoodName(request.getParameter("foodName"));
		image.setPrice( Double.parseDouble(request.getParameter("Price")));
		pmService.insert(image);
		stream.close();
		return "redirect:drinkForm.do";
	}
}
