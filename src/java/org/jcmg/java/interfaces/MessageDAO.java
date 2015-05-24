package org.jcmg.java.interfaces;

import java.io.Serializable;
import java.util.List;
import org.jcmg.hibernate.entities.Message;
import org.jcmg.hibernate.entities.User;

/**
 *
 * @author juanca
 */
public interface MessageDAO extends GenericDAO<Message, Integer>{
    
    public List<Message> findByUser(User user, Boolean includeRead);
}
