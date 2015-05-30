package org.jcmg.java.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Group;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.CompanyBLLImpl;
import org.jcmg.java.BLL.GroupBLLImpl;
import org.jcmg.java.BLL.StudentBLLImpl;
import org.jcmg.java.BLL.UserBLLImpl;
import org.jcmg.java.interfaces.CompanyBLL;
import org.jcmg.java.interfaces.GroupBLL;
import org.jcmg.java.interfaces.StudentBLL;
import org.jcmg.java.interfaces.UserBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class UpdateStudentGroupCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        StudentBLL studentBLL = new StudentBLLImpl();
        UserBLL userBLL = new UserBLLImpl();
        User coordinator = (User) request.getSession().getAttribute("user");

        CompanyBLL companyBLL = new CompanyBLLImpl();
        Company company = companyBLL.getByCoordinator(coordinator);

        User user = userBLL.find(new User(request.getParameter("mail")));
        
        Student studentQuery = new Student(company, user);
        Student student = studentBLL.find(studentQuery);
        
        Group groupQuery = new Group();
        groupQuery.setGroupId(Integer.valueOf(request.getParameter("group")));
        GroupBLL groupBLL = new GroupBLLImpl();        
        Group updatedGroup = groupBLL.find(groupQuery);
        
        student.setGroup(updatedGroup);
        
        studentBLL.update(student);
        // BUSCAR GRUPO POR CODIGO!!!!!

        return "profile.jsp";
    }

}
