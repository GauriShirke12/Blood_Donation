
<%-- 
    Document   : Receiver
    Created on : 11 Oct, 2024, 6:15:48 AM
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*"%>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
        }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
        }
        th {
            background-color: red;
            color: white;
            padding: 10px;
        }
        td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            text-decoration: none;
            color: blue;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <center>
        <h2>Blood Donor List</h2>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Blood</th>
                    <th>Location</th>
                    <th>Number</th>
                    <th>Email</th>
                    
                </tr>
            </thead>
            <tbody>
                <%  
                    try {
                        String c = request.getParameter("blood-group");
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", "root", "");
                        Statement st = con.createStatement();
                        String sql = "SELECT * FROM blood";
                        ResultSet rs = st.executeQuery(sql);

                        boolean validResponse = false;

                        while (rs.next()) {
                            String u1 = rs.getString("Name");
                            String p1 = rs.getString("Blood");
                            String i = rs.getString("Location");
                            String email = rs.getString("Email");
                            String num= rs.getString("Number");
                            
                            if (p1.equalsIgnoreCase(c)) {
                                validResponse = true;
                                %>
                                <tr>
                                    <td><%= u1 %></td>
                                    <td><%= p1%></td>
                                    <td><%=i%></td>
                                    <td><%=num%></td>
                                    <td><%=email%></td>
                                </tr>
                                <%
                                session.setAttribute("user", u1);
                                session.setAttribute("pass", p1);
                                session.setAttribute("id1", i);
                                session.setAttribute("em", email);
                            }
                        }
                        
                        if (!validResponse) {
                            out.print("<tr><td colspan='3'>No valid entries found for the selected blood group.</td></tr>");
                        }

                        con.close();
                    } catch (Exception e) {
                        out.print("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </center>
</body>
</html>
