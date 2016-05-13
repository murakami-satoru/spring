package bbs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bbs.form.CommentForm;
import bbs.form.SearchPostsForm;
import bbs.service.PostsService;

@Controller
public class HomeController {

    @Autowired
    private PostsService postsService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String displayHome(Model model) {
		model.addAttribute("posts", postsService.getAll());
		commonHome(model);
		return "home";
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
		model.addAttribute("title", "ホーム画面");

		return model;
    }
}