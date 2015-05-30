package org.jcmg.java.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.NonAttendance;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.NonAttendanceBLLImpl;
import org.jcmg.java.BLL.StudentBLLImpl;
import org.jcmg.java.BLL.UserBLLImpl;
import org.jcmg.java.interfaces.NonAttendanceBLL;
import org.jcmg.java.interfaces.StudentBLL;
import org.jcmg.java.interfaces.UserBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class StudentAssistanceCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        Integer studentId = Integer.valueOf(request.getParameter("studentid"));
        
        StudentBLL studentBLL = new StudentBLLImpl();
                
        User studentUser = new User();
        studentUser.setUserId(studentId);               
        
        Student student = studentBLL.find(new Student(null, studentUser));
        
        NonAttendanceBLL nonAttendanceBLL = new NonAttendanceBLLImpl();
        List<NonAttendance> justifiedNonAttendances = nonAttendanceBLL.listByStudent(student, Boolean.TRUE);
        List<NonAttendance> notJustifiedNonAttendances = nonAttendanceBLL.listByStudent(student, Boolean.FALSE);
        
        request.setAttribute("justifiedNonAttendances", justifiedNonAttendances);
        request.setAttribute("notJustifiedNonAttendances", notJustifiedNonAttendances);
        
        return "assistanceControl.jsp";
    }

}
