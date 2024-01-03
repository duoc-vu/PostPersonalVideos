<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangCaNhan.aspx.cs" Inherits="Btl_web.TrangCaNhan" %>
<%@ import namespace ="Btl_web"  %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >   
    <link rel="stylesheet" href="font/fontawesome-free-6.4.2-web/css/all.min.css" />
    <link rel="stylesheet" href="Style/TrangCaNhan.css" />

    <title>Trang Cá Nhân</title>
</head>
<body>
    <%  
        var glstMem = Application[Btl_web.Global.MEMBER_LIST] as List<Btl_web.Object.Member>;
        var glstProduct = Application[Btl_web.Global.PRODUCT_LIST] as List<Btl_web.Object.Products>;

        var ten = ""; var avt = ""; var bio="";var y = "";var mst = "";
        foreach( var x in glstMem )
        {
            if(x.MemberName == Request.QueryString["user"])
            {
                ten = x.MemberName;
                avt = x.UrlImg;
                bio = x.Bio;
                mst = x.MST;
            }
            if(x.MemberName == Session[Global.MEMBER_NAME].ToString())
            {
                y = x.UrlImg;
            }
        }%>
    <header>
        <div class="logo">
            <img src="Recourses/Img/logo.png" />
        </div>
        
        
        <div class="dropdown">
                <img src="<%= y%>" alt="avatar" id="img-avatar-user" />
                <div class="dropdown-content">
                    <a href="TrangCaNhan.aspx?user=<%=Session[Global.MEMBER_NAME]%>" class="dropdown-item">Trang cá nhân</a>
                    <a href="SuaHoSo.aspx?user=<%=Session[Global.MEMBER_NAME]%>" class="dropdown-item">Chỉnh sửa hồ sơ</a>
                    <a class="dropdown-item" id="btnDangXuat" href="XuLyLogOut.aspx?do=out">Đăng xuất</a>
                </div>
        </div>
        
        
    </header>
        <%--<form class="form-Search" method="post" action="TrangChu.aspx" >
            <b><label for="txtTenHang">Ten Hang</label></b>
            
            <input type="text" id="txtTenHang" name="txtTenHang" value="<% =Server.HtmlEncode(Request.Form["txtTenHang"]) %>"/>
            <input type="submit" value="Tim" />
        </form>--%>

<div class="content">

     <div class="side-bar">
          <ul class="list">
              <li><a href="TrangChu.aspx?user=<%=Session[Global.MEMBER_NAME] %>" >Trang Chủ</a></li>
               <li><a href="TrangLuuTru.aspx?user=<%=Session[Global.MEMBER_NAME] %>" >Video đã lưu</a></li>
           </ul>
      </div>

<div id ="main-content"> 
           <div class="profile">
                     <div id="imgs"><img src="<%=avt %>"/></div>
                    <div id="details">
                        <p id="name"><b><%=ten %></b></p>
                        <p id="bio"> <%= bio %></p>
                        <p id="bio"><%= mst %></p>
                    </div>
               
            </div>
<%

    
    foreach (var p in glstProduct)
    {
        if (p.nguoiDang.Equals(ten))
        {
%>          
           <div class="Pro-Pro">
             <div class ="products" >
                 <a href="TrangCaNhan.aspx?user=<%= ten %>">
                     <div class="user-title">
                           <div class="nguoi-dang">
                             <img src="<% = avt %>" /> 
                           </div>
                            <div class="post"> 
                                <div class="user-name">
                                <b>
                                    <%= ten %>
                                </b>
                             </div>
                            <div class="detail-post"> <%=p.Detail %> </div>
                            </div>
                       </div>
                     
                 </a>
                 
                      <div class="videoss">
                           <div>
                               <a href="ChiTietSp.aspx?id=<%=p.Id %>">
                                   <video controls >
                                    <source src="Recourses/video/<% =p.VideoUrl %>" 
                                     title ="<%=p.Name %>"
                                     alt="<%=p.Name %>" 
                                     type="audio/mp4"/>
                                     </video>
                                   </a>
                           </div>

                          <div class="ics" >
                               <div class="save">
                                   <a href="XuLyVideoLuuTru.aspx?cn=<%=p.Id %>"><i class="fa-regular fa-bookmark fa-2xl"></i></a>
                               </div>
                              
                              <%if (p.nguoiDang.Equals(Session[Global.MEMBER_NAME].ToString()))
                                  {  %>
                                 <div class="delete">
                                      <a href="XuLyXoaVideo.aspx?cn=<%=p.Id %>"><i class="fa-regular fa-trash-can fa-2xl"></i></a>
                                </div>
                              <%} %>
                         </div>
                       </div>
                     <%--<label ><%= p.soLuot %></label>--%>
                 
                 <div class="hr" ></div>
              </div>
               </div>
              <%--<div class="ics" >
                  <button class="hoverss" onclick="toggleOptions('product_<%=p.Id%>')">
                       <i class="fa-solid fa-ellipsis-vertical"></i>
                   </button>

                   <ul class="sub-menu" id="product_<%=p.Id%>">
                        <li><a href="TrangLuuTru.aspx?id<%=p.Id %>">Lưu video</a></li>
                        <li><a href="#">Sửa video</a></li>
                         <li><a href="XuLyXoaVideo.aspx?id=<%= p.Id %>">Xóa video</a></li>
                    </ul>
               </div>--%>
<%}
    };%>
</div>
    <%--<form runat="server">
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click"/>
    </form>--%>
</div>

    <%var list = Application[Global.ONL_LIST] as List<string>;
        var listu = Application[Global.ONL_LIST] as List<Btl_web.Object.xemVideo>;
            foreach ( var i in list)
            {
                %>
                <label class="userss"> Có <%= i %> đang xem !</label><br />
                 <%
            }     %>
    <footer>
        <p>Duoc Vu</p>
    </footer>
</body>
</html>
