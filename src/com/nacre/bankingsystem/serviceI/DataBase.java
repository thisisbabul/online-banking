package com.nacre.bankingsystem.serviceI;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBase {
	protected Connection connection;
	protected Statement statment;
	protected ResultSet rs;
	public DataBase(){
		//System.out.println("I love coding");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try{
				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem_db","root","");
			    statment=connection.createStatement();
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

}
}
