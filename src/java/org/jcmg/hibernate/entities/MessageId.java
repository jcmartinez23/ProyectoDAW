package org.jcmg.hibernate.entities;
// Generated May 22, 2015 8:17:51 PM by Hibernate Tools 4.3.1



/**
 * MessageId generated by hbm2java
 */
public class MessageId  implements java.io.Serializable {


     private int messageId;
     private int sender;
     private int reciever;

    public MessageId() {
    }

    public MessageId(int messageId, int sender, int reciever) {
       this.messageId = messageId;
       this.sender = sender;
       this.reciever = reciever;
    }
   
    public int getMessageId() {
        return this.messageId;
    }
    
    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }
    public int getSender() {
        return this.sender;
    }
    
    public void setSender(int sender) {
        this.sender = sender;
    }
    public int getReciever() {
        return this.reciever;
    }
    
    public void setReciever(int reciever) {
        this.reciever = reciever;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof MessageId) ) return false;
		 MessageId castOther = ( MessageId ) other; 
         
		 return (this.getMessageId()==castOther.getMessageId())
 && (this.getSender()==castOther.getSender())
 && (this.getReciever()==castOther.getReciever());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getMessageId();
         result = 37 * result + this.getSender();
         result = 37 * result + this.getReciever();
         return result;
   }   


}

