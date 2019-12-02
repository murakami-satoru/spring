package bbs.mapper;

import bbs.dto.CommentsDto;

public interface CommentsMapper {
   void addComment(CommentsDto comments);
   void deleteComment(CommentsDto comments);
}