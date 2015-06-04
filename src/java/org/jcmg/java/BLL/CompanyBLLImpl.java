package org.jcmg.java.BLL;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.DAO.CompanyDAOImpl;
import org.jcmg.java.DAO.HibernateUtil;
import org.jcmg.java.interfaces.CompanyBLL;
import org.jcmg.java.interfaces.CompanyDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class CompanyBLLImpl implements CompanyBLL {

    CompanyDAO companyDAO = new CompanyDAOImpl();

    @Override
    public void save(Company entity) {
        try {
            HibernateUtil.beginTransaction();
            companyDAO.save(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        }
    }

    @Override
    public void update(Company entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Company entity) {
        try {
            HibernateUtil.beginTransaction();
            companyDAO.delete(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {            
            HibernateUtil.rollbackTransaction();
            throw ex;
        }
    }

    @Override
    public List<Company> findAll() {
        List<Company> companies = new ArrayList<>();

        try {
            HibernateUtil.beginTransaction();
            companies = companyDAO.findAllWithStudents(Company.class);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {            
            HibernateUtil.rollbackTransaction();
            throw ex;
        }

        return companies;
    }

    @Override
    public Company find(Company entity) {
        Company company = new Company();

        try {
            HibernateUtil.beginTransaction();
            company = companyDAO.findByCIF(entity);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {            
            HibernateUtil.rollbackTransaction();
            throw ex;
        }

        return company;
    }

    @Override
    public Company getByCoordinator(User coordinator) {
        Company company = new Company();

        try {
            HibernateUtil.beginTransaction();
            company = companyDAO.findByCoordinator(coordinator);
            HibernateUtil.commitTransaction();
        } catch (HibernateException ex) {            
            HibernateUtil.rollbackTransaction();
            throw ex;
        }

        return company;
    }

}
