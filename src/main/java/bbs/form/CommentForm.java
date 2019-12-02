package bbs.form;

import lombok.Data;

@Data
public class CommentForm {
    private int id;
    private String text;
    private int postId;
}