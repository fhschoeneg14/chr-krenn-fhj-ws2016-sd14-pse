package at.fhj.swd14.pse.like;

import java.io.Serializable;

import at.fhj.swd14.pse.message.MessageDto;
import at.fhj.swd14.pse.user.UserDto;
/**
 * Data transfer object for a like of a message.
 * @author Thomas
 *
 */
public class MessageLikeDto implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private UserDto liker;
    private MessageDto likedMessage;
    /**
     * Construct a new like for a message.
     * @param liker The user, who likes the message.
     * @param message The message, which is liked.
     */
    public MessageLikeDto(UserDto liker,MessageDto message) {
    	this.liker = liker;
    	this.likedMessage = message;
    }
    
    /**
     * Returns the liker of a message.
     * @return The liker of a message.
     */
    public UserDto getLiker() {
		return this.liker;
	}
    /**
     * Sets the liker of a message.
     * @param user The user who likes the message.
     */
    public void setLiker(UserDto user) {
    	this.liker = user;   	
    }
    /**
     * Returns the liked message.
     * @return The liked message.
     */
    public MessageDto getLikedMessage() {
    	return this.likedMessage;
    }
    /**
     * Sets the liked message.
     * @param message The liked message.
     */
    public void setLikedMessage(MessageDto message) {
    	this.likedMessage = message;
    }
    @Override
    public String toString() {
    	StringBuffer sb = new StringBuffer();
    	sb.append("MessageLikeDto");
    	sb.append("   user: " + this.liker.getId());
    	sb.append("   message: " + this.likedMessage.getId());
    	    	
    	return sb.toString();
    }
}
