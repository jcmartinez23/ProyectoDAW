package org.jcmg.java.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Company;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.CompanyBLLImpl;
import org.jcmg.java.BLL.StudentBLLImpl;
import org.jcmg.java.BLL.UserBLLImpl;
import org.jcmg.java.interfaces.CompanyBLL;
import org.jcmg.java.interfaces.StudentBLL;
import org.jcmg.java.interfaces.UserBLL;

/**
 *
 * @author juanca
 */
@WebServlet("/AJAXLogIn")
public class AJAXLogIn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, Object> map = new HashMap<>();
        boolean isLoginValid = false;
        UserBLL userBLL = new UserBLLImpl();                
        String mail = request.getParameter("username");
        String password = request.getParameter("password");
        User entity = new User(mail, password);
        
        User user = null;
        try {
            user = userBLL.getValidUserPassword(entity);
        } catch (Exception ex) {
            user = null;
        }

        if (user != null) {
            isLoginValid = true;
            map.put("mail", mail);
            map.put("password", password);
            request.getSession().setAttribute("user", user);
            
            String menu = "";
            switch(user.getUserType()) {
                case 'P':
                    menu = "teacher-menu.jsp";
                    break;
                case 'C':
                    menu = "coordinator-menu.jsp";
                    break;
                case 'A':
                    menu = "menu_admin.jsp";
                    break;
                case 'E':
                    Student student = new Student();
                    student.setUser(user);
                    StudentBLL studentBLL = new StudentBLLImpl();
                    Student foundStudent = studentBLL.find(student);
                    Company companyQuery = foundStudent.getCompany();
                    
                    CompanyBLL companyBLL = new CompanyBLLImpl();
                    Company company = companyBLL.find(companyQuery);
                    User coordinator = userBLL.find(company.getUser());
                    
                    request.getSession().setAttribute("myGroup", foundStudent.getGroup());
                    request.getSession().setAttribute("myCoordinator", coordinator);
                    
                    menu = "student-menu.jsp";
                    break;
            }
            
            request.getSession().setAttribute("menu", menu);
            
        }
        map.put("validLogin", isLoginValid);
        write(response, map);
    }
    
    private void write(HttpServletResponse response, Map<String, Object> map) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(map));
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
