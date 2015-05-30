package org.jcmg.java.DAO;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.jcmg.hibernate.entities.NonAttendance;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.java.interfaces.NonAttendanceDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class NonAttendanceDAOImpl extends GenericDAOImpl<NonAttendance, Integer> implements NonAttendanceDAO{

    @Override
    public List<NonAttendance> listByStudent(Student student, Boolean areJustified) {
        List<NonAttendance> nonAttendances = new ArrayList<>();
        
        Session session = HibernateUtil.getSession();
        Criteria criteria = session.createCriteria(NonAttendance.class);
        criteria.add(Restrictions.eq("proof", areJustified));        
        criteria.add(Restrictions.eq("student", student));
        
        nonAttendances = criteria.list();
        
        return nonAttendances;
    }   
}
