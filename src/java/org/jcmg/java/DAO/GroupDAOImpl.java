package org.jcmg.java.DAO;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Group;
import org.jcmg.hibernate.entities.Teacher;
import org.jcmg.java.interfaces.GroupDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class GroupDAOImpl extends GenericDAOImpl<Group, Integer> implements GroupDAO {

    @Override
    public List<Group> listByTeacher(Teacher teacher) {
        Session session = HibernateUtil.getSession();
        //Query query = session.createQuery("from Student s inner join s.user u");
        Criteria criteriaStudent = session.createCriteria(Group.class);
        criteriaStudent.add(Restrictions.eq("teacher", teacher));        
        List<Group> groups = criteriaStudent.list();
        return groups;
    }

    @Override
    public List<Group> listByCompany(Company company) {
        Session session = HibernateUtil.getSession();
        //Query query = session.createQuery("from Student s inner join s.user u");
        Criteria criteriaStudent = session.createCriteria(Group.class);
        criteriaStudent.add(Restrictions.eq("company", company));        
        List<Group> groups = criteriaStudent.list();
        return groups;
    }

}
