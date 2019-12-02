package bbs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bbs.entity.Users;
import bbs.form.CommentForm;
import bbs.service.CommentsService;

@Controller
public class CommentController {
    @Autowired
    private CommentsService commentsService;

    @RequestMapping(value = "/addComment", method = RequestMethod.POST)
    public String addComment(@ModelAttribute CommentForm form,HttpSession session) {
    	Users loginUser = (Users)session.getAttribute("loginUser");
    	commentsService.addComment(loginUser, form);
        return "redirect:/home";
    }

    @RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
    public String deleteComment(@ModelAttribute CommentForm form,HttpSession session) {
    	Users loginUser = (Users)session.getAttribute("loginUser");
    	commentsService.deleteComment(loginUser, form);
        return "redirect:/home";
    }
}