<%-- 
    Document   : audioChart
    Created on : Jul 19, 2019, 1:53:44 PM
    Author     : Cong Le
--%>

<%@page import="util.HtmlHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Audio Chart</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/header.css" />
        <link rel="stylesheet" href="css/footer.css" />
        <link rel="stylesheet" href="css/audioChart.css" />
        
        <script>
            $(document).ready(function(){
                $(".page-item").click(function(){
                    $(".page-item").removeClass("active");
                    $(this).addClass("active");
                    var value = $(this).text();
                    $.get("jsp/audioChartPagination.jsp", {pageNumber:value}, function(data){
                     $("#audioChart").html(data);
                    });
                });
            });
        </script>
    </head>
    <body>
        <%
            int pageindex = (Integer) request.getAttribute("pageindex");
            int totalpage = (Integer) request.getAttribute("totalpage");
        %>
        <jsp:directive.include file="header.jsp" />

        <div class="container">
            
            <h1>Bảng xếp hạng</h1><br/>
            <div id="audioChart">
                <table id="chart_table" border="0">
                    <tr>
                        <th class="rank">Rank</th>
                        <th class="song">Song Name</th>
                        <th class="view">Views</th>
                    </tr>
                    <c:forEach items="${requestScope.songs}" var="i" varStatus="loop">
                        <c:forEach items="${sessionScope.artists}" var="j" varStatus="loop">
                            <c:if test="${i.artist_id eq j.id}">
                                <tr>
                                    <td class="rank">${i.rank}</td>
                                    <td class="song"><a style="text-decoration: none;" href="/MusicWeb/audio?id=${i.id}&artist_id=${j.id}">${i.name} - ${j.name}</a></td>
                                    <td class="view">${i.view_count} lượt xem</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </table>
            </div>
            
                <br/>
            <ul class="pagination justify-content-center">
                <%=HtmlHelper.pager(pageindex, 3, totalpage) %>
            </ul>   
        </div>
        
        <jsp:directive.include file="footer.jsp" />
    </body>
</html>
