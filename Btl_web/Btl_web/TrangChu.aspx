<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="Btl_web.TrangChu" %>
<%@ import namespace ="Btl_web"  %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >   
    <link rel="stylesheet" href="font/fontawesome-free-6.4.2-web/css/all.min.css" />
    <link rel="stylesheet" href="Style/TrangChu.css" />

    <title>Home</title>
</head>
<body>
    <% Btl_web.Object.Member sM = Session[Global.MEMBER_NAME] as Btl_web.Object.Member;
        var dlstMember = Application[Global.MEMBER_LIST] as List<Btl_web.Object.Member>;
        
        var ten = ""; var avt = "";
        foreach ( var i in dlstMember)
        {
            if(i.MemberName == Request.QueryString["user"] )
            {
                ten = i.MemberName;
                avt = i.UrlImg;
            }
        }
        Session["img"] = avt;
        Session[Global.MEMBER_NAME] = ten;
        %>
    <header>
        <div class="header-left">
            <div class="logo">
                <img src="Recourses/Img/logo.png" />
            </div>
            <div>
                    <form id="form-U" class="form-Up" method="post" action="TrangChu.aspx?user=<%=Session[Global.MEMBER_NAME] %>" enctype="multipart/form-data">
                        <div class="up">
                            <label for="name">Name</label>
                            <input type="text" id="name" name="name" /><br />
                            <label for="detail">Detail</label>
                            <input id="detail" type="text" name="detail"/><br /><br />
                            <label id="up-video" for="file">Up Load</label>
                            <label id="LoiRongVideo"></label>
                            <input type="file" name="file" id="file"/><br />
                     
                             <button type="submit" id="btnSubmit">Đăng video</button>
                        </div>
                    </form>
                </div>
                <button id="upLoad">Up Load</button>
        </div>
        <%--<div class="para">
            <div class="Sign-up">
                <a href="DangNhap.aspx">Sign Up </a>
            </div>
        
            <div class="logout">
             <a href="XuLyLogOut.aspx?do=out"> Logout </a>
            </div>
            
        </div>--%>
        <div class="header-mid">
            <form class="form-Search" method="post" action="TrangChu.aspx" >
                <div class="search">
                    <input type="text" id="txtTenHang" name="txtTenHang" value="<% =Server.HtmlEncode(Request.Form["txtTenHang"]) %>"/>
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
                
            </form>
        </div>
        <div class="header-right">
            
            <div class="dropdown">
                    <img src="<%=Session["img"].ToString()%>" alt="avatar" id="img-avatar-user" />
                    <div class="dropdown-content">
                        <a href="TrangCaNhan.aspx?user=<%=ten %>" class="dropdown-item">Trang cá nhân</a>
                        <a href="SuaHoSo.aspx?user=<%=ten %>" class="dropdown-item">Chỉnh sửa hồ sơ</a>
                        <a class="dropdown-item" id="btnDangXuat" href="XuLyLogOut.aspx?do=out">Đăng xuất</a>
                    </div>
            
            </div>
        </div>
        
        
    </header>
        
        
<div class="content">

     <div class="side-bar">
          <ul class="list">
              <li><a href="TrangChu.aspx?user=<%= Session[Global.MEMBER_NAME].ToString() %>" >Trang Chủ</a></li>
               <li><a href="TrangLuuTru.aspx?user=<%=Session[Global.MEMBER_NAME].ToString() %>" >Video đã lưu</a></li>
           </ul>
      </div>

       <div id ="main-content">     
                
<% 
    var glstProduct = Application[Btl_web.Global.PRODUCT_LIST] as List<Btl_web.Object.Products>;
    var dlism = new List<Btl_web.Object.Member>();
    var dlisv = new List<Btl_web.Object.Products>();
    if (Request.Form["txtTenHang"] != null && !string.IsNullOrWhiteSpace(Request.Form["txtTenHang"]))
    {
        dlisv = glstProduct.FindAll(p => p.Name.IndexOf(Request.Form["txtTenHang"], StringComparison.CurrentCultureIgnoreCase) >= 0);
        dlism = dlstMember.FindAll(p => p.MemberName.IndexOf(Request.Form["txtTenHang"], StringComparison.CurrentCultureIgnoreCase) >= 0);
        foreach (var p in dlisv)
        {
            foreach (var i in dlstMember)
            {
                if (p.nguoiDang.Equals(i.MemberName))
                {
    %>          
                 <div class="Pro-Pro">
             <div class ="products" >
                 <a href="TrangCaNhan.aspx?user=<%= i.MemberName %>">
                     <div class="user-title">
                           <div class="nguoi-dang">
                             <img src="<% = i.UrlImg %>" /> 
                           </div>
                            <div class="post"> 
                                <div class="user-name">
                                <b>
                                    <%= i.MemberName %>
                                </b>
                             </div>
                            <div class="detail-post"> <%=p.Detail %></div>
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
                                 <div class="delete">
                                 <a href="XuLyXoaVideo.aspx?cn=<%=p.Id %>"><i class="fa-regular fa-trash-can fa-2xl"></i></a>
                         </div>
                  </div>
                       </div>
                     <%--<label ><%= p.soLuot %></label>--%>
                 
                 <div class="hr" ></div>
              </div>
                
    <%}
                }
            }
            foreach(var i in dlism)
                {%>
                <a href="TrangCaNhan.aspx?user=<%= i.MemberName %>">
                         <div class="user-title">
                               <div class="nguoi-dang">
                                 <img src="<% = i.UrlImg %>" /> 
                               </div>
                                <div class="user-name">
                                     <%= i.MemberName %>
                                 </div>
                           </div>
                      </a>
              <%  }                
        }

        else
        {


            foreach (var p in glstProduct)
            {
                foreach (var i in dlstMember)
                {
                    if (p.nguoiDang.Equals(i.MemberName))
                    {
%>          <div class="Pro-Pro">
             <div class ="products" >
                 <a href="TrangCaNhan.aspx?user=<%= i.MemberName %>">
                     <div class="user-title">
                           <div class="nguoi-dang">
                             <img src="<% = i.UrlImg %>" /> 
                           </div>
                            <div class="post"> 
                                <div class="user-name">
                                <b>
                                    <%= i.MemberName %>
                                </b>
                             </div>
                            <div class="detail-post"> <%=p.Detail %></div>
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
                                 <div class="delete">
                                 <a href="XuLyXoaVideo.aspx?cn=<%=p.Id %>"><i class="fa-regular fa-trash-can fa-2xl"></i></a>
                         </div>
                  </div>
                       </div>
                     <%--<label ><%= p.soLuot %></label>--%>
                 
                 <div class="hr" ></div>
              </div>
               
    </div>
            
<%}
            }
        }
    };%>
    
        </div>
    </div>
    
    <footer>
        <p>Duoc Vu</p>
    </footer>
        
        <script >
            function toggleOptions(menuId) {
                var optionsMenu = document.getElementById(menuId);
                optionsMenu.style.display = (optionsMenu.style.display === 'block') ? 'none' : 'block';
            }
        </script>
    <script src="Script/TrangChu.js"></script>
</body>
</html>
