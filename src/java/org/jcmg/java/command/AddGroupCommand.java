package org.jcmg.java.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Group;
import org.jcmg.hibernate.entities.Teacher;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.CompanyBLLImpl;
import org.jcmg.java.BLL.GroupBLLImpl;
import org.jcmg.java.BLL.UserBLLImpl;
import org.jcmg.java.interfaces.CompanyBLL;
import org.jcmg.java.interfaces.GroupBLL;
import org.jcmg.java.interfaces.UserBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class AddGroupCommand extends Command {

    @Override
    public void init(HttpServletRequest request, HttpServletResponse response) {
        CompanyBLL companyBLL = new CompanyBLLImpl();
        List<Company> companies = companyBLL.findAll();
        request.setAttribute("companies", companies);
        
        UserBLL userBLL = new UserBLLImpl();                
        List<User> teachers = userBLL.findByType('P');
        request.setAttribute("teachers", teachers);
    }
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        Group group = new Group();
        group.setGroupCode(request.getParameter("code"));
        group.setHoursPerWeek(Integer.parseInt(request.getParameter("hoursPerWeek")));
        group.setTeacher(
            new Teacher(Integer.parseInt(request.getParameter("teacher")))
        );
        group.setCompany(new Company(request.getParameter("company")));
        
        GroupBLL groupBLL = new GroupBLLImpl();
        groupBLL.save(group);
        
        return "profile.jsp";
    }

}
