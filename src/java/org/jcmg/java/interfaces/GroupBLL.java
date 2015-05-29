package org.jcmg.java.interfaces;

import java.util.List;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Group;
import org.jcmg.hibernate.entities.Teacher;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface GroupBLL extends GenericBLL<Group>{

    
    public List<Group> listByTeacher(Teacher teacher);

    public List<Group> listByCompany(Company company);
}
