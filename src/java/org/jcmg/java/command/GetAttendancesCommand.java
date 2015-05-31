package org.jcmg.java.command;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.NonAttendance;
import org.jcmg.java.BLL.NonAttendanceBLLImpl;
import org.jcmg.java.interfaces.NonAttendanceBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class GetAttendancesCommand extends Command {

    NonAttendanceBLL nonAttendanceBLL = new NonAttendanceBLLImpl();

    @Override
    public void init(HttpServletRequest request, HttpServletResponse response) {
        List<Object[]> distinctMonths = new ArrayList<>();
        distinctMonths = nonAttendanceBLL.getMonths();

        request.getSession().setAttribute("months", distinctMonths);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        return "assistanceReport.jsp";
    }

}
