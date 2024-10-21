<%-- 
    Document   : yourDetail
    Created on : 15 Feb, 2024, 12:45:16 AM
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>happy</title>
        <style>
            body{
                background-image:url("https://dm0qx8t0i9gc9.cloudfront.net/thumbnails/video/PDaTSuJ/videoblocks-plexus-white-abstract-network-technology-business-science-background-loop_bv-9ohwt4_thumbnail-1080_01.png");
            }
        </style>
    </head>
    <body>
        <center>
            <% 
                String pass = (String) session.getAttribute("pass");

                String driver = "com.mysql.jdbc.Driver";
                String connectionUrl = "jdbc:mysql://localhost:3306/dbms";
                String userid = "root";
                String password = "";

                try {
                    Class.forName(driver);
                } catch (ClassNotFoundException e) {
                    out.print(e);
                }

                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;

                try {
                    connection = DriverManager.getConnection(connectionUrl, userid, password);
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM blood";
                    rs = statement.executeQuery(sql);

                    boolean found = false;
                    while (rs.next()) {
                        String u1 = rs.getString("Name");
                        String up = rs.getString("Blood");
                        String i = rs.getString("Location");
                        String nj = rs.getString("Number");
                        String email = rs.getString("Email");

                        if (pass.equals(u1)) {
                            found = true;
            %>
                            <h1>Hello, <%= u1 %>😍</h1>
                            Name: <%= up %><br><br>
                            Location: <%= i %><br><br>
                            Mobile: <%= nj %><br><br>
                            E-mail: <%= email %><br><br>
            <% 
                            break;
                        }
                    }
                    if (!found) {
                        out.print("Enter valid response");
                    }
                    connection.close();
                } catch (Exception e) {
                    out.print(e);
                }
            %>
            <a href="index.html">Go to Home Page</a>
        </center>
    </body>
</html>
