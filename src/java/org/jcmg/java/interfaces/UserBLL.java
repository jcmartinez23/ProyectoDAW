package org.jcmg.java.interfaces;

import java.util.List;
import org.jcmg.hibernate.entities.Message;
import org.jcmg.hibernate.entities.User;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface UserBLL extends GenericBLL<User> {

    public User getValidUserPassword(User entity);
    
    public List<Message> getMessagesForUser (User entity, Boolean includeRead);
 
    public List<User> findByType(Character type);

    public User getByMail(User user);
}
