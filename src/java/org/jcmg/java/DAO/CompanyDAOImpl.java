package org.jcmg.java.DAO;

import org.hibernate.Query;
import org.hibernate.Session;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.interfaces.CompanyDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class CompanyDAOImpl extends GenericDAOImpl<Company, Integer> implements CompanyDAO {

    @Override
    public Company findByCoordinator(User coordinator) {
        Company company = new Company();
        Session session = HibernateUtil.getSession();
        Query query = session.createQuery("from Company where coordinator = :coordinator");
        query.setParameter("coordinator", coordinator.getUserId());
        
        company = (Company) query.uniqueResult();
        
        return company;
    }

}
