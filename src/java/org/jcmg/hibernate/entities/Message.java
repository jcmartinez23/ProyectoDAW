package org.jcmg.hibernate.entities;
// Generated Jun 3, 2015 8:18:55 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Message generated by hbm2java
 */
public class Message  implements java.io.Serializable {


     private Integer messageId;
     private User userByReciever;
     private User userBySender;
     private String title;
     private String body;
     private Date date;
     private Boolean readOk;

    public Message() {
    }

	
    public Message(User userByReciever, User userBySender, String body) {
        this.userByReciever = userByReciever;
        this.userBySender = userBySender;
        this.body = body;
    }
    public Message(User userByReciever, User userBySender, String title, String body, Date date, Boolean readOk) {
       this.userByReciever = userByReciever;
       this.userBySender = userBySender;
       this.title = title;
       this.body = body;
       this.date = date;
       this.readOk = readOk;
    }
   
    public Integer getMessageId() {
        return this.messageId;
    }
    
    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }
    public User getUserByReciever() {
        return this.userByReciever;
    }
    
    public void setUserByReciever(User userByReciever) {
        this.userByReciever = userByReciever;
    }
    public User getUserBySender() {
        return this.userBySender;
    }
    
    public void setUserBySender(User userBySender) {
        this.userBySender = userBySender;
    }
    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    public String getBody() {
        return this.body;
    }
    
    public void setBody(String body) {
        this.body = body;
    }
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    public Boolean getReadOk() {
        return this.readOk;
    }
    
    public void setReadOk(Boolean readOk) {
        this.readOk = readOk;
    }




}


