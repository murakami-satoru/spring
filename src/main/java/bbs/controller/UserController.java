package bbs.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bbs.entity.Users;
import bbs.form.LoginForm;
import bbs.service.UsersService;

@Controller
@SessionAttributes("loginUser")
public class UserController {
    @Autowired
    private UsersService userService;

//    @RequestMapping(value = "/login", method = RequestMethod.POST)
//    public String toHome(@ModelAttribute LoginForm form,RedirectAttributes attributes,HttpSession session) {
//        Users loginUser = userService.loginBBS(form);
//        if(loginUser == null){
//        	List<String> messages = new ArrayList<String>();
//			messages.add("ログインに失敗しました");
//			attributes.addFlashAttribute("errorMessages", messages);
//        	return "redirect:/login";
//        }
//        session.setAttribute("loginUser", loginUser);
//        return "redirect:/home";
//    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String toHome(@ModelAttribute LoginForm form,RedirectAttributes attributes,Model model,HttpSession session) {
        Users loginUser = userService.loginBBS(form);
        if(loginUser == null){
        	List<String> messages = new ArrayList<String>();
			messages.add("ログインに失敗しました");
			attributes.addFlashAttribute("errorMessages", messages);
        	return "redirect:/login";
        }
        model.addAttribute("loginUser", loginUser);
        session.setAttribute("loginUser", loginUser);
        return "redirect:/home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String toLogin(Model model) {
    	model.addAttribute("login", new LoginForm());
    	model.addAttribute("title", "ログイン画面");
        return "login";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
    	return "redirect:/login";
    }
}