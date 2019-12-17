package bbs.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

import bbs.form.CommentForm;
import bbs.form.InjectionForm;
import bbs.form.PostForm;
import bbs.form.SearchPostsForm;
import bbs.entity.Users;
import bbs.service.InjectionService;
import bbs.service.PostsService;

@Controller
public class HomeController {

    @Autowired
    private PostsService postsService;
    @Autowired
    private InjectionService injectionService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String displayHome(Model model) {
		model.addAttribute("posts", postsService.getAll());
		commonHome(model);
		return "home";
    }

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
        session.invalidate();
		return "redirect:/login";
    }

    @RequestMapping(value = "/getAllPost", method = RequestMethod.GET)
    public String refreshHome() {
        return "redirect:/home";
    }

    @RequestMapping(value = "/searchPosts", method = RequestMethod.POST)
    public String searchPosts(@ModelAttribute SearchPostsForm form,Model model) {
    	model.addAttribute("posts", postsService.getPosts(form));
		commonHome(model);
        return "home";
    }

    private Model commonHome(Model model){
		model.addAttribute("addComment",new CommentForm());
		model.addAttribute("searchPosts",new SearchPostsForm());
    	model.addAttribute("categories",postsService.getCategories());
		return model;
    }


    @RequestMapping(value = "/deletePost", method = RequestMethod.POST)
    public String deletePost(HttpSession session, PostForm form) {
    	Users loginUser = (Users) session.getAttribute("loginUser");
    	postsService.deletePost(loginUser, form);
        return "redirect:/home";
    }

    @RequestMapping(value = "/editPost", method = RequestMethod.POST)
    public String getPost(Model model, PostForm form) {
    	model.addAttribute("post",postsService.getPost(form));
    	model.addAttribute("categories",postsService.getCategories());
    	model.addAttribute("action_post","doeditPost");
        return "addPost";
    }

    @RequestMapping(value = "/injection", method = RequestMethod.GET)
    public String viewInjection(Model model, InjectionForm form) {
        model.addAttribute("title", "インジェクションテスト");
        model.addAttribute("injection", form);
        return "injection";
    }

    @RequestMapping(value = "/osInjection", method = RequestMethod.POST)
    public String osInjection(Model model, InjectionForm form) {
        model.addAttribute("title", "インジェクションテスト");
        form.setResult(injectionService.doOsi(form));
        model.addAttribute("injection", form);
        return "injection";
    }
}