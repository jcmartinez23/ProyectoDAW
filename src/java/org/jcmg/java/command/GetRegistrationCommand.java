package org.jcmg.java.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.CompanyBLLImpl;
import org.jcmg.java.BLL.StudentBLLImpl;
import org.jcmg.java.interfaces.CompanyBLL;
import org.jcmg.java.interfaces.StudentBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class GetRegistrationCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        User coordinator = (User) request.getSession().getAttribute("user");
        Integer pageNumber = Integer.parseInt(request.getParameter("page"));
        
        CompanyBLL companyBLL = new CompanyBLLImpl();
        Company company = companyBLL.getByCoordinator(coordinator);
        
        StudentBLL studentBLL = new StudentBLLImpl();
        List<Student> allStudents = studentBLL.listByCompany(company);
        request.getSession().setAttribute("studentsExcel", allStudents);
        List<Student> students = studentBLL.listByCompanyPaged(company, pageNumber);
        
        request.getSession().setAttribute("company", company);
        request.getSession().setAttribute("maxPages", (int)Math.ceil(allStudents.size() / 4));
        request.setAttribute("actualPage", pageNumber);
        request.getSession().setAttribute("companyStudents", students);
        
        return "getRegistration.jsp";
    }

}
