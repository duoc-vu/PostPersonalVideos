using Btl_web.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_web
{
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string memberName = Request.Form["username"];
            string memberPass = Request.Form["password"];
            string rememeberPass = Request.Form["repassword"];
            string email = Request.Form["email"];
            string mst = Request.Form["MST"];
            bool suscces;
            var dlistMember = Application[Global.MEMBER_LIST] as List<Member>;

            if (!string.IsNullOrEmpty(memberName) && !string.IsNullOrEmpty(memberPass) && !string.IsNullOrEmpty(rememeberPass))
            {
                dlistMember.Add(new Object.Member { MemberName = memberName, Password = memberPass  , UrlImg= "../Recourses/Img/DefaultAvatar.jpg" ,MST= mst});
                suscces = true;
            }
            else
            {
                suscces = false;
            }
            if(suscces)
            {
                Label1.Text = "Đăng ký thành công";
            }    
        }
    }
}