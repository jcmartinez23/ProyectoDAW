package org.jcmg.java.BLL;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Group;
import org.jcmg.hibernate.entities.Teacher;
import org.jcmg.java.DAO.GroupDAOImpl;
import org.jcmg.java.DAO.HibernateUtil;
import org.jcmg.java.interfaces.GroupBLL;
import org.jcmg.java.interfaces.GroupDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class GroupBLLImpl implements GroupBLL {
    
    GroupDAO groupDAO = new GroupDAOImpl();
    
    @Override
    public void save(Group entity) {
        try {
            HibernateUtil.beginTransaction();
            groupDAO.save(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
            HibernateUtil.rollbackTransaction();
        }
    }

    @Override
    public void update(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Group> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Group find(Group entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Group> listByTeacher(Teacher teacher) {
        List<Group> groups = new ArrayList<>();
        
        try {
            HibernateUtil.beginTransaction();
            groups = groupDAO.listByTeacher(teacher);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
            HibernateUtil.rollbackTransaction();
        }
        
        return groups;
    }

    @Override
    public List<Group> listByCompany(Company company) {
        List<Group> groups = new ArrayList<>();
        
        try {
            HibernateUtil.beginTransaction();
            groups = groupDAO.listByCompany(company);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
            HibernateUtil.rollbackTransaction();
        }
        
        return groups;
    }

}
