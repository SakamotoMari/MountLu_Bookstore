package org;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent; 
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener{

	 public static Map<String,HttpSession> session_map=new HashMap<String,HttpSession>();
	 
	 //create a session
	 public void sessionCreated(HttpSessionEvent sessionEvent){
		 String session_id=sessionEvent.getSession().getId();
		 System.out.println("已创建一个Session，id为 "+session_id);
		 session_map.put(session_id, sessionEvent.getSession());
	 }
	 
	 //destroy a session
	 public void sessionDestroyed(HttpSessionEvent sessionEvent){
		 session_map.remove(sessionEvent.getSession());
	 }
	 
	 //get a session
	 public static HttpSession getSessionById(String session_id){
		 return session_map.get(session_id);
	}
	 
	 //remove a session
	 public static void removeSessionById(String session_id){
		 session_map.remove(session_id);
	 }
}
