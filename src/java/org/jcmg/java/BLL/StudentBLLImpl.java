package org.jcmg.java.BLL;

//import java.util.ArrayList;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Group;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.DAO.HibernateUtil;
import org.jcmg.java.DAO.StudentDAOImpl;
import org.jcmg.java.DAO.UserDAOImpl;
import org.jcmg.java.interfaces.StudentBLL;
import org.jcmg.java.interfaces.StudentDAO;
import org.jcmg.java.interfaces.UserDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class StudentBLLImpl implements StudentBLL {

    StudentDAO studentDAO = new StudentDAOImpl();
    
    @Override
    public void save(Student entity) {
        try {
            HibernateUtil.beginTransaction();
            studentDAO.save(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;            
        }
    }

    @Override
    public void update(Student entity) {
        try {
            HibernateUtil.beginTransaction();
            studentDAO.update(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;            
        }
    }

    @Override
    public void delete(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Student> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Student find(Student entity) {
        Student student = new Student();        
        
        try {
            HibernateUtil.beginTransaction();
            student = studentDAO.find(entity);                      
            HibernateUtil.commitTransaction();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            HibernateUtil.rollbackTransaction();
            throw e;
        }
        
        return student;
    }

    @Override
    public List<Student> listByCompany(Company company) {
        List<Student> students = new ArrayList<>();
        
        try {
            HibernateUtil.beginTransaction();
            students = studentDAO.listByCompany(company);
            HibernateUtil.commitTransaction();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            HibernateUtil.rollbackTransaction();
            throw e;
        }
        
        return students;
    }

    @Override
    public List<Student> listByGroup(Group group) {
        List<Student> students = new ArrayList<>();
        
        try {
            HibernateUtil.beginTransaction();
            students = studentDAO.listByGroup(group);
            HibernateUtil.commitTransaction();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            HibernateUtil.rollbackTransaction();
            throw e;
        }
        
        return students;
    }

    @Override
    public List<Student> getByNonAttendanceMonth(Date parsedDate) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
