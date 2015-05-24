package org.jcmg.java.interfaces;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface GenericDAO<T, ID extends Serializable> {
    public void save(T entity);
 
    public void merge(T entity);
 
    public void delete(T entity);
 
    public List<T> findMany(Query query);    
 
    public List findAll(Class clazz);
 
    public T findByID(Class clazz, Integer id);
}
