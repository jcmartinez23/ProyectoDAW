package org.jcmg.java.BLL;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.jcmg.hibernate.entities.Message;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.DAO.HibernateUtil;
import org.jcmg.java.DAO.MessageDAOImpl;
import org.jcmg.java.interfaces.MessageBLL;
import org.jcmg.java.interfaces.MessageDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class MessageBLLImpl implements MessageBLL {

    MessageDAO messageDAO = new MessageDAOImpl();

    @Override
    public List<Message> findBySender(User user) {
                List<Message> messages = new ArrayList<>();

        try {
            HibernateUtil.beginTransaction();
            messages = messageDAO.findBySender(user);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            HibernateUtil.rollbackTransaction();
        }

        return messages;
    }

    @Override
    public List<Message> findByReciever(User user, Boolean includeRead) {
        List<Message> messages = new ArrayList<>();

        try {
            HibernateUtil.beginTransaction();
            messages = messageDAO.findByReciever(user, includeRead);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        }

        return messages;
    }

    @Override
    public void save(Message entity) {
        try {
            HibernateUtil.beginTransaction();
            messageDAO.save(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {            
            HibernateUtil.rollbackTransaction();
            throw ex;
        }
    }

    @Override
    public void update(Message entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Message entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Message> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Message find(Message entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
