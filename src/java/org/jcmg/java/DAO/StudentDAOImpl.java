package org.jcmg.java.DAO;

import java.util.List;
import javax.el.Expression;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.java.interfaces.StudentDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class StudentDAOImpl extends GenericDAOImpl<Student, Integer> implements StudentDAO {

    @Override
    public List<Student> listByCompany(Company company) {        
        Session session = HibernateUtil.getSession();
        //Query query = session.createQuery("from Student s inner join s.user u");
        Criteria criteriaStudent = session.createCriteria(Student.class);
        criteriaStudent.add(Restrictions.eq("company", company));
        criteriaStudent.createCriteria("group", JoinType.LEFT_OUTER_JOIN);        
        criteriaStudent.createCriteria("user", JoinType.INNER_JOIN);        
        List<Student> students = criteriaStudent.list();
        return students;
    }

}
