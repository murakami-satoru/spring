package bbs.form;

import lombok.Data;

@Data
public class PostForm {
    private String title;
    private String text;
    private String category;
}