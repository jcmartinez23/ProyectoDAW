package org.jcmg.java.DAO;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.hibernate.transform.ResultTransformer;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.interfaces.CompanyDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class CompanyDAOImpl extends GenericDAOImpl<Company, String> implements CompanyDAO {

    @Override
    public Company findByCoordinator(User coordinator) {
        Company company = new Company();
        Session session = HibernateUtil.getSession();
        Query query = session.createQuery("from Company where coordinator = :coordinator");
        query.setParameter("coordinator", coordinator.getUserId());

        company = (Company) query.uniqueResult();

        return company;
    }

    @Override
    public Company findByCIF(Company entity) {
        Company company = new Company();
        Session session = HibernateUtil.getSession();
        Criteria criteria = session.createCriteria(Company.class);
        criteria.add(Restrictions.eq("cif", entity.getCif()));        
        criteria.createCriteria("user", JoinType.INNER_JOIN);

        company = (Company) criteria.uniqueResult();

        return company;
    }

    @Override
    public List<Company> findAllWithStudents(Class<Company> aClass) {
        Session hibernateSession = this.getSession();
        List<Company> companies = new ArrayList<>();
        Criteria criteria = hibernateSession.createCriteria(aClass);
        criteria.setFetchMode("students", FetchMode.JOIN);
        criteria.setResultTransformer(criteria.DISTINCT_ROOT_ENTITY);
        companies = criteria.list();
        return companies;
    }

}
