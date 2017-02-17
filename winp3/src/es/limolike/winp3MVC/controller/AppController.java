package es.limolike.winp3MVC.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3.common.Result;
import es.limolike.winp3RS.domain.Configuration;
import es.limolike.winp3RS.domain.Outcome;
import es.limolike.winp3RS.domain.Simulator;
import es.limolike.winp3RS.domain.User;
import es.limolike.winp3RS.service.IConfigurationService;
import es.limolike.winp3RS.service.IUserService;

@Controller
public class AppController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IConfigurationService configurationService;

	public IUserService getUserService() {
		return userService;
	}
	
	public IConfigurationService getConfigurationService() {
		return configurationService;
	}
	
//	@Autowired
//    FileValidator fileValidator;
//	
//	@InitBinder("fileBucket")
//    protected void initBinderFileBucket(WebDataBinder binder) {
//       binder.setValidator(fileValidator);
//    }

	@RequestMapping(value = { "/web" }, method = RequestMethod.GET)
	public ModelAndView indexPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Custom Login Form");
		model.addObject("message", "This is welcome page!");
		model.setViewName("index");
		return model;
	}
	
	@RequestMapping(value = "/pages", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Custom Login Form");
		model.addObject("message", "This is protected page!");
		model.setViewName("home");

		return model;
	}
	
	@RequestMapping(value = { "/pages/simulator" }, method = RequestMethod.GET)
	public ModelAndView simPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("formActionUrl", "/winp3/web/pages/simulator/generate");
		
		/*
		 * cargar datos de tabla global
		 * */		
		
		model.setViewName("simulator");
		return model;
	}
	
	@RequestMapping(value = { "/pages/simulator/outcome" }, method = RequestMethod.GET)
	public ModelAndView  saveSimulatorPage(@ModelAttribute("simulatorForm") Simulator result, HttpServletResponse response) throws IOException, JAXBException {

		ModelAndView model = new ModelAndView();
		model.addObject("formActionUrl", "/winp3/web/pages/simulator/outcome/generate");
		
		
		// hacer calculos y devolver resultado
		// guardar simulacion??? o devolver el bean y guardarla despues????
		
		model.addObject("outcomeForm", new Outcome());
		model.setViewName("outcome");
		return model;
	}
	
	@RequestMapping(value = { "/pages/simulator/outcome/generate" }, method = RequestMethod.POST)
	public void  saveSimulatorPage(@ModelAttribute("outcomeForm") Outcome result, HttpServletResponse response) throws IOException, JAXBException {
	
		//Simulator sim = new Simulator(1,"hola");
		
		try 
		{
	        response.setContentType("application/xml");
	        response.setHeader("Content-Disposition", "attachment; filename=simulacion_"+result.getId()+".xml");

	        JAXBContext jaxbContext = JAXBContext.newInstance(Simulator.class);
	        Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
	        
	        // output pretty printed
	        jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
	        
	        // writing to a file
	        /*ObjectOutputStream out = new ObjectOutputStream(response.getOutputStream());*/
	        jaxbMarshaller.marshal(result, response.getOutputStream());
	        
	        // writing to console
	        // jaxbMarshaller.marshal(book, System.out);
	        
	        response.flushBuffer();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	//@RequestMapping(value = { "/pages/simulator/load" }, headers=("content-type=multipart/*"), method = RequestMethod.POST)
	/*public ModelAndView loadSimulatorPage(@ModelAttribute("simulatorForm") Simulator simulator) {

		ModelAndView model = new ModelAndView();
		model.addObject("formActionUrl", "/winp3/web/pages/simulator/generate");
		model.addObject("load", true);
		model.addObject("simulatorForm", simulator);
		model.setViewName("simulator");
		
		return model;
	}*/
	/*public @ResponseBody String uploadFileHandler(@RequestParam("name") String name, @RequestParam("file") MultipartFile file) {

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();


				return "You successfully uploaded file=" + name;
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		} else {
			return "You failed to upload " + name
					+ " because the file was empty.";
		}
	}*/
	@RequestMapping(value = { "/pages/simulator/load" }, method = RequestMethod.POST)
	@ResponseBody
	public String singleFileUpload(@RequestParam("file") MultipartFile file) {

		if (file.isEmpty()) {
			//redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
			return "redirect:simulator";
		}

		try {

			// Get the file and save it somewhere
			byte[] bytes = file.getBytes();
			Path path = Paths.get("C:\\project\\" + file.getOriginalFilename());
			Files.write(path, bytes);

			//redirectAttributes.addFlashAttribute("message",	"You successfully uploaded '" + file.getOriginalFilename() + "'");

		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/simulator";
	}
	
	/*@RequestMapping(value="/pages/simulator/load", method = RequestMethod.POST)
	public String singleFileUpload(@Valid FileBucket fileBucket, BindingResult result, ModelMap model) throws IOException {
		 
        if (result.hasErrors()) {
            System.out.println("validation errors");
            return "simulator";
        } else {            
            System.out.println("Fetching file");
            MultipartFile multipartFile = fileBucket.getFile();
 
            //Now do something with file...
            FileCopyUtils.copy(fileBucket.getFile().getBytes(), new File("C:\\project\\" + fileBucket.getFile().getOriginalFilename()));
             
            String fileName = multipartFile.getOriginalFilename();
            model.addAttribute("fileName", fileName);
            return "simulator";
        }
    }*/
	
	
	@RequestMapping(value = { "/pages/users" }, method = RequestMethod.GET)
	public ModelAndView userPage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("users");
		return model;
	}
	
	@RequestMapping(value = { "/pages/users/create" }, method = RequestMethod.POST)
	public ModelAndView userCreatePage(@ModelAttribute("userForm") User user) {

		ModelAndView model = new ModelAndView();
		try {
			Result r = userService.saveOrUpdate(user);
			
			if (r == Result.OK)
				model.addObject("message_info", "El usuario ha sido creado correctamente.");
			else
				model.addObject("message_error", "Ha ocurrido un error al crear el usuario.");
		} catch (AppException e) {
			model.addObject("message_error", "Ha ocurrido un error al crear el usuario.");
			e.printStackTrace();
		}
		model.setViewName("users");
		return model;
	}
	
	@RequestMapping(value = { "/pages/users/update" }, method = RequestMethod.POST)
	public ModelAndView userUpdatePage(@ModelAttribute("userForm") User user) {

		ModelAndView model = new ModelAndView();
		try {
			Result r = userService.saveOrUpdate(user);
			
			if (r == Result.OK)
				model.addObject("message_info", "El usuario ha sido actualizado correctamente.");
			else
				model.addObject("message_error", "Ha ocurrido un error al actualizar el usuario.");
		} catch (AppException e) {
			model.addObject("message_error", "Ha ocurrido un error al actualizar el usuario.");
			e.printStackTrace();
		}
		
		model.setViewName("users");
		return model;
	}
	
	@RequestMapping(value = { "/pages/users/new" }, method = RequestMethod.GET)
	public ModelAndView userNewPage(ModelAndView model) {

		model.addObject("formActionUrl", "/winp3/web/pages/users/create");
		model.addObject("userForm", new User());
		model.setViewName("user");
		return model;
	}
		
	@RequestMapping(value = { "/pages/users/show" }, method = RequestMethod.GET)
	public ModelAndView userShowPage(@RequestParam(value = "user", required = true) Integer userId) {

		ModelAndView model = new ModelAndView();
		model.addObject("formActionUrl", "/winp3/web/pages/users/update");
		
		User user = null;
		try {
			user = userService.get(userId);
		} catch (AppException e) {
			e.printStackTrace();
		}
		model.addObject("userForm", user);
		
		model.setViewName("user");
		return model;
	}
	
	@RequestMapping(value = { "/pages/users/delete" }, method = RequestMethod.GET)
	public ModelAndView userDeletePage(@RequestParam(value = "user", required = true) Integer userId) {

		ModelAndView model = new ModelAndView();
		try {
			Result r = userService.updateStatus(userId, 1);
			
			if (r == Result.OK)
				model.addObject("message_info", "El usuario ha sido eliminado correctamente.");
			else
				model.addObject("message_error", "Ha ocurrido un error al eliminar el usuario.");
		} catch (AppException e) {
			model.addObject("message_error", "Ha ocurrido un error al eliminar el usuario.");
			e.printStackTrace();
		}
		
		model.setViewName("users");
		return model;
	}
	
	@RequestMapping(value = { "/pages/users/activate" }, method = RequestMethod.GET)
	public ModelAndView userActivatePage(@RequestParam(value = "user", required = true) Integer userId) {

		ModelAndView model = new ModelAndView();
		try {
			Result r = userService.updateStatus(userId, 0);
			
			if (r == Result.OK)
				model.addObject("message_info", "El usuario ha sido activado correctamente.");
			else
				model.addObject("message_error", "Ha ocurrido un error al activar el usuario.");
		} catch (AppException e) {
			model.addObject("message_error", "Ha ocurrido un error al activar el usuario.");
			e.printStackTrace();
		}
		
		model.setViewName("users");
		return model;
	}
	
	@RequestMapping(value = { "/pages/configuration" }, method = RequestMethod.GET)
	public ModelAndView configPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("formActionUrl", "/winp3/web/pages/configuration/update");
		
		Configuration configuration = null;
		try {
			configuration = configurationService.get(1);
		} catch (AppException e) {
			e.printStackTrace();
		}
		model.addObject("configurationForm", configuration);
		model.setViewName("configuration");
		
		return model;
	}
	
	@RequestMapping(value = { "/pages/configuration/update" }, method = RequestMethod.POST)
	public ModelAndView updateConfigPage(@ModelAttribute("configurationForm") Configuration configuration) {

		ModelAndView model = new ModelAndView();
		model.addObject("formActionUrl", "/winp3/web/pages/configuration/update");
		
		System.out.println(configuration);
		
		try {
			int result = configurationService.update(configuration);
		} catch (AppException e) {
			e.printStackTrace();
		}
		model.addObject("configurationForm", configuration);
		model.setViewName("configuration");
		
		return model;
	}
	
	/*http://www.mkyong.com/spring-mvc/spring-mvc-form-handling-example/*/
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Usuario o contraseña incorrectos!");
			model.addObject("login", "true");
			model.setViewName("index");
		} else {
			if (logout != null) {
				model.setViewName("redirect:/");
			}
		}
		return model;
		
	}

	//for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();	
			model.addObject("username", userDetail.getUsername());
		}

		model.setViewName("403");
		return model;
	}

}