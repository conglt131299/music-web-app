<%-- 
    Document   : audio
    Created on : Jul 14, 2019, 2:31:04 AM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous" />
        <link rel="stylesheet" href="css/header.css" />
        <link rel="stylesheet" href="css/audio_body.css" />
        <link rel="stylesheet" href="css/footer.css" />
        <title>${requestScope.song.name}</title>
    </head>

    <body>
        <!-- Header of homepage-->
        <jsp:directive.include file="header.jsp" />
        <!-- Container -->
        <div class="container">

            <!-- Quang cao -->
            <div style="margin-left: 80px; margin-bottom: 30px;"><img src="https://tpc.googlesyndication.com/daca_images/simgad/10188281390494921216" /></div>

            <!-- Noi dung -->
            <div class="row">
                <div class="col-8">
                    <h4>${requestScope.song.name} - <span style="font-weight: 100;">
                            <c:forEach items="${sessionScope.artists}" var="i" varStatus="loop">
                                <c:if test="${i.id eq requestScope.song.artist_id}">
                                    ${i.name}
                                </c:if>
                            </c:forEach>
                        </span>
                    </h4>
                    <h5><span style="font-weight: 100;">Sáng tác: </span>
                        <c:forEach items="${sessionScope.artists}" var="i" varStatus="loop">
                            <c:if test="${i.id eq requestScope.song.artist_id}">
                                ${i.name}
                            </c:if>
                        </c:forEach> 
                        - 
                        <span style="font-weight: 100;">Album: </span>Nhạc Việt</h5>
                    <h5><span style="font-weight: 100;">Thể loại: </span>Việt Nam, Nhạc Trẻ</h5>
                    <button type="button" class="btn-primary btn-md"><i class="far fa-thumbs-up"></i> Like</button>
                    <iframe auto width="715" height="402" src="${requestScope.song.song_link}?autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <button type="button" class="btn-default btn-md"><i class="fas fa-plus"></i>Thêm vào</button>
                    <button type="button" class="btn-default btn-md"><i class="fas fa-arrow-to-bottom"></i>Tải nhạc MP3</button>
                    <button type="button" class="btn-default btn-md"><i class="fas fa-comment"></i>Phản hồi</button>
                    <button type="button" class="btn-default btn-md"><i class="fas fa-share"></i>Chia sẻ</button>
                    <button type="button" class="btn-default btn-md"><i class="fas fa-headphones-alt"></i>Nghe Audio</button>
                    <span id="viewCount">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${requestScope.song.view_count} lượt xem
                    </span>

                    <div class="jumbotron">
                        <h5>Lời bài hát ${requestScope.song.name}</h5>
                        <p>Và giờ anh biết chuyện tình mình chẳng còn gì<br />
                            Khi nắng xuân sang lời mật ngọt còn thầm thì <br />
                            Em bước sang ngang đợi chờ một điều diệu kì <br />
                            Như lúc ban đầu <br />
                            Và giờ em khóc thì cũng chẳng để làm gì <br />
                            Đâu phải cho anh chuyện tình mình mà là vì <br />
                            Em đã trao ai, dòng lệ tràn đầy cầu kì <br />
                            Những năm tháng phai nhòa <br />
                            Nếu... <br />
                            Trái tim mình nói không nên lời <br />
                            Đắng cay từng tiếng yêu xa vời <br />
                            Thế là... <br />
                            Và hôm nay em đến <br />
                            Nhưng nắng đâu còn thiết tha gọi mời <br />
                            Gió âm thầm lướt qua muôn đời <br />
                            Vì ai vì ai <br />
                            Nếu... <br />
                            Đóa hoa hồng trước kia trở về <br />
                            Nhánh hương tình thoảng trên câu thề<br /> 
                            Anh ước rằng <br />
                            Rằng một mai a đến<br /> 
                            Anh đón em vào sớm mai trong lành<br /> 
                            Nhưng đó mãi là giấc mơ ko thành <br />
                            Vì ai vì ai... <br />
                            Vì giờ a biết chuyện tình mình chẳng còn gì <br />
                            Khi nắng xuân sang lời mật ngọt còn thầm thì <br />
                            Em bước sang ngang đợi chờ một điều diệu kì <br />
                            Như lúc ban đầu <br />
                            Và giờ em khóc thì cũng chẳng để làm gì <br />
                            Đâu phải cho anh chuyện tình mình mà là vì <br />
                            Nước mắt em rơi ,dòng lệ tràn đầy cầu kì <br />
                            Những năm tháng phai nhòa</p>
                    </div>
                </div>
                <div class="col-4">
                    <h3 style="font-weight: 100; padding: 0; margin-left: 15px;">TIẾP THEO</h3>
                    <ul>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/cover/d/9/4/c/d94c4005fce37250ba69b69544c965bd.jpg" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Còn Yêu, Đâu Ai Rời Đi</a></h6>
                                    <p><a href="#">Đức Phúc</a></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/cover/f/8/f/2/f8f2cd19c3e2e48603a510888807c363.jpg" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Em Không Thể</a></h6>
                                    <p><a href="#">Tiên Tiên, Touliver</a></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/cover/0/8/5/3/0853118a8d14808d8526bc717409ac90.jpg" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Đừng Như Thói Quen</a></h6>
                                    <p><a href="#">Jaykii, Sara Luu</a></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/cover/7/9/8/5/798559c5b7d028c351d34a37c7a598cc.jpg" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Vô Tình</a></h6>
                                    <p><a href="#">Xesi, Hoaprox</a></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/cover/9/d/5/c/9d5c56a277a06a48ec7956a4fd17e4c1.jpg" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Thằng Điên</a></h6>
                                    <p><a href="#">JustaTee, Phương Ly</a></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/cover/3/b/c/d/3bcd4a21a806a35f4b54f600b818faac.jpg" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Tận Cùng Nỗi Nhớ</a></h6>
                                    <p><a href="#">Will</a></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/cover/9/9/7/2/997250daaebfe5c1a8f29a5fce90248a.jpg" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Càng Níu Giữ Càng Dễ Mất</a></h6>
                                    <p><a href="#">Mr Siro</a></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/cover/b/3/4/e/b34eca53a228fdf9b3bd438518e2a8d4.jpg" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Người Ta</a></h6>
                                    <p><a href="#">Sĩ Thanh</a></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/covers/d/a/dad9377f8bda530f6b23f3f69ff385ed_1514879756.gif" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Sai Người Sai Thời Điểm</a></h6>
                                    <p><a href="#">Thanh Hưng</a></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/cover/5/6/4/2/564259a86e36010f6b80ac31210395ad.jpg" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Yêu Đơn Phương</a></h6>
                                    <p><a href="#">Only C, Karik</a></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/cover/e/2/7/1/e271782467a84390a22cb9a28301b0e9.jpg" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Đừng Quên Tên Anh</a></h6>
                                    <p><a href="#">Hoa Vinh</a></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/cover/a/9/0/8/a90839d864c557bc429152e90bc231f3.jpg" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Duyên Mình Lỡ</a></h6>
                                    <p><a href="#">Hương Tràm</a></p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-2"><a href="#"><img width="50px" height="50px" src="https://photo-zmp3.zadn.vn/thumb/94_94/cover/2/e/1/c/2e1ca4018e845d515a5c8c1bd20ec40e.jpg" /></a></div>
                                <div class="col-10">
                                    <h6><a href="#">Thanh Xuân</a></h6>
                                    <p><a href="#">Da LAB</a></p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Footer of webpage -->
        <jsp:directive.include file="footer.jsp" />
    </body>
</html>

