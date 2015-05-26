package org.jcmg.hibernate.entities;
// Generated May 26, 2015 7:20:29 PM by Hibernate Tools 4.3.1



/**
 * StudentTakesExam generated by hbm2java
 */
public class StudentTakesExam  implements java.io.Serializable {


     private StudentTakesExamId id;
     private Exam exam;
     private Student student;
     private Boolean passed;

    public StudentTakesExam() {
    }

	
    public StudentTakesExam(StudentTakesExamId id, Exam exam, Student student) {
        this.id = id;
        this.exam = exam;
        this.student = student;
    }
    public StudentTakesExam(StudentTakesExamId id, Exam exam, Student student, Boolean passed) {
       this.id = id;
       this.exam = exam;
       this.student = student;
       this.passed = passed;
    }
   
    public StudentTakesExamId getId() {
        return this.id;
    }
    
    public void setId(StudentTakesExamId id) {
        this.id = id;
    }
    public Exam getExam() {
        return this.exam;
    }
    
    public void setExam(Exam exam) {
        this.exam = exam;
    }
    public Student getStudent() {
        return this.student;
    }
    
    public void setStudent(Student student) {
        this.student = student;
    }
    public Boolean getPassed() {
        return this.passed;
    }
    
    public void setPassed(Boolean passed) {
        this.passed = passed;
    }




}


