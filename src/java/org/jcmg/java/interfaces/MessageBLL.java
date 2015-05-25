package org.jcmg.java.interfaces;

import java.util.List;
import org.jcmg.hibernate.entities.Message;
import org.jcmg.hibernate.entities.User;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface MessageBLL extends GenericBLL<Message>{
    
    public List<Message> findByUser(User user, Boolean includeRead);
}
