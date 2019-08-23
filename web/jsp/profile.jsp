<%-- 
    Document   : profile
    Created on : Jul 15, 2019, 11:28:56 AM
    Author     : Cong Le
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/header.css" />
        <link rel="stylesheet" href="css/footer.css" />
        <style>
            .main_container {
                height: 600px;
                padding-top: 100px;
            }
            
            table {
                border-radius: 1em;
                width: 700px;
                height: 400px;
                background-color: white;
            }
            
            table td {
                
            }
            
            body {
                background-image: url('img/bg_top.jpg');
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <jsp:directive.include file="header.jsp" />
        <%
            User user = (User) session.getAttribute("user");
        %>
        <div>

            <div class="main_container" align="center">
                <table>
                    <tr>
                        <td align="center" rowspan="4"><img src="img/img_profile.png" width="300px" height="300px"></td>
                        <td><h4>Name: <%=user.getName()%></h4></td>
                    </tr>
                    <tr>
                        <td><h4>Email: <%=user.getEmail()%></h4></td>
                    </tr>
                    <tr>
                        <td><h4>Gender: <%=user.getGender()%></h4></td>
                    </tr>
                    <tr>
                        <td><h4>Date of Birth: <%=user.getDateOfBirth()%></h4></td>
                    </tr>
                </table>
            </div>
        </div>
        
        
        
        <jsp:directive.include file="footer.jsp" />
    </body>
</html>
