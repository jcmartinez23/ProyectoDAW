package org.jcmg.java.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Group;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.java.BLL.StudentBLLImpl;
import org.jcmg.java.interfaces.StudentBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class GetUsersGroupCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        Group group = (Group) request.getSession().getAttribute("myGroup");
        
        StudentBLL studentBLL = new StudentBLLImpl();
        List<Student> students = studentBLL.listByGroup(group);
        
        request.getSession().setAttribute("groupStudents", students);
        
        return "listUsersGroup.jsp";
    }

}
