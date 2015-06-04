package org.jcmg.java.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class NewMessageCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String userToSend = request.getParameter("mail");
        
        if (userToSend != null || userToSend != "") {
            request.setAttribute("userToSend", userToSend);
        }
        
        return "newMessage.jsp";
    }

}
