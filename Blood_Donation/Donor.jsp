<%-- 
    Document   : Donor
    Created on : 10 Oct, 2024, 11:18:30 PM
    Author     : vaish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
       
    
    </head>
    <body>
    
        <%
        String dm=request.getParameter("donorname");
        String gm=request.getParameter("blood-group");
        String location=request.getParameter("loc");
        String num1=request.getParameter("contact");
        String em=request.getParameter("email");
        
try
                {
                    Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms","root","");
            Statement st=con.createStatement();
            String sq="insert into blood(Name,Blood,Location,Number,Email)values('"+dm+"' , '"+gm+"' , '"+location+"' , '"+num1+"' , '"+em+"')";
            st.executeUpdate(sq);
           response.sendRedirect("ThankYou.html");
            con.close();%>
                
                                
                <%
                
               
                }
 catch(Exception e)
                  {
                      out.print(e);
                  }
                
        %>
          
    </body>
</html>
