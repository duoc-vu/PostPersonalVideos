<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuaHoSo.aspx.cs" Inherits="Btl_web.SuaHoSo" %>
<%@ Import Namespace="Btl_web" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chỉnh sửa hồ sơ</title>
    <link rel="stylesheet" href="Style/SuaHoSo.css" />
</head>
<body>
        <%
            Btl_web.Object.Member sM = Session[Global.MEMBER_NAME] as Btl_web.Object.Member;
            var dlstMember = Application[Global.MEMBER_LIST] as List<Btl_web.Object.Member>;
            var dlstVideo = Application[Global.PRODUCT_LIST] as List<Btl_web.Object.Products>;
            var ten = ""; var avt = "";
            foreach (var i in dlstMember)
            {
                if (i.MemberName == Request.QueryString["user"])
                {
    %>
    <header>
        <div class="logo">
            <img src="Recourses/Img/logo.png" />
        </div>
        
        
        <div class="dropdown">
                <img src="<%= i.UrlImg%>" alt="avatar" id="img-avatar-user" />
                <div class="dropdown-content">
                    <a href="TrangCaNhan.aspx?user=<%=i.MemberName%>" class="dropdown-item">Trang cá nhân</a>
                    <a href="SuaHoSo.aspx?user=<%=i.MemberName%>" class="dropdown-item">Chỉnh sửa hồ sơ</a>
                    <a class="dropdown-item" id="btnDangXuat" href="XuLyLogOut.aspx?do=out">Đăng xuất</a>
                </div>
        </div>
        
    </header>
    
    <div class="content">

     <div class="side-bar">
          <ul class="list">
              <li><a href="TrangChu.aspx?user=<%= Session[Global.MEMBER_NAME].ToString() %>"" >Trang Chủ</a></li>
               <li><a href="TrangLuuTru.aspx?user=<%= Session[Global.MEMBER_NAME].ToString() %>"" >Video đã lưu</a></li>
           </ul>
      </div>
        <div class="form-doi-thong-tin">
            <form method="post" action="XuLy_SuaHoSo.aspx" enctype="multipart/form-data" >
                <h1>Chỉnh sửa hồ sơ</h1>
                <img src="<% = i.UrlImg%>" alt="avatar"/>
                <label for="file-anh">Đổi ảnh</label>
                <input type="file" id="file-anh" name="file-anh" />
                <label for="txtTenDangNhap">Tên đăng nhập</label>
                <input type="text" id="txtTenDangNhap" name="txtTenDangNhap" />
                <label for="txtTenDangNhap" id="LoiRongTenDangNhap" class="Loi">Bạn phải nhập tên đăng nhập</label>
                <label for="txtTenDangNhap" id="LoiSaiTaiKhoan" runat="server"></label>
                <label for="txtMatKhauCu">Mật khẩu cũ</label>
                <input type="text" id="txtMatKhauCu" name="txtMatKhauCu" />
                <label for="txtMatKhauCu" id="LoiRongMatKhauCu" class="Loi">Bạn phải nhập mật khẩu cũ</label>
                <label for="txtMatKhauMoi">Mật khẩu mới</label>
                <input type="text" id="txtMatKhauMoi" name="txtMatKhauMoi" />
                <label for="txtNhapLaiMatKhauMoi" >Nhập lại mật khẩu mới</label>
                <input type="text" id="txtNhapLaiMatKhauMoi" name="txtNhapLaiMatKhauMoi" />
                <label for="txtNhapLaiMatKhauMoi" id="LoiLapLaiMatKhau" class="Loi">Nhập lại mật khẩu không đúng</label>
                <br />
                <button id="btnHuySuaHoSo" type="button" onclick="window.location.href='TrangCaNhan.aspx?user=<%= i.MemberName%>'" > Hủy</button> 
                <button type="submit" id="btnXacNhanSuaHoSo">Xác nhận</button>
            </form>
        </div>
    </div>
    <%         break;
            }
        }%>
    <footer>
        <p>Duoc Vu</p>
    </footer>
    <script src="../JS/SuaHoSo.js"></script>
</body>
</html>