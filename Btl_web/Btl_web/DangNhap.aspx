<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="Btl_web.DangNhap" %>
<%@ Import namespace="Btl_web" %>
<!DOCTYPE html>
<html>
<head>
  <title>Đăng nhập</title>
    <link href="Style/DangNhap2.css" rel="stylesheet" />
</head>
<body>
    
    <%if (Session[Global.MEMBER_NAME] == "guest")
        {
%>

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
            <%--<div class="user">
                <a href="#"> Xin chào <%=Session[Global.MEMBER_NAME]  %></a>
            </div>--%>
        </div>
        
    </header>
      <div class="main">
           <h1>Đăng nhập</h1>
          <form id="loginForm" onsubmit="validateForm(event)" method="post" action="XuLyDangNhap.aspx">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="username">
            <span id="usernameError" class="error"></span>
            <br><br>
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password">
            <span id="passwordError" class="error" runat="server"></span>
              <div class="links">
                  <a href="DangKy.aspx">Bạn chưa có tài khoản? Đăng kí</a>
              </div>
            <input id="sub" type="submit" value="Đăng nhập" runat="server">
          </form>

          <%--<button id ="btn">hehe</button>--%>
      </div>
      
  

    <footer>
        <p>Duoc Vu</p>
    </footer>
  
  <script src="Script/DangNhap.js"></script>

    
    <%}else
        {
            Response.Redirect("TrangChu.aspx?user=" + Session[Global.MEMBER_NAME]);
        } %>
    
</body>
</html>
