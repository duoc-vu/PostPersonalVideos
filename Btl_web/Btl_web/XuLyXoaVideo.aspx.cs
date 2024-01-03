using Btl_web.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_web
{
    public partial class XuLyXoaVideo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dlstVideo = Application[Global.PRODUCT_LIST] as List<Products>;
            foreach (var v in dlstVideo)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"])&& v.Id == int.Parse(Request.QueryString["id"]))
                {
                    dlstVideo.Remove(v);
                    Response.Redirect("TrangChu.aspx?user=" + Session[Global.MEMBER_NAME]);
                    break;
                }
            }

            foreach (var v in dlstVideo)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["cn"]) && v.Id == int.Parse(Request.QueryString["cn"]))
                {
                    dlstVideo.Remove(v);
                    Response.Redirect("TrangCaNhan.aspx?user=" + Session[Global.MEMBER_NAME]);
                    break;
                }
            }



        }
    }
}