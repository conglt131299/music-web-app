<%-- 
    Document   : header
    Created on : Jul 14, 2019, 7:56:43 PM
    Author     : Cong Le
--%>

<%@page import="model.Song"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.BaseAuthenticationController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <body>
        <%
            BaseAuthenticationController bac = new BaseAuthenticationController();
            boolean loginResult = bac.isAutheticated(request);
            
            String contextRelativePath = "";
            String queryString = request.getQueryString();
            if(queryString != null){
                contextRelativePath += "?" + queryString;
            }
        %>
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
                    
                    <%if(loginResult) {%>
                        <c:set var="loginResult" value="${true}" />
                    <%} else {%>
                        <c:set var="loginResult" value="${false}" />
                    <%}%>
                    
                    <c:choose>
                        <c:when test="${loginResult}">
                            <li class="nav-item pr-2 dropdown"><a class="nav-link" data-toggle="dropdown" href="#">${sessionScope["user"].name}</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="/MusicWeb/profile">Thông tin cá nhân</a>
                                    <a class="dropdown-item" href="#nghesihot">Bài hát yêu thích</a>
                                    <a class="dropdown-item" href="/MusicWeb/change_password">Đổi mật khẩu</a>
                                    <a class="dropdown-item" href="/MusicWeb/logout">Đăng xuất</a>
                                </div>
                            </li>
                        </c:when>    
                        <c:otherwise>
                            <li class="nav-item pr-2"><a class="nav-link" href="/MusicWeb/signup">Đăng ký</a></li>
                            <li class="nav-item"><a class="nav-link" href="/MusicWeb/login?from=${requestScope['javax.servlet.forward.servlet_path']}<%=(contextRelativePath)%>">Đăng nhập</a></li>
                            <li class="nav-item mt-1"><img src="img/keeng_ver5_02.png" /></li>
                        </c:otherwise>
                    </c:choose>
                    
                </ul>  	
            </nav>
        </header>
                    
        
    </body>
</html>
