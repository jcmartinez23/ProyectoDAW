package org.jcmg.java.BLL;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.jcmg.hibernate.entities.NonAttendance;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.java.DAO.HibernateUtil;
import org.jcmg.java.DAO.NonAttendanceDAOImpl;
import org.jcmg.java.interfaces.NonAttendanceBLL;
import org.jcmg.java.interfaces.NonAttendanceDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class NonAttendanceBLLImpl implements NonAttendanceBLL{
    
    NonAttendanceDAO nonAttendanceDAO = new NonAttendanceDAOImpl();

    @Override
    public List<NonAttendance> listByStudent(Student student, Boolean selectJustified) {
        List<NonAttendance> nonAttendances = new ArrayList<>();
        
        try {
            HibernateUtil.beginTransaction();
            nonAttendances = nonAttendanceDAO.listByStudent(student, selectJustified);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        }
        
        return nonAttendances;
    }

    @Override
    public void save(NonAttendance entity) {
        try {
            HibernateUtil.beginTransaction();
            nonAttendanceDAO.save(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        }
    }

    @Override
    public void update(NonAttendance entity) {
        try {
            HibernateUtil.beginTransaction();
            nonAttendanceDAO.update(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        }
    }

    @Override
    public void delete(NonAttendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<NonAttendance> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public NonAttendance find(NonAttendance entity) {
        NonAttendance nonAttendance = new NonAttendance();
        
        try {
            HibernateUtil.beginTransaction();
            nonAttendance = nonAttendanceDAO.findByID(NonAttendance.class, entity.getNonAttendanceId());
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        }
        
        return nonAttendance;
    }

    @Override
    public List<Object[]> getMonths() {
        List<Object[]> monthsWithNonAttendances = new ArrayList<>();
        
        try {
            HibernateUtil.beginTransaction();
            monthsWithNonAttendances = nonAttendanceDAO.getMonths();
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {            
            HibernateUtil.rollbackTransaction();
            throw ex;
        }
        
        return monthsWithNonAttendances;
    }

}
