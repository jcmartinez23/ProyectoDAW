package org.jcmg.java.DAO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.jcmg.hibernate.entities.Message;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.interfaces.MessageDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class MessageDAOImpl extends GenericDAOImpl<Message, Integer> implements MessageDAO{

    @Override
    public List<Message> findByUser(User user, Boolean includeRead) {
        List<Message> messages = new ArrayList<>();
        String queryText;
        if (includeRead) {
            queryText = "from Message where sender = :user or reciever = :user";
        } else {
            queryText = "from Message where reciever = :user and read = false";
        }
                
        Query query = HibernateUtil.getSession().createQuery(queryText);
        query.setParameter("user", user.getUserId());
        messages = query.list();
        return messages;
    }

}
