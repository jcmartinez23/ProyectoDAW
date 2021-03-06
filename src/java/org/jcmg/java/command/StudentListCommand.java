package org.jcmg.java.command;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Group;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.hibernate.entities.Teacher;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.CompanyBLLImpl;
import org.jcmg.java.BLL.GroupBLLImpl;
import org.jcmg.java.BLL.StudentBLLImpl;
import org.jcmg.java.interfaces.CompanyBLL;
import org.jcmg.java.interfaces.GroupBLL;
import org.jcmg.java.interfaces.StudentBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class StudentListCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        StudentBLL studentBLL = new StudentBLLImpl();
        GroupBLL groupBLL = new GroupBLLImpl();
        User user = (User) request.getSession().getAttribute("user");
        List<Student> students = new ArrayList<>();

        if (user.getUserType() == 'C') {
            CompanyBLL companyBLL = new CompanyBLLImpl();
            Company company = companyBLL.getByCoordinator(user);
            students = studentBLL.listByCompany(company);
            
            List<Group> groups = groupBLL.listByCompany(company);
            request.getSession().setAttribute("groups", groups);
                
        } else if (user.getUserType() == 'P') {            
            Teacher teacher = new Teacher(user.getUserId());
            List<Group> groups = groupBLL.listByTeacher(teacher);            
            for(Group group : groups) {
                List<Student> groupStudents = studentBLL.listByGroup(group);
                students.addAll(groupStudents);
            }
            
            request.getSession().setAttribute("groups", groups);
        }        
        
        request.getSession().setAttribute("students", students);

        return "studentList.jsp";
    }

}
