package org.jcmg.java.interfaces;

import java.util.List;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Group;
import org.jcmg.hibernate.entities.Student;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface StudentDAO extends GenericDAO<Student, Integer> {
    
    public List<Student> listByCompany(Company company);
    
    public List<Student> listByGroup(Group group);
}
