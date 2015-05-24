package org.jcmg.java.command;

import java.util.ArrayList;
import java.util.List;
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
public class AddCompanyCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        
        // Create the company
        Company company = new Company();
        User coordinator = new User();
        coordinator.setUserId(Integer.parseInt(request.getParameter("coordinator")));
        company.setCif(request.getParameter("cif"));
        company.setName(request.getParameter(("name")));
        company.setUser(coordinator);
        
        CompanyBLL companyBLL = new CompanyBLLImpl();
        companyBLL.save(company);
        
        // Update the list
        List<Company> companies = companyBLL.findAll();
        request.setAttribute("companies", companies);
        
        
        return "companies.jsp";
    }

}
