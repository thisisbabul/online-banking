package com.nacre.util;

public class PasswordUtils {
	public static String getPassword(){
		String password="";
		int i=0;
		while(true){
			int ch=(int)(Math.round(Math.random()*100)+22);
			if((ch>=48 && ch<=57) || (ch>=65 && ch<=90) || (ch>=97)){
				char c=(char)ch;
				password=password+c;
				i++;
				if(i==10)
					break;
			}
		}
		return password;
	}
	
}
