package org.jcmg.java.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Abstract class from which all 'Commands' will inherit
 * 
 * @author Juan Carlos Martínez García
 */
public abstract class Command {

    /**
     *  Ideally, this method will prepare the environment for the page to be
     *  executed fine
     * 
     * @param request
     * @param response
     */
    public void init(HttpServletRequest request, HttpServletResponse response) {
        
    }
    
    /**
     * These method will do the necessary operations and return a page to show
     * the results
     * 
     * @param request
     * @param response
     * @return the view that will show the result of the command
     */
    public abstract String execute(HttpServletRequest request, HttpServletResponse response);
}
