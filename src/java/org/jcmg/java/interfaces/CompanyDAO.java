package org.jcmg.java.interfaces;

import java.io.Serializable;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.User;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface CompanyDAO extends GenericDAO<Company, Integer>{
    
    public Company findByCoordinator(User coordinator);
}
