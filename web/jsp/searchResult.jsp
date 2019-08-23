<%-- 
    Document   : searchResult
    Created on : Jul 17, 2019, 2:02:05 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/searching.css" />
        <script>
            function myFunction() {
                var input, filter, ul, li, a, i, txtValue;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                ul = document.getElementById("myUL");
                li = ul.getElementsByTagName("li");
                if ($("#myInput").val() === "") {
                    for (i = 0; i < li.length; i++) {
                        li[i].style.display = "none";
                    }      
                } else {
                    for (i = 0; i < li.length; i++) {
                        a = li[i].getElementsByTagName("a")[0];
                        txtValue = a.textContent || a.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            li[i].style.display = "block";
                        } else {
                            li[i].style.display = "none";
                        }
                    }      
                }
            }
        </script>
    </head>
    <body>
        <div class="search_result">
            <ul id="myUL">
                <c:forEach items="${sessionScope.songSearch}" var="i" varStatus="loop">
                    <c:forEach items="${sessionScope.artists}" var="j" varStatus="loop">
                        <c:if test="${i.artist_id eq j.id}">
                            <li><a href="/MusicWeb/audio?id=${i.id}&artist_id=${i.artist_id}">${i.name}-${j.name}</a></li>
                        </c:if>
                    </c:forEach>
                </c:forEach>
          </ul>
        </div>
    </body>
</html>
