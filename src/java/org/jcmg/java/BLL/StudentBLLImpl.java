package org.jcmg.java.BLL;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.java.DAO.HibernateUtil;
import org.jcmg.java.DAO.StudentDAOImpl;
import org.jcmg.java.interfaces.StudentBLL;
import org.jcmg.java.interfaces.StudentDAO;

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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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

}
