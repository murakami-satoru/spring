package bbs.form;

import lombok.Data;

@Data
public class CommentForm {
    private String text;
    private int postId;
}