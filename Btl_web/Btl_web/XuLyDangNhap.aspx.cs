using Btl_web.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_web
{
    public partial class XuLyDangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string memberName = Request.Form["username"];
            string memberPass = Request.Form["password"];
            bool loginSuccess = false;
            //DateTime d = new DateTime();


            if (!string.IsNullOrEmpty(memberName) && !string.IsNullOrEmpty(memberPass))
            {

                /// xử lý login
                var list = Application[Global.ONL_LIST] as List<string>;
                List<Member> glstMembers = Application[Global.MEMBER_LIST] as List<Member>;
                Member member = glstMembers.Find(m => m.MemberName.Equals(memberName,
                    StringComparison.CurrentCultureIgnoreCase));

                if (member != null)
                {
                    loginSuccess = member.Password.Equals(memberPass);
                }

                if (loginSuccess)
                {
                    Session[Global.MEMBER_NAME] = memberName;
                    Session["img"] = member.UrlImg;
                    if (!list.Contains(memberName))
                    {
                        list.Add(member.MemberName);
                    }
                    Response.Redirect("TrangChu.aspx?user=" + member.MemberName);
                    
                }
                else
                {
                    //Session["dem"] = Int32.Parse(Session["dem"].ToString()) + 1;
                    //if (int.Parse(Session["dem"].ToString()) == 3)
                    //{
                    //    Session["tg"] = DateTime.Now.AddSeconds(30);
                    //}
                    Response.Redirect("DangNhap.aspx?loi=true");

                }


                //if (Int32.Parse(Session["dem"].ToString()) == 3)
                //{
                //    passwordError.InnerHtml = "<b>Ban da dang nhap qua 3 lan !!</b>";
                //    d = DateTime.Now.AddMinutes(1);
                //    Session["tg"] = d;
                //    sub.Attributes["Disabled"] = "Disabled";
                //}

                //Response.Write(DateTime.Now.CompareTo(DateTime.Parse(Session["tg"].ToString())) + Session["dem"].ToString());

                //if (DateTime.Now.CompareTo(DateTime.Parse(Session["tg"].ToString())) > 0)
                //{
                //    sub.Attributes.Remove("Disabled");
                //}
            }
        }
    }
}