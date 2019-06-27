package ru.itis.drugstore.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.itis.drugstore.models.LikeItem;
import ru.itis.drugstore.models.User;

import java.util.List;

public interface LikeItemRepository extends CrudRepository<LikeItem, Long> {
    List<LikeItem> findByUser(User user);
//    private JdbcTemplate jdbcTemplate;
//
//    @Autowired
//    public LikeItemServiceImpl(DataSource dataSource) {
//        this.jdbcTemplate = new JdbcTemplate(dataSource);
//    }
//
//    public void add(String href, String img, String name, Double price){
//        KeyHolder keyHolder = new GeneratedKeyHolder();
//        jdbcTemplate.update(
//                connection -> {
//                    PreparedStatement ps =
//                            connection.prepareStatement(SQL_INSERT, new String[]{"id"});
//                    ps.setString(1, href);
//                    ps.setString(2, img);
//                    ps.setString(3, name);
//                    ps.setDouble(4, price);
//                    return ps;
//                }, keyHolder);
//
//        model.setId(keyHolder.getKey().longValue());
//    }
//

}