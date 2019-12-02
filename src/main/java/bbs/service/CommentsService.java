package bbs.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bbs.dto.CommentsDto;
import bbs.entity.Users;
import bbs.form.CommentForm;
import bbs.mapper.CommentsMapper;

@Service
public class CommentsService {

    @Autowired
    private CommentsMapper commentsMapper;

    public void addComment(Users loginUser,CommentForm form) {
    	CommentsDto comments = new CommentsDto();
    	BeanUtils.copyProperties(form, comments);
    	comments.setUserId(loginUser.getId());
    	commentsMapper.addComment(comments);
    }

    public void deleteComment(Users loginUser,CommentForm form) {
    	CommentsDto comments = new CommentsDto();
    	BeanUtils.copyProperties(form, comments);
    	comments.setUserId(loginUser.getId());
    	commentsMapper.deleteComment(comments);
    }
}