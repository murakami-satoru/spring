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
import bbs.form.SearchUsersForm;
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
    public String toLogin(Model model ,HttpSession session) {
        session.invalidate();
    	model.addAttribute("login", new LoginForm());
        return "login";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
    	return "redirect:/login";
    }

    @RequestMapping(value = "/manage", method = RequestMethod.GET)
    public String toUserMange(Model model) {
		model.addAttribute("searchUsers",new SearchUsersForm());
        model.addAttribute("users", userService.getUsers(new SearchUsersForm()));
        model.addAttribute("departments", userService.getDepartments());
        model.addAttribute("branches", userService.getBranches());
        return "manage";
    }

    @RequestMapping(value = "/manage", method = RequestMethod.POST)
    public String searchUserMange(Model model, SearchUsersForm form) {
		model.addAttribute("searchUsers",form);
        model.addAttribute("users", userService.getUsers(form));
        model.addAttribute("departments", userService.getDepartments());
        model.addAttribute("branches", userService.getBranches());
        model.addAttribute("termBName", form.getBranchName());
        model.addAttribute("termDName", form.getDepartmentName());
        model.addAttribute("termName", form.getName());
        return "manage";
    }
}