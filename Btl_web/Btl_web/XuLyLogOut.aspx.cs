using Btl_web.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_web
{
    public partial class XuLyLogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var list = Application[Global.ONL_LIST] as List<string>;
            if (Request.UrlReferrer != null)
            {
                //for(var i = 0; i < list.Count(); i++)
                //{
                //    if (list[i].Equals(Session[Global.MEMBER_NAME].ToString()))
                //    {
                //        list.Remove(list[i]);
                //    }    
                //}    
                Session[Global.MEMBER_NAME] = "guest";
                Response.Redirect("DangNhap.aspx");
            }
        }
    }
}