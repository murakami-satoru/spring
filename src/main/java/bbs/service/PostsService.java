package bbs.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bbs.dto.PostsDto;
import bbs.entity.Posts;
import bbs.entity.Users;
import bbs.form.PostForm;
import bbs.form.SearchPostsForm;
import bbs.mapper.PostsMapper;

@Service
public class PostsService {

    @Autowired
    private PostsMapper postsMapper;

    public List<Posts> getAll() {
        return postsMapper.getAll();
    }

    public List<Posts> getPosts(SearchPostsForm form){
    	String category = form.getCategory();
    	String toDate = form.getToDate();
    	String fromDate = form.getFromDate();

    	if(!category.isEmpty()){
    		return postsMapper.getPostsByCategory(category);
    	}else if(!toDate.isEmpty() && !fromDate.isEmpty()){
    		return postsMapper.getPostsByBetweenDate(toDate,fromDate);
    	}else if(!toDate.isEmpty()){
    		return postsMapper.getPostsByToDate(toDate);
    	}else if(!fromDate.isEmpty()){
    		return postsMapper.getPostsByFromDate(fromDate);
    	}

    	return getAll();
    }

    public List<String> getCategories() {
    	return postsMapper.getCategories();
    }

    public void addComment(Users loginUser,PostForm form) {
    	System.out.println(form.getCategory());
    	PostsDto post = new PostsDto();
    	BeanUtils.copyProperties(form, post);
    	post.setUserId(loginUser.getId());
    	postsMapper.addPost(post);
    }
}