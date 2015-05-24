package org.jcmg.java.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.CompanyBLLImpl;
import org.jcmg.java.interfaces.CompanyBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class CreateStudentCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        User coordinator = (User) request.getSession().getAttribute("user");
        CompanyBLL companyBLL = new CompanyBLLImpl();
        Company company = companyBLL.getByCoordinator(coordinator);
        
        request.getSession().setAttribute("company", company.getCif());
        
        return "createStudentForm.jsp";
    }

}
