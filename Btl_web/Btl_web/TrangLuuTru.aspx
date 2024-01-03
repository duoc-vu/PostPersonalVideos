<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangLuuTru.aspx.cs" Inherits="Btl_web.TrangLuuTru" %>
<%@ Import namespace="Btl_web" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Style/TrangLuuTru.css" />
    <link rel="stylesheet" href="font/fontawesome-free-6.4.2-web/css/all.min.css" />
    <title>Lưu trữ video</title>
</head>
<body>
    <%
        var glstSave = Application[Btl_web.Global.SAVE_LIST] as List<Btl_web.Object.Products>;
        var glstMem = Application[Btl_web.Global.MEMBER_LIST] as List<Btl_web.Object.Member>;
        var glstProduct = Application[Btl_web.Global.PRODUCT_LIST] as List<Btl_web.Object.Products>;

        var ten = ""; var avt = ""; var bio="";
                       foreach( var x in glstMem )
                        {
                            if(x.MemberName == Request.QueryString["user"])
                            {
                                ten = x.MemberName;
                                avt = x.UrlImg;
                                bio = x.Bio;
                            }
                        }
        Session["img"] = avt;
        Session[Global.MEMBER_NAME] = ten;
        %>
     <header>
        <div class="logo">
            <img src="Recourses/Img/logo.png" />
        </div>
        
        <div class="dropdown">
                <img src="<%=Session["img"].ToString()%>" alt="avatar" id="img-avatar-user" />
                <div class="dropdown-content">
                    <a href="TrangCaNhan.aspx?user=<%=ten %>" class="dropdown-item">Trang cá nhân</a>
                    <a href="SuaHoSo.aspx?user=<%=ten %>" class="dropdown-item">Chỉnh sửa hồ sơ</a>
                    <a class="dropdown-item" id="btnDangXuat" href="XuLyLogOut.aspx?do=out">Đăng xuất</a>
                </div>
            
        </div>
        
       </header>

        <div class="content">

            <div class="side-bar">
                <ul class="list">
                    <li><a href="TrangChu.aspx?user=<%=Session[Global.MEMBER_NAME] %>" >Trang Chủ</a></li>
                    <li><a href="TrangLuuTru.aspx?user=<%=Session[Global.MEMBER_NAME] %>"  >Video đã lưu</a></li>
                </ul>
            </div>

        <div id ="main-content"> 
<%
    foreach (var p in glstSave)
    {
        foreach (var i in glstMem)
        {
            if(p.nguoiDang.Equals(i.MemberName))
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
            <%
                }
        }
                }; %>
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
</body>
</html>
