using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_web
{
    public partial class XuLyVideoLuuTru : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var glstProduct = Application[Btl_web.Global.PRODUCT_LIST] as List<Btl_web.Object.Products>;
            var glstSave = Application[Btl_web.Global.SAVE_LIST] as List<Btl_web.Object.Products>;
            var ten = "";
            var chuThich = "";
            var video = "";
            var id = 0;
            foreach (var x in glstProduct)
            {
                if (x.Id == int.Parse(Request.QueryString["cn"]) && !string.IsNullOrEmpty(Request.QueryString["cn"]))
                {
                    id = x.Id;
                    ten = x.Name;
                    chuThich = x.Detail;
                    video = x.VideoUrl;
                    glstSave.Insert(0, new Btl_web.Object.Products { Id = id, Name = ten, Detail = chuThich, VideoUrl = video , nguoiDang = x.nguoiDang });
                    Response.Redirect("TrangChu.aspx?user=" + Session[Global.MEMBER_NAME]);
                }
            }
        }
    }
}