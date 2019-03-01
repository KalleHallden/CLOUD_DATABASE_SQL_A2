package se.chalmers.dm;

import java.nio.charset.CodingErrorAction;

class WebPage {
    /* fields ID, Url, Author, Content, Popularity */
    private int id;
    private String url;
    private int author;
    private String content;
    private int popularity;

    public WebPage(int id, String url, int author, String content, int popularity) {
        this.id = id;
        this.url = url;
        this.author = author;
        this.content = content;
        this.popularity = popularity;
    }
}