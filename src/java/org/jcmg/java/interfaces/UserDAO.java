/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.jcmg.java.interfaces;

import java.util.List;
import org.jcmg.hibernate.entities.User;

/**
 *
 * @author juanca
 */
public interface UserDAO extends GenericDAO<User, Integer>{
    
    public User find(User entity);
    
    public List<User> findByType(Character type);

    public void update(User entity);
}
