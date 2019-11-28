<%-- 
    Document   : changePassword
    Created on : Jul 15, 2019, 3:06:39 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/header.css" />
        <link rel="stylesheet" href="css/footer.css" />
        <style>
            body {
                background-image: url('img/bg_top.jpg');
                background-size: cover;
            }

            .main_container {
                height: 500px;
                padding-top: 120px;
            }

            .changePassword {
                width: 500px;
                height: 250px;
                background-color: white;
                border-radius: 1em;
                padding-top: 20px;
            }

            table {
                width: 350px;
                height: 200px;
                border: none;
            }
        </style>
    </head>
    <body>
        <jsp:directive.include file="header.jsp" />

        <div class="main_container" align="center">

            <form class="changePassword" action="change_password" method="POST">
                <table align="center">
                    <tr>
                        <td>
                            Old Password: 
                        </td>
                        <td>
                            <input type="password" name="oldPwd">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            New Password: 
                        </td>
                        <td>
                            <input type="password" name="newPwd">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Re-enter Password: 
                        </td>
                        <td>
                            <input type="password">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Change">
                        </td>
                    </tr>
                    <%
                        if (request.getAttribute("oldPwdStatus") != null && request.getAttribute("oldPwdStatus").equals("false")) {
                    %>
                    <tr>
                        <td colspan="2">
                            <p style="color: red;">* Mật khẩu cũ không chính xác</p>
                        </td>
                    </tr>
                    <% }
                    %>
                </table>                
            </form>
        </div>

        <jsp:directive.include file="footer.jsp" />
    </body>
</html>
