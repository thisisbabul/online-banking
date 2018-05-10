package com.nacre.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
public class DateUtils {
	public static java.sql.Date getSqlDate(String date){
		java.sql.Date sqlDate=null;
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		try{
			Date utilDate =format.parse(date);
			Calendar c=Calendar.getInstance();
			c.setTime(utilDate);
			sqlDate=new java.sql.Date(c.getTimeInMillis());
		}catch(Exception e){}
		return sqlDate;
	}
}
