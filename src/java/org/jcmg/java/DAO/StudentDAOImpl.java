package org.jcmg.java.DAO;

import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Group;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.java.interfaces.StudentDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class StudentDAOImpl extends GenericDAOImpl<Student, Integer> implements StudentDAO {

    @Override
    public Student find(Student entity) {
        Session session = HibernateUtil.getSession();
        Student student = new Student();

        Criteria criteria = session.createCriteria(Student.class);
        criteria.add(Restrictions.eq("userId", entity.getUser().getUserId()));
        criteria.createCriteria("user", JoinType.INNER_JOIN);
        criteria.createCriteria("company", JoinType.INNER_JOIN);
        criteria.createCriteria("group", JoinType.INNER_JOIN);

        student = (Student) criteria.uniqueResult();

        return student;
    }

    @Override
    public List<Student> listByCompany(Company company) {
        Session session = HibernateUtil.getSession();
        //Query query = session.createQuery("from Student s inner join s.user u");
        Criteria criteriaStudent = session.createCriteria(Student.class);
        criteriaStudent.add(Restrictions.eq("company", company));
        criteriaStudent.createCriteria("group", JoinType.LEFT_OUTER_JOIN);
        criteriaStudent.createCriteria("user", JoinType.INNER_JOIN);
        criteriaStudent.setFetchMode("nonAttendances", FetchMode.JOIN);
        criteriaStudent.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        //criteriaStudent.setMaxResults(1);
        //criteriaStudent.setFirstResult(0);
        List<Student> students = criteriaStudent.list();
        return students;
    }

    @Override
    public List<Student> listByGroup(Group group) {
        Session session = HibernateUtil.getSession();
        Criteria criteriaStudent = session.createCriteria(Student.class);
        criteriaStudent.add(Restrictions.eq("group", group));
        criteriaStudent.createCriteria("group", JoinType.LEFT_OUTER_JOIN);
        criteriaStudent.createCriteria("user", JoinType.INNER_JOIN);
        criteriaStudent.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        List<Student> students = criteriaStudent.list();
        return students;
    }

    @Override
    public void update(Student entity) {
        Session hibernateSession = this.getSession();
        hibernateSession.update(entity);
    }

    @Override
    public List<Student> getByNonAttendanceMonth(Date parsedDate) {
        Session session = HibernateUtil.getSession();        
        //Query query = session.createQuery("from Student s inner join s.user u");
        Criteria criteriaStudent = session.createCriteria(Student.class);
        //criteriaStudent.add(null)
        criteriaStudent.createCriteria("group", JoinType.LEFT_OUTER_JOIN);
        criteriaStudent.createCriteria("user", JoinType.INNER_JOIN);
        criteriaStudent.setFetchMode("nonAttendances", FetchMode.JOIN);
        criteriaStudent.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        //criteriaStudent.setMaxResults(1);
        //criteriaStudent.setFirstResult(0);
        List<Student> students = criteriaStudent.list();
        return students;
    }

}
