package com.jobportal.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/job_portal_db";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "5252";

    public static Connection getConnection(){
        Connection con = null;
        try{
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        }catch (Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
