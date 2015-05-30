package org.jcmg.java.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.NonAttendance;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.NonAttendanceBLLImpl;
import org.jcmg.java.BLL.StudentBLLImpl;
import org.jcmg.java.interfaces.NonAttendanceBLL;
import org.jcmg.java.interfaces.StudentBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class JustifyNonAttendanceCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        Student student = (Student) request.getSession().getAttribute("student");
        Integer nonAttendanceId = Integer.valueOf(request.getParameter("nonAttendanceId"));

        NonAttendanceBLL nonAttendanceBLL = new NonAttendanceBLLImpl();
        NonAttendance nonAttendanceQuery = new NonAttendance();
        nonAttendanceQuery.setNonAttendanceId(nonAttendanceId);

        NonAttendance nonAttendance = nonAttendanceBLL.find(nonAttendanceQuery);
        nonAttendance.setProof(true);

        nonAttendanceBLL.update(nonAttendance);                

        List<NonAttendance> justifiedNonAttendances = nonAttendanceBLL.listByStudent(student, Boolean.TRUE);
        List<NonAttendance> notJustifiedNonAttendances = nonAttendanceBLL.listByStudent(student, Boolean.FALSE);

        request.getSession().setAttribute("student", student);
        request.setAttribute("justifiedNonAttendances", justifiedNonAttendances);
        request.setAttribute("notJustifiedNonAttendances", notJustifiedNonAttendances);

        return "assistanceControl.jsp";        
    }

}
