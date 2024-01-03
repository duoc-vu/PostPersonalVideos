using Btl_web.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Btl_web
{
    public class Global : System.Web.HttpApplication
    {

        public const string MEMBER_LIST = "MenberList";
        public const string MEMBER_NAME = "MemberName";
        public const string PRODUCT_LIST = "DSSP";
        public const string SAVE_LIST = "DSSV";
        public const string ONL_LIST = "ONL";
   
        protected void Application_Start(object sender, EventArgs e)
        {
            Application[MEMBER_LIST] = createAListOfMember();
            Application[PRODUCT_LIST] = createProductList();
            Application[SAVE_LIST] = createSaveList();
            Application[ONL_LIST] = createOnlList();
        }

        private object createOnlList()
        {
            return new List<string>()
            {

            };
        }

        private List<Products> createSaveList()
        {
            return new List<Products>()
            {
                new Products { Id = 4, Name = "Video Thể thao mạo hiểm", Detail = "Video ghi lại những pha hành động thể thao mạo hiểm đầy phấn khích và đầy thách thức", VideoUrl = "video3.mp4" ,  nguoiDang = "Duoc Vu"},
                new Products { Id = 5, Name = "Video Học nấu ăn", Detail = "Video hướng dẫn cách nấu ăn các món ngon đơn giản và ngon miệng", VideoUrl = "video4.mp4" ,  nguoiDang = "Phan Trang"},
                new Products { Id = 6, Name = "Video Phim hoạt hình", Detail = "Video phim hoạt hình vui nhộn và cảm động cho mọi lứa tuổi", VideoUrl = "video5.mp4" , nguoiDang = "Phan Trang"},
                new Products { Id = 7, Name = "Video Phim hoạt hình", Detail = "Video phim hoạt hình vui nhộn và cảm động cho mọi lứa tuổi", VideoUrl = "video5.mp4" , nguoiDang = "Duocvu"}

            };
        }

        private List<Products> createProductList()
        {
            return new List<Products>()
            {
                new Products { Id = 0, Name = "Video Nghệ thuật đường phố", Detail = "Video ghi lại những biểu diễn nghệ thuật đường phố đầy sáng tạo và ấn tượng", VideoUrl = "video3.mp4" , nguoiDang="Duoc Vu"},
                new Products { Id = 1, Name = "Video Du lịch thiên nhiên", Detail = "Video khám phá những vùng đất hoang sơ và đẹp tự nhiên trên khắp thế giới", VideoUrl = "video4.mp4" ,nguoiDang="Duoc Vu" },
                new Products { Id = 2, Name = "Video Âm nhạc EDM", Detail = "Video âm nhạc với những giai điệu điện tử sôi động và hấp dẫn", VideoUrl = "video5.mp4" , nguoiDang="Duoc Vu" },
                new Products { Id = 3, Name = "Video Hướng dẫn làm đồ thủ công", Detail = "Video hướng dẫn từng bước làm các đồ thủ công độc đáo và sáng tạo", VideoUrl = "video6.mp4", nguoiDang="Duoc Vu"},
                new Products { Id = 4, Name = "Video Thể thao mạo hiểm", Detail = "Video ghi lại những pha hành động thể thao mạo hiểm đầy phấn khích và đầy thách thức", VideoUrl = "video3.mp4" ,  nguoiDang = "Duoc Vu"},
                new Products { Id = 5, Name = "Video Học nấu ăn", Detail = "Video hướng dẫn cách nấu ăn các món ngon đơn giản và ngon miệng", VideoUrl = "video4.mp4" ,  nguoiDang = "Phan Trang"},
                new Products { Id = 6, Name = "Video Phim hoạt hình", Detail = "Video phim hoạt hình vui nhộn và cảm động cho mọi lứa tuổi", VideoUrl = "video5.mp4" , nguoiDang = "Phan Trang"},
                new Products { Id = 7, Name = "Video Phim hoạt hình", Detail = "Video phim hoạt hình vui nhộn và cảm động cho mọi lứa tuổi", VideoUrl = "video5.mp4" , nguoiDang = "Duocvu"}

            };

        }

        private List<Member> createAListOfMember()
        {
            return new List<Member>
            {
                new Member{MemberName="Duoc Vu" , Password = "1" , UrlImg="../Recourses/Img/avt.png" , Bio = "Basketball edits"},
                new Member{MemberName="Phan Trang" , Password = "1" , UrlImg="../Recourses/Img/avt2.png" , Bio = "Basketball edits"}
            };

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["img"] = "";
            Session[MEMBER_NAME] = "guest";
            //Session.Timeout = 1; // Đặt thời gian session timeout là 5 phút
            //Response.AddHeader("Refresh", "30"); // Refresh trang sau 5 phút (300 giây)
            //Session["dem"] = 0 ;
            //Session["tg"] = new DateTime();
            
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}