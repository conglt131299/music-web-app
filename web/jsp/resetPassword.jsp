<%-- 
    Document   : resetPassword
    Created on : Jul 14, 2019, 8:08:06 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
            
                    .container {
                        height: 500px;
                        padding-top: 110px;
                    }
                    
                    .resetPassword {
                        width: 500px;
                        height: 250px;
                        background-color: white;
                        border-radius: 1em;
                        padding-top: 30px;
                    }
                    
                    table {
                        width: 300px;
                        height: 80px;
                        text-align: center;
                    }
        </style>
    </head>
    <body>
        <jsp:directive.include file="header.jsp" />
        
        <div class="container" align="center">

            <div class="resetPassword">
                <h2>Reset Your Password</h2>
                <p>
                Please enter your login email, we'll send a new random password to your inbox:
                </p>

                <form id="resetForm" action="reset_password" method="post">
                    <table border="1">
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" name="email" id="email" size="25"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <button type="submit">Send me new password</button>
                            </td>
                        </tr>    
                    </table>
                </form>
            </div>
        </div>
        
        <jsp:directive.include file="footer.jsp" />
        
        <script type="text/javascript">
 
            $(document).ready(function() {
                $("#resetForm").validate({
                    rules: {
                        email: {
                            required: true,
                            email: true
                        }      
                    },

                    messages: {
                        email: {
                            required: "Please enter email",
                            email: "Please enter a valid email address"
                        }
                    }
                });

            });
        </script>
    </body>
</html>
