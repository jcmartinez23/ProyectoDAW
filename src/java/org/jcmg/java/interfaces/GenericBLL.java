package org.jcmg.java.interfaces;

import java.util.List;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface GenericBLL<T> {

    public void save(T entity);

    public void update(T entity);

    public void delete(T entity);

    public List<T> findAll();       
    
    public T find(T entity);
}
