package org.jcmg.java.DAO;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.jcmg.hibernate.entities.Message;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.interfaces.MessageDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class MessageDAOImpl extends GenericDAOImpl<Message, Integer> implements MessageDAO{

    @Override
    public List<Message> findByReciever(User user, Boolean includeRead) {
        List<Message> messages = new ArrayList<>();
        Session session = HibernateUtil.getSession();
        Criteria criteriaMessage = session.createCriteria(Message.class);
        criteriaMessage.add(Restrictions.eq("userByReciever", user));
        if (!includeRead) {
            criteriaMessage.add(Restrictions.eq("readOk", includeRead));
        }        
        criteriaMessage.createCriteria("userBySender", JoinType.INNER_JOIN);   
        messages = criteriaMessage.list();
        return messages;
    }

    @Override
    public List<Message> findBySender(User user) {
        List<Message> messages = new ArrayList<>();
        Session session = HibernateUtil.getSession();
        Criteria criteriaMessage = session.createCriteria(Message.class);
        criteriaMessage.add(Restrictions.eq("userBySender", user));
        criteriaMessage.createCriteria("userByReciever", JoinType.INNER_JOIN);   
        messages = criteriaMessage.list();
        return messages;
    }

}
