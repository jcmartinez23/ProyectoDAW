package org.jcmg.java.BLL;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.jcmg.hibernate.entities.Message;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.DAO.HibernateUtil;
import org.jcmg.java.DAO.MessageDAOImpl;
import org.jcmg.java.DAO.UserDAOImpl;
import org.jcmg.java.interfaces.MessageDAO;
import org.jcmg.java.interfaces.UserBLL;
import org.jcmg.java.interfaces.UserDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class UserBLLImpl implements UserBLL {

    private UserDAO userDAO = new UserDAOImpl();

    @Override
    public void save(User entity) {
        try {
            HibernateUtil.beginTransaction();
            userDAO.save(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            System.out.println("Handle your error here");
            HibernateUtil.rollbackTransaction();
        }
    }

    @Override
    public void update(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<User> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User find(User entity) {
        User user = null;

        try {
            HibernateUtil.beginTransaction();
            user = userDAO.find(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            System.out.println("Handle your error here");
            HibernateUtil.rollbackTransaction();
        }

        return user;
    }

    @Override
    public User getValidUserPassword(User entity) {
        User user = null;

        try {
            HibernateUtil.beginTransaction();
            user = userDAO.find(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            System.out.println("Handle your error here");
            HibernateUtil.rollbackTransaction();
        }

        if (!entity.getPassword().equals(user.getPassword())) {
            user = null;
        }

        return user;
    }

    @Override
    public List<Message> getMessagesForUser(User entity, Boolean includeRead) {
        List<Message> messages = new ArrayList<>();

        try {
            HibernateUtil.beginTransaction();
            MessageDAO messageDAO = new MessageDAOImpl();
            messages = messageDAO.findByReciever(entity, includeRead);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            System.out.println("Handle your error here");
            HibernateUtil.rollbackTransaction();
        }

        return messages;
    }

    @Override
    public List<User> findByType(Character type) {
        List<User> users = new ArrayList<>();

        try {
            HibernateUtil.beginTransaction();            
            users = userDAO.findByType(type);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            System.out.println("Handle your error here");
            HibernateUtil.rollbackTransaction();
        }

        return users;
    }

    @Override
    public User getByMail(User entity) {        
        User user = new User();
        
        try {
            HibernateUtil.beginTransaction();
            user = userDAO.find(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            System.out.println("Handle your error here");
            HibernateUtil.rollbackTransaction();
        }

        return user;
    }
}
