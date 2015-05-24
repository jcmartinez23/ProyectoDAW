package org.jcmg.java.interfaces;

import java.util.List;
import org.jcmg.hibernate.entities.Exam;
import org.jcmg.hibernate.entities.Student;

/**
 *
 * @author Juan Carlos Martínez García
 */
public interface ExamDAO extends GenericDAO<Exam, Integer>{
    
    public List<Exam> getExams(Student student, Boolean includeOnlyPassed);
}
