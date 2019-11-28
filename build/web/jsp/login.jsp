<%-- 
    Document   : login
    Created on : Jul 13, 2019, 7:15:03 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/login.css" />
        <link rel="stylesheet" href="css/header.css" />
        <title>Login</title>
    </head>

    <body>
        <%
            String url = request.getParameter("from");
            String artist_id = request.getParameter("artist_id");
            if (artist_id != null) {
                url += "&" + "artist_id=" + artist_id;
            }
        %>
        <!-- Header of homepage-->
        <!-- Header of homepage-->
        <header>
            <!-- Navigation -->
            <nav class="navbar navbar-expand-sm justify-content-center">
                <ul class="navbar-nav">
                    <li class="nav-item pr-2"><a class="nav-link navbar-brand" href="/MusicWeb/home"><img src="img/logo_keeng.png" /></a></li>
                    <li class="nav-item pr-2 dropdown"><a class="nav-link" data-toggle="dropdown" href="#">PHIM</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Hành động</a>
                            <a class="dropdown-item" href="#">Võ thuật</a>
                            <a class="dropdown-item" href="#">Hài hước</a>
                            <a class="dropdown-item" href="#">Tình cảm</a>
                            <a class="dropdown-item" href="#">Viễn tưởng</a>
                            <a class="dropdown-item" href="#">Phiêu lưu</a>
                        </div>
                    </li>
                    <li class="nav-item pr-2 dropdown"><a class="nav-link" data-toggle="dropdown" href="#">NHẠC</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/MusicWeb/#baihatmoi">Bài hát mới</a>
                            <a class="dropdown-item" href="/MusicWeb/#nghesihot">Nghệ sĩ hot</a>
                            <a class="dropdown-item" href="/MusicWeb/audio_chart">Bảng xếp hạng</a>
                            <a class="dropdown-item" href="/MusicWeb/#mvhot">MV</a>
                        </div>
                    </li>
                    <li class="nav-item pr-2 mt-2">
                        <form class="form-inline">
                            <input id="myInput" onkeyup="myFunction()" class="mr-1" type="text" placeholder="Tìm kiếm từ khóa..." size="60"/>
                            <jsp:directive.include file="searchResult.jsp" />
                            <input type="button" value="Tìm kiếm"/>
                        </form>
                    </li>
                    <li class="nav-item pr-2"><a class="nav-link" href="/MusicWeb/signup">Đăng ký</a></li>
                    <li class="nav-item"><a class="nav-link" href="/MusicWeb/login">Đăng nhập</a></li>
                    <li class="nav-item mt-1"><img src="img/keeng_ver5_02.png" /></li>
                </ul>  	
            </nav>
        </header>

        <div class="signin">

            <div class="row">
                <div class="col-6">
                    <h3>Đăng nhập</h3>
                    <h6>Quý khách vui lòng đăng nhập</h6>
                    <form action="login" method="POST">
                        <input class="form-control" type="text" name="user" id="user" placeholder="Tên tài khoản" required="required"/><br />
                        <input class="form-control" type="password" name="pwd" id="pwd" placeholder="Mật khẩu" required="required"/><br />
                        <input class="form-control" type="submit" value="ĐĂNG NHẬP""/>
                        <input type="checkbox" name="remember" value="remember"/> Remember me
                        <input type="hidden" name="from" value="<%=url%>">
                    </form>
                    <br/>
                    <%
                        if (request.getAttribute("loginResult") != null && request.getAttribute("loginResult").equals("true")) {
                    %>
                    <p style="color: red;">* Tên tài khoản hoặc mật khẩu không chính xác</p>
                    <% }
                    %>
                    <a href="/MusicWeb/reset_password" style="border-radius: 1em; border: 1px solid;
                       text-decoration: none; padding: 3px;">Quên mật khẩu</a>
                    <h6 style="margin-top: 6px;">Để lấy lại mật khẩu:</h6>
                    <h6>Khách hàng Viettel, soạn KEENG gửi 5005</h6>
                </div>
                <div class="col-6">
                    <h3>Đăng nhập bằng mã QR Code</h3>
                    <h6>Bước 1: <span>Mở ứng dụng Keeng</span></h6>
                    <h6>Bước 2: <span>Mở phần đăng nhập bằng QR</span></h6>
                    <h6>Bước 3: <span>Quét mã QR dưới đây</span></h6>
                    <img src="http://vip.img.cdn.keeng.vn/sata11/images/qrcode_keeng/2018-11-01-13/k5pw8g3580rzi60pr13po7w2.png" />
                </div>
            </div>

        </div>
    </body>
</html>

