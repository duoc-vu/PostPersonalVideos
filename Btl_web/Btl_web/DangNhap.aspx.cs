using Btl_web.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_web
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.UrlReferrer!= null && !string.IsNullOrEmpty(Request.QueryString["loi"]))
            {
                passwordError.InnerText = "Nhập sai tài khoản hoặc mật khẩu";
            }

            //if (DateTime.Parse(Session["tg"].ToString()).CompareTo(DateTime.Now) > 0 )
            //{
                
            //    sub.Attributes["Disabled"] = "Disabled";
            //}
            //else
            //{
            //    if (int.Parse(Session["dem"].ToString()) == 3)
            //    {
            //        sub.Attributes.Remove("Disabled");
            //        Session["dem"] = 0;
            //    }
            //}
        }
    }
}