package org.jcmg.java.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.jcmg.hibernate.entities.NonAttendance;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.java.BLL.NonAttendanceBLLImpl;
import org.jcmg.java.DAO.NonAttendanceDAOImpl;
import org.jcmg.java.interfaces.NonAttendanceBLL;
import org.jcmg.java.interfaces.NonAttendanceDAO;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class AddNonAttendanceCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date nonAttendanceDay;
        Student student = (Student) request.getSession().getAttribute("student");
        
        try {
            // The name of the attribute is category because i run into some problems
            // trying to extend jquery-validation, so i chose a default type that accomplishes
            // the same in this circumstances
            nonAttendanceDay = sdf.parse(request.getParameter("category"));
        } catch (ParseException ex) {
            throw new HibernateException(ex.getMessage());
        }
        
        NonAttendanceBLL nonAttendanceBLL = new NonAttendanceBLLImpl();
        NonAttendance nonAttendance = new NonAttendance(student, Boolean.FALSE, nonAttendanceDay);
        nonAttendanceBLL.save(nonAttendance);
        
        // we get the list of non attendances again
        
        List<NonAttendance> justifiedNonAttendances = nonAttendanceBLL.listByStudent(student, Boolean.TRUE);
        List<NonAttendance> notJustifiedNonAttendances = nonAttendanceBLL.listByStudent(student, Boolean.FALSE);
        
        request.setAttribute("justifiedNonAttendances", justifiedNonAttendances);
        request.setAttribute("notJustifiedNonAttendances", notJustifiedNonAttendances);
        
        return "assistanceControl.jsp";
    }

}
