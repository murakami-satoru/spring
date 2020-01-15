package bbs.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpSession;

import bbs.form.CommentForm;
import bbs.form.PostForm;
import bbs.form.SearchPostsForm;
import bbs.entity.Users;
import bbs.service.PostsService;

@Controller
public class HomeController {

    private Logger log = LogManager.getLogger(HomeController.class);

    @Autowired
    private PostsService postsService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String displayHome(Model model) {
		model.addAttribute("posts", postsService.getPosts(new SearchPostsForm()));
		commonHome(model);
        model.addAttribute("termCategory", "");
        model.addAttribute("termFromDate", "");
        model.addAttribute("termToDate", "");
		return "home";
    }

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
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
        model.addAttribute("termCategory", form.getCategory());
        model.addAttribute("termFromDate", form.getFromDate());
        model.addAttribute("termToDate", form.getToDate());
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
}