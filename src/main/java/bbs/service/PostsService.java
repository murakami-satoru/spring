package bbs.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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

	private Logger log = LogManager.getLogger(PostsService.class);

    @Autowired
    private PostsMapper postsMapper;

    public List<Posts> getPosts(SearchPostsForm form){
    	String category = form.getCategory();
    	String toDate = form.getToDate();
    	String fromDate = form.getFromDate();
    	return postsMapper.getPostList(category, toDate, fromDate);
    }

    public List<String> getCategories() {
		List<String> cat = postsMapper.getCategories();
		cat.add(0, "");
    	return cat;
    }

    public void addPost(Users loginUser,PostForm form) {
    	PostsDto post = new PostsDto();
    	BeanUtils.copyProperties(form, post);
    	post.setUserId(loginUser.getId());
		postsMapper.addPost(post);
		log.debug(post.getText());
    }

    public void deletePost(Users loginUser,PostForm form) {
    	PostsDto post = new PostsDto();
    	BeanUtils.copyProperties(form, post);
    	postsMapper.deletePost(post);
    }

    public void editPost(PostForm form) {
    	PostsDto post = new PostsDto();
    	BeanUtils.copyProperties(form, post);
    	postsMapper.editPost(post);
    }

    public PostsDto getPost(PostForm form) {
    	PostsDto post = new PostsDto();
    	BeanUtils.copyProperties(form, post);
    	return postsMapper.getPost(post);
    }
}