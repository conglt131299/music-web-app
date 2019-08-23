<%-- 
    Document   : index
    Created on : Jul 13, 2019, 7:05:07 PM
    Author     : Cong Le
--%>

<%@page import="model.Artist"%>
<%@page import="model.Song"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.HtmlHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/header.css" />
<link rel="stylesheet" href="css/container.css" />
<link rel="stylesheet" href="css/footer.css" />
<title>Music Website</title>

<script>
    $(document).ready(function(){
        $(".page-item").click(function(){
            $(".page-item").removeClass("active");
            $(this).addClass("active");
            var value = $(this).text();
            $.get("jsp/newSongPagination.jsp", {pageNumber:value}, function(data){
             $("#newSongPagination").html(data);
            });
        });
    });
</script>
</head>

<body>
    <jsp:directive.include file="header.jsp" />
    
    <%
//        ArrayList<Artist> artists = (ArrayList<Artist>) request.getAttribute("artists");
//        ArrayList<Song> songs = (ArrayList<Song>) request.getAttribute("songs");
//        ArrayList<Song> songSearch = (ArrayList<Song>) request.getAttribute("songSearch");
        Integer pageindex = (Integer)request.getAttribute("pageindex");
        Integer totalpage = (Integer)request.getAttribute("totalpage");
    %>
    
    <!-- Body of homepage-->
    <div class="container-fluid">
        
    	<!-- Carousel -->
        <div id="hot" class="carousel slide" data-ride="carousel">
        	<!-- Indicators -->
            <ul class="carousel-indicators">
            	<li data-target="#hot" data-slide-to="0" class="active"></li>
                <li data-target="#hot" data-slide-to="1"></li>
                <li data-target="#hot" data-slide-to="2"></li>
                <li data-target="#hot" data-slide-to="3"></li>
                <li data-target="#hot" data-slide-to="4"></li>
            </ul>
            <!-- The slideshow -->
            <div class="carousel-inner">
            	<div class="carousel-item active">
                	<img src="img/header.jpg" width="100%" height="651px"/>
                </div>
                <div class="carousel-item">
                	<img src="img/header1.jpg"  width="100%" height="651px"/>
                </div>
                <div class="carousel-item">
                	<img src="img/header2.jpg"  width="100%" height="651px"/>
                </div>
                <div class="carousel-item">
                	<img src="img/header3.jpg"  width="100%" height="651px"/>
                </div>
                <div class="carousel-item">
                	<img src="img/header4.jpg"  width="100%" height="651px"/>
                </div>
            </div>
        </div>        
    	<!-- Bai hat moi -->
    	<div id="baihatmoi" class="songs">
            <h1>BÀI HÁT MỚI</h1>
            <div id="newSongPagination" class="list_song" style="height: 550px;">
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
            </div>
            <ul class="pagination justify-content-center">
                <%=HtmlHelper.pager(pageindex, 3, totalpage) %>
            </ul>   
        </div>
        <!-- MV Hot -->
        <div id="mvhot" class="mvhot">
        	<h1>MV HOT</h1>
            <div class="row">
            	<div class="col-3">
                	<a href="#"><img src="http://vip.img.cdn.keeng.vn/sata11/video/images/2018/11/01/we0vwco5RAeSKUnjMLid5bda9f737f31e.jpg" width="280px" height="157,5px" /></a>
                    <h6><a href="#">Xin Lỗi Anh Quá Phiền</a></h6>
                    <p><a href="#">Đông Nhi</a></p>
                </div>
                <div class="col-3">          
                    <a href="#"><img src="http://vip.img.cdn.keeng.vn/sata11/video/images/2018/10/31/il1klMs4HYxfBm8qK5u25bd982cf09730.jpg" width="280px" height="157,5px" /></a>
                    <h6><a href="#">Without Me</a></h6>
                    <p><a href="#">Halsey</a></p>
                </div>
                <div class="col-3">
                        <a href="#"><img src="http://vip.img.cdn.keeng.vn/sata11/video/images/2018/10/30/WwKoRtTNJSfA4PW4eSpm5bd7d65cb1a18.jpg" width="280px" height="157,5px" /></a>
                        <h6><a href="#">Em Không Thể</a></h6>
                        <p><a href="#">Tiên Tiên ft Touliver</a></p>
                </div>
                <div class="col-3">
                        <a href="#"><img src="http://vip.img.cdn.keeng.vn/sata11/video/images/2018/10/29/vZvY9kQkbkX9flwQ5EkG5bd6a5d4191fc.jpg" width="280px" height="157,5px" /></a>
                        <h6><a href="#">Llegaste Tú</a></h6>
                        <p><a href="#">CNCO ft Prince Royce</a></p>
                </div>
            </div>
            <div class="row">
            	<div class="col-3">
                        <a href="#"><img src="http://vip.img.cdn.keeng.vn/sata11/video/images/2018/10/22/G9qIv1jRJwL8C62gDVc45bcd3361130dc.jpg" width="280px" height="157,5px" /></a>
                        <h6><a href="#">Những Kẻ Mộng Mơ</a></h6>
                        <p><a href="#">Noo Phước Thịnh</a></p>
                </div>
                <div class="col-3">
                        <a href="#"><img src="http://vip.img.cdn.keeng.vn/sata11/video/images/2018/10/29/QXlXI6Glg3qKQfRoomG15bd6a270437cf.jpg" width="280px" height="157,5px" /></a>
                        <h6><a href="#">DOPENESS</a></h6>
                        <p><a href="#">The Black Eyed Peas ft CL (2NE1)</a></p>
                </div>
                <div class="col-3">
                        <a href="#"><img src="http://vip.img.cdn.keeng.vn/sata11/video/images/2018/10/29/O3Ih3vZuA12jWiBQluMi5bd69f6621259.jpg" width="280px" height="157,5px" /></a>
                        <h6><a href="#">Em Đâu Biết</a></h6>
                        <p><a href="#">Rhymastic ft BigDaddy</a></p>
                </div>
                <div class="col-3">
                        <a href="#"><img src="http://vip.img.cdn.keeng.vn/sata11/video/images/2018/10/29/y18Lw0ncHSpEtUJRgMB75bd6a9a34c69d.jpg" width="280px" height="157,5px" /></a>
                        <h6><a href="#">I Don't Exist</a></h6>
                        <p><a href="#">Olivia O'Brien</a></p>
                </div>
            </div>
        </div>
        <!-- Nghe si noi bat -->
        <div id="nghesihot" class="famous">
        	<h1>NGHỆ SĨ NỔI BẬT</h1>
            <div class="content">
            	<div class="col-2">
                	<img class="zoom" src="http://vip.img.cdn.keeng.vn/sata11/images/images_thumb/f_sata11/singer/2018/10/12/8Yzt1fX7Io05ZJ4G13fb5bc00b59a4aab_310_310.jpg" width="165px" height="165px"/>
                    <h6>Bảo Anh</h6>
                </div>
                <div class="col-2">
                	<img class="zoom" src="http://vip.img.cdn.keeng.vn/sata11/images/images_thumb/f_sata11/singer/2017/04/07/LrCEbltcEDDzdExE2cTW58e70c40399c6_310_310.jpg" width="165px" height="165px"/>
                    <h6>Vũ Cát Tường</h6>
                </div>
                <div class="col-2">
                	<img class="zoom" src="http://vip.img.cdn.keeng.vn/sata11/images/images_thumb/f_sata11/singer/2017/04/26/3ZCchJsHOEr9r88kinPx5900572510e7e_310_310.jpg" width="165px" height="165px"/>
                    <h6>Phạm Quỳnh Anh</h6>
                </div>
                <div class="col-2">
                	<img class="zoom" src="http://vip.img.cdn.keeng.vn/sata11/images/images_thumb/f_sata11/singer/2017/04/19/o1O5yGNNLjwVZZiUVIdu58f6cd43b9ade_310_310.jpg" width="165px" height="165px"/>
                    <h6>Cao Thái Sơn</h6>
                </div>
                <div class="col-2">
                	<img class="zoom" src="http://vip.img.cdn.keeng.vn/sata11/images/images_thumb/f_sata11/singer/2017/07/04/KAwIDpNqBpkQ3CW5vm29595b7a8fe1334_310_310.jpg" width="165px" height="165px"/>
                    <h6>Lê Hiếu</h6>
                </div>
                <div class="col-2">
                	<img class="zoom" src="http://vip.img.cdn.keeng.vn/sata11/images/images_thumb/f_sata11/singer/2017/04/19/4xzDzKsFE8Fekd8rzbjq58f71de272a80_310_310.jpg" width="165px" height="165px"/>
                    <h6>Tiffany (SNSD)</h6>
                </div>
            </div>
        </div>
    </div>
    
    <!--Footer-->
    <jsp:directive.include file="footer.jsp" />
</body>
</html>

