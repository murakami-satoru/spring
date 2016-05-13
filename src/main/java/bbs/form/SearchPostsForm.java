package bbs.form;

import lombok.Data;

@Data
public class SearchPostsForm {
    private String category;
    private String fromDate;
    private String toDate;
}