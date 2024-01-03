using Btl_web.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_web
{
    public partial class XuLyXoaCN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dlstVideo = Application[Global.PRODUCT_LIST] as List<Products>;
            foreach (var v in dlstVideo)
            {
                if (v.Id == int.Parse(Request.QueryString["cn"]))
                {
                    dlstVideo.Remove(v);
                    Response.Redirect("TrangCaNhan.aspx?user=" + Session[Global.MEMBER_NAME]);
                    break;
                }
            }
        }
    }
}