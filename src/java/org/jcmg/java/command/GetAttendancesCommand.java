package org.jcmg.java.command;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.NonAttendance;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.CompanyBLLImpl;
import org.jcmg.java.BLL.NonAttendanceBLLImpl;
import org.jcmg.java.BLL.StudentBLLImpl;
import org.jcmg.java.interfaces.CompanyBLL;
import org.jcmg.java.interfaces.NonAttendanceBLL;
import org.jcmg.java.interfaces.StudentBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class GetAttendancesCommand extends Command {

    NonAttendanceBLL nonAttendanceBLL = new NonAttendanceBLLImpl();

    @Override
    public void init(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        User coordinator = (User) request.getSession().getAttribute("user");

        CompanyBLL companyBLL = new CompanyBLLImpl();
        Company company = companyBLL.getByCoordinator(coordinator);
        
        StudentBLL studentBLL = new StudentBLLImpl();
        List<Student> students = studentBLL.listByCompany(company);

        request.getSession().setAttribute("companyStudents", students);
        request.getSession().setAttribute("company", company);
        
        return "assistanceReport.jsp";
    }

}
