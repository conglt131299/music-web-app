<%-- 
    Document   : signup
    Created on : Jul 13, 2019, 7:15:28 PM
    Author     : Cong Le
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/signup.css" />
<link rel="stylesheet" href="css/header.css" />
<title>Sign Up</title>
</head>

<body>
	<!-- Header of homepage-->
         <jsp:directive.include file="header.jsp" />
    
    <!-- Sign up -->
    <div class="signup">

    	<h3>Đăng ký thành viên mới</h3>
        <h6>Quý khách vui lòng điền đầy đủ thông tin bên dưới</h6>
        <form action="signup" method="POST">
            <input class="form-control" type="email" placeholder="Email" name="email" id="email" required="required" /><br />
            <input class="form-control" type="text" placeholder="Họ tên đầy đủ" name="name" id="full_name" required="required"/><br />
            <input class="form-control" type="text" placeholder="Tên đăng nhập" name="username" id="login_name" required="required"/><br />
            <input class="form-control" type="password" placeholder="Mật khẩu" name="pwd" id="pwd" required="required"/><br />
            <input class="form-control" type="password" placeholder="Xác nhận mật khẩu" name="re_enterpwd" /><br />
            <div class="input-group">
            	<select name="day" id="date">
                	<optgroup label="Date">
                    	<option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                        <option>13</option>
                        <option>14</option>
                        <option>15</option>
                        <option>16</option>
                        <option>17</option>
                        <option>18</option>
                        <option>19</option>
                        <option>20</option>
                        <option>21</option>
                        <option>22</option>
                        <option>23</option>
                        <option>24</option>
                        <option>25</option>
                        <option>26</option>
                        <option>27</option>
                        <option>28</option>
                        <option>29</option>
                        <option>30</option>
                        <option>31</option>
                    </optgroup>
                </select>
                <select name="month" id="month">
                	<optgroup label="Month">
                    	<option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                    </optgroup>
                </select>
                <select name="year" id="year">
                	<optgroup label="Year">
                    	<option>1999</option>
                        <option>2000</option>
                        <option>2001</option>
                        <option>2002</option>
                        <option>2003</option>
                    </optgroup>
                </select>
            </div><br />
            Giới tính: &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="Nam" id="gender"/>Nam&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="gender" value="Nữ"/>Nữ<br /><br />
            <input class="form-control" type="submit" value="ĐĂNG KÝ"/>
        </form>
        <h6 style="margin-top: 25px;">Nếu bạn đã có tài khoản Keeng, trở về trang chủ để đăng nhập</h6>
        <div style="width: 100px; height: 30px; background-color: green; margin: auto; border-radius: 10px; margin-top: 10px;"><a style="color: white; font-weight: bold; text-decoration: none; text-align: center; line-height: 30px;" href="/MusicWeb/login?from=${requestScope['javax.servlet.forward.servlet_path']}">Đăng nhập</a></div>
        <p id="demo"></p>
    </div>
</body>
</html>

