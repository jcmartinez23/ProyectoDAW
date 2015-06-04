package org.jcmg.java.interfaces;

import java.util.Date;
import java.util.List;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Group;
import org.jcmg.hibernate.entities.Student;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface StudentBLL extends GenericBLL<Student> {

    public List<Student> listByCompany(Company company);
    
    public List<Student> listByGroup(Group group);

    public List<Student> getByNonAttendanceMonth(Date parsedDate);

    public List<Student> listByCompanyPaged(Company company, Integer pageNumber);
}
