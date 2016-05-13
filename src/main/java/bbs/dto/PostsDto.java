package bbs.dto;

import java.util.List;

import bbs.entity.Posts;
import lombok.Data;

@Data
public class PostsDto extends Posts{
	private List<String> categories;
}