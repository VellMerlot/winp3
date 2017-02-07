package es.limolike.winp3MVC.controller;

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
import org.springframework.web.servlet.ModelAndView;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3RS.domain.Configuration;
import es.limolike.winp3RS.domain.User;
import es.limolike.winp3RS.service.IUserService;
import es.limolike.winp3RS.service.ConfigurationService;

@Controller
public class AppController {
	
	@Autowired
	private IUserService userService;

	public IUserService getUserService() {
		return userService;
	}

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
		model.setViewName("simulator");
		return model;
	}
	
	@RequestMapping(value = { "/pages/profile" }, method = RequestMethod.GET)
	public ModelAndView profilePage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("profile");
		return model;
	}
	
	@RequestMapping(value = { "/pages/users" }, method = RequestMethod.GET)
	public ModelAndView userPage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("users");
		return model;
	}
	
	@RequestMapping(value = { "/pages/users/create" }, method = RequestMethod.POST)
	public ModelAndView userNewPage2(@ModelAttribute("userForm") User user) {

		ModelAndView model = new ModelAndView();
		//model.addObject("action", "new");
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
	public ModelAndView userShowPage(@RequestParam(value = "username", required = true) String username) {

		ModelAndView model = new ModelAndView();
		model.addObject("formActionUrl", "/winp3/web/pages/users/update");
		model.addObject("username", username);
		
		User user = null;
		try {
			user = userService.get(1);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addObject("userForm", user);
		
		model.setViewName("user");
		return model;
	}
	
	@RequestMapping(value = { "/pages/configuration" }, method = RequestMethod.GET)
	public ModelAndView configPage(@RequestParam(value = "username", required = true) String username) {

		ModelAndView model = new ModelAndView();
		model.addObject("formActionUrl", "/winp3/web/pages/configuration/update");
		model.addObject("username", username);
		
		Configuration configuration = new Configuration();
		configuration.setIpc(new Double(11.5));
		
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
			model.addObject("error", "¡Usuario o contraseña incorrectos!");
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