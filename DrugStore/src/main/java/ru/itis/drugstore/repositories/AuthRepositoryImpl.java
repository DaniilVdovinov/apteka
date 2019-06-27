//package ru.itis.drugstore.repositories;
//
//import org.springframework.stereotype.Component;
//import ru.itis.drugstore.models.Auth;
//
//import javax.persistence.EntityManager;
//import javax.persistence.PersistenceContext;
//import javax.persistence.Query;
//import java.util.Optional;
//@Component
//public class AuthRepositoryImpl implements AuthRepository {
//    @PersistenceContext
//    EntityManager em;
//
//    @Override
//    public Auth findByCookieValue(String cookieValue) {
//        Query q = em.createQuery("SELECT u FROM Auth u WHERE cookieValue = :val");
//        q.setParameter("val", cookieValue);
//        Auth u = (Auth) q.getSingleResult();
//        return Optional.ofNullable(u).get();
//    }
//
//    @Override
//    public void save(Auth model) {
//        Query q = em.createNativeQuery("insert into auth(id, cookie_value) values (?, ?)");
//        q.setParameter(1, model.getId());
//        q.setParameter(2, model.getCookieValue());
//        q.executeUpdate();
//    }
//}
