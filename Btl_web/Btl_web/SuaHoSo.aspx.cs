﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_web
{
    public partial class SuaHoSo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.UrlReferrer!= null && !string.IsNullOrEmpty(Request.QueryString["loi"]) )
            {
                LoiSaiTaiKhoan.InnerText = "Nhap chua dung";
            }
        }
    }
}