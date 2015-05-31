package org.jcmg.java.interfaces;

import java.util.Date;
import java.util.List;
import org.jcmg.hibernate.entities.NonAttendance;
import org.jcmg.hibernate.entities.Student;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface NonAttendanceBLL extends GenericBLL<NonAttendance> {

    public List<NonAttendance> listByStudent(Student student, Boolean selectJustified);

    public List<Object[]> getMonths();
}
