<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="Btl_web.DangKy" %>
<!DOCTYPE html>
<html>
<head>
  <title>Đăng ký</title>
  <link rel="stylesheet" href="Style/DangKy2.css" />
</head>
<body>
    <header>
        <div class="logo">
            <img src="Recourses/Img/logo.png" />
        </div>
        <div class="para">
            <div class="Sign-up">
                <a href="DangNhap.aspx">Sign Up </a>
            </div>
        
            <div class="logout">
             <a href="DangNhap.aspx?do=out"> Logout </a>
            </div>
        </div>
        
        
    </header>
    <div class="main">
        <h1>Đăng ký</h1>
        <form id="registrationForm" onsubmit="validateForm(event)" method="post" action="DangKy.aspx">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="username">
            <span id="usernameError" class="error"></span>
            <br><br>
            <label for="email">Email:</label>
            <input type="text" id="email" name="email">
            <span id="emailError" class="error"></span>
            <br><br>
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password">
            <br><br>
            <label for="repassword">Xác nhận mật khẩu:</label>
            <input type="password" id="repassword" name="repassword">
            <label for="MST">MST</label>
            <input type="text" id="MST" name="MST"/>
            <span id="passwordError" class="error"></span>
            <asp:Label ID="Label1" runat="server"></asp:Label>

              <div class="links">
                  <a href="DangNhap.aspx">Bạn đã có tài khoản? Đăng nhập</a>
              </div>
            <input type="submit" value="Đăng ký">
          </form>
    </div>
  
  
  
  <footer>
        <p>Duoc Vu</p>
    </footer>
  <script src="Script/DangKy.js">
      
  </script>
</body>
</html>