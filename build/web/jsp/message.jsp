<%-- 
    Document   : message
    Created on : Jul 15, 2019, 5:57:32 AM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/header.css" />
        <link rel="stylesheet" href="css/footer.css" />
    </head>
    <body>
        <jsp:directive.include file="header.jsp" />
        
        <div class="container" align="center" style="height: 500px; padding-top: 200px;">
            <br/>
            <h3>${message}</h3>
            <br/>
        </div>
        
        <jsp:directive.include file="footer.jsp" />
    </body>
</html>
