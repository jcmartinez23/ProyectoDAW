package org.jcmg.java.interfaces;

import java.util.List;
import org.jcmg.hibernate.entities.NonAttendance;
import org.jcmg.hibernate.entities.Student;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface NonAttendanceDAO extends GenericDAO<NonAttendance, Integer>{

    public List<NonAttendance> listByStudent(Student student, Boolean selectJustified);       

    public void update(NonAttendance entity);
}
