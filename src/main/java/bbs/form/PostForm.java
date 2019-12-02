package bbs.form;

import lombok.Data;

@Data
public class PostForm {
    private int id;
    private String title;
    private String text;
    private String category;
}