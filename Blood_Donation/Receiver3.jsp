<%-- 
    Document   : Receiver3
    Created on : 11 Oct, 2024, 7:03:07 AM
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
       <%
          
           String x=request.getParameter("pass");
         
           PreparedStatement ps=null;

 try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms","root","");

 String driver = "com.mysql.jdbc.Driver";
           String connectionUrl="jdbc:mysql://localhost:3306/dbms";
           String userid = "root";
           String password = "";
    try {
            Class.forName(driver);
         } catch (ClassNotFoundException e) {
        out.print(e);
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
       
        try
        {
        connection = DriverManager.getConnection(connectionUrl, userid, password);
        statement=connection.createStatement();
        String sql ="select * from blood";
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
            String u1=resultSet.getString("Name");
            String p1=resultSet.getString("Blood");
            String i=resultSet.getString("Location");
            String n=resultSet.getString("Number");
            String email=resultSet.getString("Email");
          
            if(x.equals(u1))
        
           %>
           
           <h1>Hello,😍</h1>
           Employee name:<%=u1%><br><br>
           Employee ID:<%=p1%><br><br>
           Mobile:<%=i%><br><br>
           E-mail:<%=n%><br><br>
           Username:<%=email%><br><br>
          
           
           
           
        <% 
            break;}
         connection.close();
        } 
catch (Exception e) {
        out.print(e);
        }
        %>
        <a href="index.html">Go to Home Page</a></center>
    </body>
</html>
