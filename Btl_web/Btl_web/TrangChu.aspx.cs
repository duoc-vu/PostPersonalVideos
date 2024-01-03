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
    public partial class TrangChu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            var glstProduct = Application[Btl_web.Global.PRODUCT_LIST] as List<Btl_web.Object.Products>;
            HttpPostedFile file = Request.Files["file"];
            string name = Request.Form["name"];
            string detail = Request.Form["detail"];
            if (file != null && file.ContentLength > 0)
            {
                string fileName = Path.GetFileName(file.FileName);
                string filePath = Path.Combine(Server.MapPath("~/Recourses/Video"), fileName);

                file.SaveAs(filePath);
                glstProduct.Insert( 0 ,new Products() { Name = name, Detail = detail, Id = glstProduct.Count, VideoUrl = "../Recourses/Video/" + fileName ,  nguoiDang = Session[Global.MEMBER_NAME].ToString() });
            }


            if (Request.QueryString["do"] != null && Request.QueryString["do"].Equals("out"))
            {

                Response.Redirect("DangKy.aspx?user="  );
                Session[Global.MEMBER_NAME] = "guest";
            }
        }
    }
}