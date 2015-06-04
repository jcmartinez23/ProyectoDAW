package org.jcmg.java.command;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jcmg.hibernate.entities.Message;
import org.jcmg.hibernate.entities.User;
import org.jcmg.java.BLL.MessageBLLImpl;
import org.jcmg.java.BLL.UserBLLImpl;
import org.jcmg.java.interfaces.MessageBLL;
import org.jcmg.java.interfaces.UserBLL;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class SendMessageCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        Message message = new Message();

        // Sender
        User sender = (User) request.getSession().getAttribute("user");
        message.setUserBySender(sender);

        // Reciever
        UserBLL userBLL = new UserBLLImpl();
        User reciever = userBLL.getByMail(new User(request.getParameter("reciever")));

        MessageBLL messageBLL = new MessageBLLImpl();        
        if (reciever != null) {
            message.setUserByReciever(reciever);
            message.setTitle(request.getParameter("title"));
            message.setBody(request.getParameter("body"));
            message.setReadOk(Boolean.FALSE);
            message.setDate(new java.util.Date(System.currentTimeMillis()));
            messageBLL.save(message);
        }                

        return "inbox.jsp";
    }

}
