package zjnu.red_study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import zjnu.red_study.entity.Articles;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class ArticleService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Articles> getAllArticles() {
        String sql = "SELECT * FROM articles";
        return jdbcTemplate.query(sql, new ArticleMapper());
    }

    public Articles getArticleById(Integer id) {
        String sql = "SELECT * FROM articles WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new ArticleMapper());
    }

    public void createArticle(Articles article) {
        String sql = "INSERT INTO articles (title, content, article_id) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, article.getTitle(), article.getContent(), article.getArticle_id());
    }

    public void updateArticle(Integer id, Articles articleDetails) {
        String sql = "UPDATE articles SET title = ?, content = ?, article_id = ? WHERE id = ?";
        jdbcTemplate.update(sql, articleDetails.getTitle(), articleDetails.getContent(), articleDetails.getArticle_id(), id);
    }

    public void deleteArticle(Integer id) {
        String sql = "DELETE FROM articles WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    private static final class ArticleMapper implements RowMapper<Articles> {
        @Override
        public Articles mapRow(ResultSet rs, int rowNum) throws SQLException {
            Articles article = new Articles();
            article.setId(rs.getInt("id"));
            article.setTitle(rs.getString("title"));
            article.setContent(rs.getString("content"));
            article.setArticle_id(rs.getInt("article_id"));
            return article;
        }
    }
}