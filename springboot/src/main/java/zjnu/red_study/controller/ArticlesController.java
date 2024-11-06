package zjnu.red_study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import zjnu.red_study.entity.Articles;
import zjnu.red_study.service.ArticleService;

import java.util.List;

@RestController
@RequestMapping("/api/articles")
public class ArticlesController {

    @Autowired
    private ArticleService articleService;

    @GetMapping
    public List<Articles> getAllArticles() {
        return articleService.getAllArticles();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Articles> getArticleById(@PathVariable Integer id) {
        Articles article = articleService.getArticleById(id);
        return article != null ? ResponseEntity.ok(article) : ResponseEntity.notFound().build();
    }

    @PostMapping
    public void createArticle(@RequestBody Articles article) {
        articleService.createArticle(article);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> updateArticle(@PathVariable Integer id, @RequestBody Articles articleDetails) {
        articleService.updateArticle(id, articleDetails);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteArticle(@PathVariable Integer id) {
        articleService.deleteArticle(id);
        return ResponseEntity.ok().build();
    }
}