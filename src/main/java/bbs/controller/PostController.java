package bbs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bbs.dto.PostsDto;
import bbs.entity.Users;
import bbs.form.PostForm;
import bbs.service.PostsService;

@Controller
public class PostController {
    @Autowired
    private PostsService postsService;

    @RequestMapping(value = "/addPost", method = RequestMethod.POST)
    public String addPost(@ModelAttribute PostForm form,HttpSession session) {
    	Users loginUser = (Users) session.getAttribute("loginUser");
    	postsService.addComment(loginUser, form);
        return "redirect:/home";
    }

    @RequestMapping(value = "/newPost", method = RequestMethod.GET)
    public String newPost(Model model) {
    	model.addAttribute("post",new PostsDto());
    	model.addAttribute("categories",postsService.getCategories());
        return "addPost";
    }
}