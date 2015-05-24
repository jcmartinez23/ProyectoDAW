package org.jcmg.java.DAO;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.jcmg.java.interfaces.GenericDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public abstract class GenericDAOImpl<T, ID extends Serializable> implements GenericDAO<T, ID> {

    
    protected Session getSession() {
        return HibernateUtil.getSession();
    }

    @Override
    public void save(T entity) {
        Session hibernateSession = this.getSession();
        hibernateSession.save(entity);        
        //hibernateSession.saveOrUpdate(entity);
    }

    @Override
    public void merge(T entity) {
        Session hibernateSession = this.getSession();
        hibernateSession.merge(entity);
    }

    @Override
    public void delete(T entity) {
        Session hibernateSession = this.getSession();
        hibernateSession.delete(entity);
    }

    @Override
    public List<T> findMany(Query query) {
        List<T> t;
        t = (List<T>) query.list();
        return t;
    }

    @Override
    public T findByID(Class clazz, Integer id) {
        Session hibernateSession = this.getSession();
        T t = null;
        t = (T) hibernateSession.get(clazz, id);
        return t;
    }

    @Override
    public List findAll(Class clazz) {
        Session hibernateSession = this.getSession();
        List T = null;
        Query query = hibernateSession.createQuery("from " + clazz.getName());
        T = query.list();
        return T;
    }
}
