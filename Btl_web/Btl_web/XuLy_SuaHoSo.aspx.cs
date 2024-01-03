using Btl_web.Object;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_web
{
    public partial class XuLy_SuaHoSo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dlistMember = Application[Global.MEMBER_LIST] as List<Member>;

            HttpPostedFile file = Request.Files["file-anh"];
            string tenDangNhap = Request.Form["txtTenDangNhap"];
            string matKhauCu = Request.Form["txtMatKhauCu"];
            string matKhauMoi = Request.Form["txtMatKhauMoi"];

            
            foreach (var m in dlistMember)
            {
                if (tenDangNhap.Equals(m.MemberName))
                {
                    if (matKhauCu.Equals(m.Password))
                    {
                        if (matKhauMoi != null && !string.IsNullOrEmpty(matKhauMoi))
                        {
                            m.Password = matKhauMoi;
                        }

                        if (file != null && file.ContentLength > 0)
                        {
                            string a = "1";
                            string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(file.FileName);
                            string fileExtension = Path.GetExtension(file.FileName);
                            string filePath = Server.MapPath("~/Recourses/Img") + "\\" + fileNameWithoutExtension + fileExtension;
                            while (File.Exists(filePath))
                            {
                                fileNameWithoutExtension = fileNameWithoutExtension + a;
                                filePath = Server.MapPath("~/Recourses/Img") + "\\" + fileNameWithoutExtension + fileExtension;

                            }
                            file.SaveAs(filePath);
                            m.UrlImg = "../Recourses/Img/" + fileNameWithoutExtension + fileExtension;

                        }
                        Session[Global.MEMBER_NAME] = m.MemberName;
                        Response.Redirect("TrangCaNhan.aspx?user=" + m.MemberName);
                    }
                }
            }
            Response.Redirect("SuaHoSo.aspx?user=" + Session[Global.MEMBER_NAME] + "&loi=true");
        }
    }
}