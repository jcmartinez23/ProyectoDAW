package org.jcmg.java.interfaces;

import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.User;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface CompanyBLL extends GenericBLL<Company>{
    
    public Company getByCoordinator(User coordinator);
}
