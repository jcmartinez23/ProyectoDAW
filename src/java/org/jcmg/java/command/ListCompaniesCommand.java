package org.jcmg.java.command;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.CompanyBLLImpl;
import org.jcmg.java.BLL.UserBLLImpl;
import org.jcmg.java.interfaces.CompanyBLL;
import org.jcmg.java.interfaces.UserBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class ListCompaniesCommand extends Command{
    
    @Override
    public void init(HttpServletRequest request, HttpServletResponse response) {
        
        // get all coordinators
        UserBLL userBLL = new UserBLLImpl();
        List<User> users = userBLL.findByType('C');
        request.getSession().setAttribute("coordinators", users);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        
        // we get all companies for the portlet
        List<Company> companies = new ArrayList<>();
        CompanyBLL companyBLL = new CompanyBLLImpl();
        
        companies = companyBLL.findAll();
        request.setAttribute("companies", companies);               
        
        return "companies.jsp";
    }

}
