package org.jcmg.java.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Juan Carlos Martínez García
 */
public class SendMessageCommand extends Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        return "inbox.jsp";
    }
    
}
