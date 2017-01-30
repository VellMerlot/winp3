package es.limolike.winp3MVC.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AppController {

	@RequestMapping(value = { "/web" }, method = RequestMethod.GET)
	public ModelAndView indexPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Custom Login Form");
		model.addObject("message", "This is welcome page!");
		model.setViewName("index");
		return model;
	}
	
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Custom Login Form");
		model.addObject("message", "This is protected page!");
		model.setViewName("home");

		return model;
	}

	@RequestMapping(value = { "/page/ping" }, method = RequestMethod.GET)
	public ModelAndView pingPage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("ping");
		return model;
	}
	
	@RequestMapping(value = { "/page/simulator" }, method = RequestMethod.GET)
	public ModelAndView simPage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("simulator");
		return model;
	}
	
	@RequestMapping(value = { "/page/user" }, method = RequestMethod.GET)
	public ModelAndView userPage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("user");
		return model;
	}
	
	@RequestMapping(value = { "/page/configuration" }, method = RequestMethod.GET)
	public ModelAndView configPage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("configuration");
		return model;
	}
			
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}
		model.setViewName("login");

		if (logout != null) {
			ModelAndView modelAndView =  new ModelAndView("redirect:/");
			return modelAndView;
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