package bbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import bbs.dto.PostsDto;
import bbs.entity.Posts;

public interface PostsMapper {
    List<Posts> getPostList(@Param("category")String category, @Param("fromDate")String fromDate, @Param("toDate")String toDate);
    List<String> getCategories();
    void addPost(PostsDto post);
    void deletePost(PostsDto post);
    void editPost(PostsDto post);
    PostsDto getPost(PostsDto post);
}