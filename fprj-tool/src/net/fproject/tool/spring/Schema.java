package net.fproject.tool.spring;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class Schema {
	public Statement statement;
	public String name;	 
	public Schema(){
		//Default constructor
	}
	
	public Schema(Statement statement, String name){
		this.statement = statement;
		this.name = name;
	}
	
	public ResultSet executeQuery(String sql) throws SQLException{
		return statement.executeQuery(sql);
	}
	
	public int executeUpdate(String sql) throws SQLException{
		return statement.executeUpdate(sql);
	}
}
