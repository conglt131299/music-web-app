<%-- 
    Document   : audioChartPagination
    Created on : Jul 19, 2019, 5:22:13 PM
    Author     : Cong Le
--%>

<%@page import="model.Song"%>
<%@page import="model.Artist"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.ArtistDAO"%>
<%@page import="dal.SongDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            SongDAO songDAO = new SongDAO();
            ArtistDAO artistDAO = new ArtistDAO();
            String pageNumber = request.getParameter("pageNumber");

            if (pageNumber == null || pageNumber.equals("")) {
                pageNumber = "1";
            }
            int pageindex = Integer.parseInt(pageNumber);
            int pagesize = 10;

            int totalRows = songDAO.count();
            int totalpage = (totalRows + pagesize - 1) / pagesize;
            request.setAttribute("pageindex", pageindex);
            request.setAttribute("pagesize", pagesize);
            request.setAttribute("totalpage", totalpage);

            ArrayList<Artist> artists = artistDAO.getAllArtist();
            ArrayList<Song> songs = songDAO.getSongByRank(pagesize, pageindex);
            request.setAttribute("songs", songs);
            request.setAttribute("artists", artists);
        %>
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
    </body>
</html>
