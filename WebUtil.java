package org;

import  java.util.HashMap; 
import java.util.Map; 


import javax.servlet.http.Cookie; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

//deal with cookie!
public class WebUtil {
  //add cookie
	public static void addCookie(HttpServletResponse response,String name,String value,int maxAge){
		Cookie cookie=new Cookie(name,value);
		if(maxAge>0)
			cookie.setMaxAge(maxAge);
		//add to client
		response.addCookie(cookie);
	}
	
	//get all cookies
	public static Map<String,Cookie>getAllCookies(HttpServletRequest request){
		Map<String,Cookie>cookie_map=new HashMap<String,Cookie>();
		Cookie[] cookies=request.getCookies();
		
		//if cookie exists,store it to Map
		if(cookies!=null){
			for(int i=0;i<cookies.length;i++){
				cookie_map.put(cookies[i].getName(),cookies[i]);
			}
		}
		return cookie_map;
	}
	
	//get SessionId of Session through cookieName of Cookie
	public static String getSessionIdByNameInCookie(HttpServletRequest request,String name){
		Map<String,Cookie> cookie_map=getAllCookies(request);
		if(cookie_map.containsKey(name)){
			Cookie cookie=cookie_map.get(name);
			return cookie.getValue();
		}
		return null;
		
	}
}
