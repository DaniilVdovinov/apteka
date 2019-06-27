package ru.itis.drugstore.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ru.itis.drugstore.models.LikeItem;
import ru.itis.drugstore.models.User;
import ru.itis.drugstore.repositories.LikeItemRepository;

//import javax.persistence.EntityManager;
//import javax.persistence.Persistence;
import java.util.List;

@Component
public class LikeItemServiceImpl implements LikeItemService {
    @Autowired
    private LikeItemRepository likeItemRepository;

//    public EntityManager em = Persistence.createEntityManagerFactory("COLIBRI").createEntityManager();

    @Override
    public List<LikeItem> getAll(User user) {
        return likeItemRepository.findByUser(user);
    }
//
//    public LikeItem add(LikeItem item){
//        em.getTransaction().begin();
//        LikeItem carFromDB = em.merge(item);
//        em.getTransaction().commit();
//        return carFromDB;
//    }

}
