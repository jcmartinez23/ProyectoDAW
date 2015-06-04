package org.jcmg.java.interfaces;

import java.io.Serializable;
import java.util.List;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.User;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface CompanyDAO extends GenericDAO<Company, String>{
    
    public Company findByCoordinator(User coordinator);
    
    public Company findByCIF(Company entity);

    public List<Company> findAllWithStudents(Class<Company> aClass);
}
