package org.jcmg.java.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.StudentBLLImpl;
import org.jcmg.java.BLL.UserBLLImpl;
import org.jcmg.java.interfaces.StudentBLL;
import org.jcmg.java.interfaces.UserBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class AddStudentCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        
        // we save the generic user
        User newUser = new User();
        newUser.setMail(request.getParameter("mail"));
        newUser.setFirstName(request.getParameter("firstName"));
        newUser.setLastName(request.getParameter("lastName"));
        newUser.setPhone(request.getParameter("phone"));
        newUser.setUserType('E');
        
        String passwordRandom = Long.toHexString(Double.doubleToLongBits(Math.random()));
        newUser.setPassword(passwordRandom);
        
        UserBLL userBLL = new UserBLLImpl();
        userBLL.save(newUser);
        
        // we save the specific student                
        Student student = new Student();        
        User studentUser = userBLL.getByMail(new User(newUser.getMail()));
        student.setUser(studentUser);
        student.setCompany(new Company(request.getParameter("company")));
        
        StudentBLL studentBLL = new StudentBLLImpl();
        studentBLL.save(student);
        
        return "profile.jsp";
    }

}
