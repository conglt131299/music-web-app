<%-- 
    Document   : newSongPagination
    Created on : Jul 16, 2019, 1:17:43 AM
    Author     : Cong Le
--%>

<%@page import="model.Artist"%>
<%@page import="dal.ArtistDAO"%>
<%@page import="model.Song"%>
<%@page import="java.util.ArrayList"%>
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
            ArrayList<Song> songs = songDAO.paging(pagesize, pageindex);
            request.setAttribute("songs", songs);
            request.setAttribute("artists", artists);
        %>

        <div class="col-6">
            <c:forEach items="${requestScope.songs}" var="i" begin="${i}" end="${i+4}" varStatus="loop">
                <div class="song">
                    <div class="img">
                        <a href="/MusicWeb/audio?id=${i.id}&artist_id=${i.artist_id}"><img src="${i.image_link}" width="94px" height="94px"/></a></div>
                    <div class="content">
                        <h5><a href="/MusicWeb/audio?id=${i.id}&artist_id=${i.artist_id}">${i.name}</a></h5>
                            <c:forEach items="${sessionScope.artists}" var="j" varStatus="loop">
                                <c:if test="${i.artist_id eq j.id}">
                                <p><a href="/MusicWeb/audio?id=${i.id}&artist_id=${i.artist_id}">${j.name}</a></p>
                                </c:if>
                            </c:forEach>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="col-6">
            <c:forEach items="${requestScope.songs}" var="i" begin="${i+5}" end="${i+9}" varStatus="loop">
                <div class="song">
                    <div class="img">
                        <a href="/MusicWeb/audio?id=${i.id}&artist_id=${i.artist_id}"><img src="${i.image_link}" width="94px" height="94px"/></a></div>
                    <div class="content">
                        <h5><a href="/MusicWeb/audio?id=${i.id}&artist_id=${i.artist_id}">${i.name}</a></h5>
                            <c:forEach items="${sessionScope.artists}" var="j" varStatus="loop">
                                <c:if test="${i.artist_id eq j.id}">
                                <p><a href="/MusicWeb/audio?id=${i.id}&artist_id=${i.artist_id}">${j.name}</a></p>
                                </c:if>
                            </c:forEach>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
