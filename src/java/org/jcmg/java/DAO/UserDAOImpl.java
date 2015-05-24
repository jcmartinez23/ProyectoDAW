/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.jcmg.java.DAO;

import java.util.List;
import org.hibernate.Query;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.interfaces.UserDAO;

public class UserDAOImpl extends GenericDAOImpl<User, Integer> implements UserDAO {

    @Override
    public User find(User entity) {
        User user = null;
        Query query = HibernateUtil.getSession().createQuery("from User where mail = :mail");
        query.setParameter("mail", entity.getMail());
        user = (User) query.uniqueResult();
        return user;
    }

    @Override
    public List<User> findByType(Character type) {
        List<User> users = null;
        Query query = HibernateUtil.getSession().createQuery("from User where user_type = :type");
        query.setParameter("type", type);
        users = query.list();
        return users;
    }
}